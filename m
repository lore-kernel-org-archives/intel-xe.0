Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF2C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 06:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289E310F1A9;
	Thu, 13 Aug 2026 06:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3fCslr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA53610F1A3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786603609; x=1818139609;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UPwNAH4okyDO2uWkI5Un/CymCAOcNfrgoqFpUB/DNho=;
 b=N3fCslr9zIZF02Zq7NMTD8d2CdAIFj64VTVltacI723532UcfvwzNqDK
 0BswGPYGHkUxtG1zMTVNjvUsBrsabiNFf//Hh+P6Pl39Lm2m6spCYCtU9
 EtbCCPGswvvkNQJCYZQh0bGWw8ddCfBpfLCbniAB//2PXX3Q4DHzfMcWH
 IsOi8zIfLC96w+sLw+4F6Z73F3BnnchQCB/s7cpS53+WCT5PBtpkVUCXD
 YghuvVBj+f+De95v0PM1+AdQne3C6WVJrjnxsacZ4eGPZHRPSdkNL61Fu
 BrjQqiSzE3swP6VbAH+ZNNoQywnEsjF72T19XZxPrUxbHAFfwBAW8bpYo g==;
X-CSE-ConnectionGUID: GzLGqt5iSCik6YCCTJRvuA==
X-CSE-MsgGUID: ZAA0eRg+QmyhCFHFy1Iqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104555070"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="104555070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:46:48 -0700
X-CSE-ConnectionGUID: PWrWyhSpTQyf3ed3F+WI7w==
X-CSE-MsgGUID: ek+4amTNQk+N1S1/fhyv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="264436935"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:46:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:46:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 23:46:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op/L+WyBumVrMmSdLTQOPMgtQLVkyhG9xgk8UbJLrr6szarRSPaEAwfsfhuR609mhf1JJU1VH+bph72Kh3DgQ4s8bP6c+J9pZCF9lF1E9vON/us3qJv/TlMHz89kOf6ctBx+eMfv4BhAgEC7r5cGGYbZwpg4H7KQYSvnx2xf/CTWGoh7iq7DXuSSysKASmbhdm6kZ7s9hVMYj+w6A9pmgrVACDhlIzG983WcwyehrzKtyGxGcrTLWibgAQ1VrKtO1YeXUiBt9q9uVKxtT98MJroW2Alq9IfahDbEOsC89WPBpeC1DY92s7bzaK9cH604H3Yxx+vfd1sRSsOfXRE4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5aaDJa7TFOAbypzgnyz4jAl6fDKiQm3E1n891AgMLo=;
 b=f+QnlYjsXsrWS9PV4g166FUVQtkZ0C6a0zO3r/mes9ljDV0sXg9GlbrIlM8I8y3gtw6FkvcL5upa11FT7aMbw+/6bLXLaajz2yxnaz2DDTBWTVdGI6IrgGoU3qt38A76go+nac00T0LUXyy0OL0Y8doAryMa5GdvYltkVzk8VijLzmfTssmc34FnKqqipcViSqSxRIXoHlRvXIC1NmsC6UdHb+/+ZSwy8O5rR5Pa8IJnzE4tA6Pp/crL57M8SUi2l7mLQRErKhM0fG3hjDG6Z716/ssTqjWETOSpTHemC/zb09Xj1Yg2ABaV/tFFSTP7V4DDTxn600Dd42XaRs3zVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 06:46:44 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 06:46:44 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug
 handling
Thread-Topic: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug
 handling
Thread-Index: AQHdKZGbe1u+44/BxkamM2IlWS5Zz7abim7w
Date: Thu, 13 Aug 2026 06:46:44 +0000
Message-ID: <DS0PR11MB8718AAEB16F9428E7AB7C79C81DB2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
 <20260811133753.1742666-5-nitin.r.gote@intel.com>
In-Reply-To: <20260811133753.1742666-5-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA1PR11MB6807:EE_
x-ms-office365-filtering-correlation-id: 9410bd77-2902-495d-59af-08def906a3c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021|10067099003|6133799003;
x-microsoft-antispam-message-info: +Tzg4tbW/x31rp41i1RdaspFrjsNL8lniEXIr9IWxbZ/wht8xtiHFWC9h438Kv4jwHYi+dXQSJJeH6UmILg+SRr8aysm/P2cK0AlncABqY1btfvc3jnjvx4VJ9YU3o9r5yTz2HKHkHV2avOSHmyqxxEjVgnjLKc8d3hpZOShL0iQTG9hU5hhwh5Pd3NBlK/j1U028Yp3ubKYFyyxHC3NbhNxySFUP4uFRra5fAr9car2RvkFaIW67IyolVJI584CYxq17POkKl/MQWSynYSLjBBfjZTAHEin/8RcylFZrHJeazegf2FfAQSJT1pxXgITwiT8Iqufc5wNwYlq8iG9p0xxKATOrGiBrQiKSQUkd3LyAW4GSTsC7lMwPLOqVqzep3kdjT/p/miBkv22LqjQwXvSe7GsUAeDsRV1ige2rK8+iyRMWcwUk1UytQyRbN72NAy0SH/ivuqbVweWco+81clV756BX7X6kQdm2AIhhJpuLCBIqRmkprQnK7DqkLzER6vBNINBBUAdTqpuk2SA1Cg5FwYDKkVzE3u/e2gsv+F4rFcO+sEuR4sS/oYqQXFU9+2sSkLaH+yvQntj9874djEIPvxWH9HiGL3VoFF+NwbpiumqZD29VrFhMUeEy9JKGImL3HyPFvRdClaS3fiGO5OzkHG94jTBdsoMpZIpzpg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/kPIi5TvgmmyN9UEFvSvLyXNykrMEqyArC8KMqlsRkNBn43E1J2J2RIr3Lti?=
 =?us-ascii?Q?vrgYDNcj4xnX/+E5B4y36SFalFkWdA/VvBq0BnTLWN2Q7IeCbG2ZS1EP/LON?=
 =?us-ascii?Q?ZqjS4Ou3rbTSzHNIr3IHKmXL0wtSngu1ObdDl1M4P+rB4UUg3hp75uXxYsqe?=
 =?us-ascii?Q?J3PXo/UgHC7QozK4dnliLrNzj93KehPkUeYbMiQ+Tzp3sT6azNRhQEI1JEdE?=
 =?us-ascii?Q?t9Nh22NwmKnA6aZjLXo6VeyEccM08m9G0g4/tG4ziFOUSdO2Qh2TlCBMvQpr?=
 =?us-ascii?Q?x5j4ChXsW+s1qoDpvbFZ2p1gTHNwURJJhNX+jZaelmQDn1MAK8azV8xtU+06?=
 =?us-ascii?Q?HudBGn4EQxb02eymjPl/y24SyMkBeDKKsX2TV3bmCLds45WUksJX8a98vPOz?=
 =?us-ascii?Q?4sojVkinULDwI3o3hKHt/PhQEw3LnFnWXhD7YDbp+VC8kY6wbr4/+C+g0XZ2?=
 =?us-ascii?Q?JE1okx1TNtMmpC/aXMJWy9o9XFdwnM5IWMuW/uxOCWnvfHc38pNTNfso6jXc?=
 =?us-ascii?Q?Am5a7wRZB6Csa6jZmlAESAGYbh3pADH5Ga+bXJ9FQ2+6M2QkoPyqWZDnPzkE?=
 =?us-ascii?Q?u4U2W629teJM4qpZLpC23NbiWql1jarSJS9StOFA4hKipNT6oUP63NYY02eD?=
 =?us-ascii?Q?fa84HM7piDUl8SZslk75BJMPSHbWOgMc2Ig/wMIHnUshyvdY3CHDJASV+24m?=
 =?us-ascii?Q?YDqavLgz9LaBYxZgbnHJCjnOrjgbWhWHpXkhfx7ZE8t4tGuXHaYBn1Is5Ogd?=
 =?us-ascii?Q?vCmxsmFct6kkmFuOKdf18HNrlmLqzcEV9qE+bQukDFhP7hTwzY/TJ1bZZV1x?=
 =?us-ascii?Q?9AR2p4gjhnREYVISmGmDzXsbrX81MnNndFP9+br0/VqgPnszIcGWtmCgv8ji?=
 =?us-ascii?Q?mpz6LpoIJHbV+ZyJvEBRs9yivlCQDYLCwjMyPoNV43m+ymxpn8D135uyWz8u?=
 =?us-ascii?Q?tGwlUL+YOMMwqs3uHDLPbGGSbLrGYZqecjRtqtbJirLzlJZnFoBYFTyJWTpN?=
 =?us-ascii?Q?OCRTVX65Ay1r/LjPBFYUhA7J0RG4Sd9y3Tw4x6mMBufb1lKFMFbHx7/Fadl4?=
 =?us-ascii?Q?JmzpivnRkEudVEMWNNlAHPjTRZKsf5yG1i0cJmrCqvKdBUBs4CyxxCN3V/Ab?=
 =?us-ascii?Q?xnpkmDSKqpCOWMniVRE9HjwCQZZdfPtGEpEQfkV8D0KwltsfgimG22iaafJ8?=
 =?us-ascii?Q?1UrEzGp5U2QzAlPUF6bWNrdYP8M+ao49Vh5u5QlgZeN7cz4N+p+wL6WBqtgp?=
 =?us-ascii?Q?EPPNq1O+MxZ22qfC85mMmMHUSDHbxUEW/vBzguogbyyKPrJMQ3n1Ayt+bIif?=
 =?us-ascii?Q?zkc/02J3qJyBdSpH4i6kBW9pTXE3QvaBYhtR62kDf/vLfYkrmQpPsytXn+cs?=
 =?us-ascii?Q?mgOcDwucDGEArO33MfC1VqrNgGtfSZw9S18RlQdjYG8CuqENOnPdTxEksN0O?=
 =?us-ascii?Q?XofsT45/XbPeWBFgz2XA4dsADJTyZXQJrakEqMGPUrz7zhbT5g9+ftb8jXSV?=
 =?us-ascii?Q?mCZwHKVufbnykElKRIx/I+7SG8FhoxClQTcA87nEo2L0bzFKlZnUWD44/NbU?=
 =?us-ascii?Q?7aw5/TaVkKKRmyFqYPjuHMxYNM04vTd+fgOU1vdqSxpxZjp3XJtshIS4OBbY?=
 =?us-ascii?Q?I676fqB+5qqW3oyfhrGu+u7X67LuzzWCtb4RHd0XO8L+27ZB2HTtT7OGBrGb?=
 =?us-ascii?Q?ACVm54mM5l/aLbCXvqxAxSVZU3UlvvqbYxmplU2Sn/c7nqaA/6MnqcSRFiMa?=
 =?us-ascii?Q?C+rbNzCB4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RtveGXmW0uG2Ul9Kqf1fs27ROV8fzSWkadsQZB8S+pG6A3q91R7jeVCYHp7XOW5K4mnFw7Lz2cAsWU2N77r33iXJE4kjcwT6lTzRY7SGJboDg0yDhPUGVdu5nSF4DgmlzvG3iTLf6uIcgjIH/YAcLpTZcuWftLxntJW8ec1F4vKsML2C5ADfhrhxIWacJo6vLpsHvClHjtoUDWLrvMgnkUw1JeVeB/gQGz5Z25dr13jGb6u99JZmwhTmsXkcaqYLzZLB02X3Kdi5NOm6W4XXoArg0SjbWcjfrx4dvfIdLURQ4VhoJqavZT+X+2CyvEyfVdwoY0gshNE0v6kAllqmQA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9410bd77-2902-495d-59af-08def906a3c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 06:46:44.5015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4q1Uam48siBdNxiIwOogMHVsSkKjczzggXRlmwNwyMDvXrItYBGC6HnFhRcLqCbWCcMMTzEiuFuFQkCg2cnMG8TR18M+dQ0+YCrQD0oih8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Niti=
n
> Gote
> Sent: 11 August 2026 19:08
> To: intel-xe@lists.freedesktop.org
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Jadav, Raag <raag.jadav@intel.com>
> Subject: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug
> handling
>=20
> The core_hotunplug "with-load" subtests trigger a "Missing outer runtime =
PM
> protection" warning when an exec queue is torn down from a deferred fd cl=
ose
> after the device has been hot-unplugged:
>=20
>   guc_exec_queue_add_msg
>   guc_exec_queue_destroy
>   xe_exec_queue_destroy
>   xe_file_close
>=20
> The reference is not actually missing. On unplug the PCI core disables ru=
ntime
> PM (device_del() -> __pm_runtime_disable()) while the old drm_device is k=
ept
> alive by the still-open fd. Once runtime PM is disabled
> pm_runtime_get_if_in_use() returns -EINVAL regardless of the usage count,
> so xe_pm_runtime_get_noresume() can no longer observe the held reference
> and warns.
>=20
> drm_dev_unplug() always runs before runtime PM is disabled, so gate the
> message submission layer on the bound state instead of the PM reference:
>=20
>  - guc_exec_queue_add_msg(): only take the noresume PM reference while
>    drm_dev_enter() succeeds and record it in the message (MSG_PM_REF), so
>    the put in guc_exec_queue_process_msg() stays balanced.
>=20
>  - guc_exec_queue_process_msg(): re-check the bound state and skip each
>    handler's HW access once the device is gone.
>=20
>  - guc_exec_queue_destroy(): always post the CLEANUP message; the cleanup
>    handler issues the deregister H2G only while bound, registered, fw
>    running and not wedged, otherwise it tears down on the driver side.
>=20
> Also document the post-unplug PM-reference hazard in
> xe_pm_runtime_get_noresume().
>=20
> Observed with new IGT core_hotunplug subtests:
>   igt@core_hotunplug@hotreplug-with-load
>   igt@core_hotunplug@hotunplug-rescan-with-load

Looked at this patch, it looks like this memory cleanup was required(looks =
like just a software cleanup no HW access) in kernel & user cases when unpl=
ug happens.
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
> v2:
>  - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
>    and instead exclude hot-unplug from the WARN in
>    xe_pm_runtime_get_noresume().
>=20
> v3:
>  - Rework the fix in the message-submission layer instead of touching the
>    WARN; gate PM/HW work on drm_dev_enter() and route all queues through
>    the CLEANUP message. (Matthew Brost)
>  - Prove the root cause (runtime PM disabled on unplug, not a zero
>    refcount) and record it in the commit message. (Matt B, Raag)
>  - Also remove EXEC_QUEUE_FLAG_PERMANENT flag in
>    separate patch (Matthew Brost)
>=20
> Link:
> https://patchwork.freedesktop.org/patch/725773/?series=3D166744&rev=3D4
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 98 ++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_pm.c         |  5 ++
>  2 files changed, 56 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..80b69f7d0dc9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1812,32 +1812,15 @@ static void
> __guc_exec_queue_destroy_async(struct work_struct *w)  static void
> guc_exec_queue_destroy_async(struct xe_exec_queue *q)  {
>  	INIT_WORK(&q->guc->destroy_async,
> __guc_exec_queue_destroy_async);
> -
> -	/* We must block on kernel engines so slabs are empty on driver
> unload */
> -	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT ||
> exec_queue_wedged(q))
> -		guc_exec_queue_do_destroy(q);
> -	else
> -		xe_destroy_wq_queue(&q->guc->destroy_async);
> -}
> -
> -static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
> xe_exec_queue *q) -{
> -	/*
> -	 * Might be done from within the GPU scheduler, need to do async as
> we
> -	 * fini the scheduler when the engine is fini'd, the scheduler can't
> -	 * complete fini within itself (circular dependency). Async resolves
> -	 * this we and don't really care when everything is fini'd, just that i=
t
> -	 * is.
> -	 */
> -	guc_exec_queue_destroy_async(q);
> +	xe_destroy_wq_queue(&q->guc->destroy_async);
>  }
>=20
> -static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> *msg,
> +						 bool bound)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
> -	xe_gt_assert(guc_to_gt(guc), !(q->flags &
> EXEC_QUEUE_FLAG_PERMANENT));
>  	trace_xe_exec_queue_cleanup_entity(q);
>=20
>  	/*
> @@ -1850,10 +1833,12 @@ static void
> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>  	 *   it is safe to directly destroy the exec queue on driver side, as t=
he
> GuC
>  	 *   will not process further requests and all resources must be cleane=
d
> up locally.
>  	 */
> -	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> +	/* A wedged GuC won't answer the H2G, so tear down on the driver
> side. */
> +	if (bound && !exec_queue_wedged(q) && exec_queue_registered(q)
> &&
> +	    xe_uc_fw_is_running(&guc->fw))
>  		disable_scheduling_deregister(guc, q);
>  	else
> -		__guc_exec_queue_destroy(guc, q);
> +		guc_exec_queue_destroy_async(q);
>  }
>=20
>  static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue
> *q) @@ -1861,12 +1846,13 @@ static bool
> guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
>  	return !exec_queue_killed_or_banned_or_wedged(q) &&
> exec_queue_registered(q);  }
>=20
> -static void __guc_exec_queue_process_msg_set_sched_props(struct
> xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_set_sched_props(struct
> xe_sched_msg *msg,
> +							 bool bound)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
> -	if (guc_exec_queue_allowed_to_change_state(q))
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound)
>  		init_policies(guc, q);
>  	kfree(msg);
>  }
> @@ -1904,13 +1890,14 @@ static void suspend_fence_signal(struct
> xe_exec_queue *q)
>  	__suspend_fence_signal(q);
>  }
>=20
> -static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg
> *msg,
> +						 bool bound)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
>  	if (guc_exec_queue_allowed_to_change_state(q) &&
> !exec_queue_suspended(q) &&
> -	    exec_queue_enabled(q)) {
> +	    exec_queue_enabled(q) && bound) {
>  		wait_event(guc->ct.wq, vf_recovery(guc) ||
>  			   ((q->guc->resume_time !=3D RESUME_PENDING ||
>  			   xe_guc_read_stopped(guc)) &&
> !exec_queue_pending_disable(q))); @@ -1934,11 +1921,12 @@ static void
> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  	}
>  }
>=20
> -static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> *msg,
> +						bool bound)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
>=20
> -	if (guc_exec_queue_allowed_to_change_state(q)) {
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound) {
>  		clear_exec_queue_suspended(q);
>  		if (!exec_queue_enabled(q)) {
>  			q->guc->resume_time =3D RESUME_PENDING; @@ -
> 1950,17 +1938,19 @@ static void
> __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>  	}
>  }
>=20
> -static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct
> xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct
> xe_sched_msg *msg,
> +								  bool bound)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
>=20
> -	if (guc_exec_queue_allowed_to_change_state(q))
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound)
>  		guc_exec_queue_send_cgp_sync(q, 0);
>=20
>  	kfree(msg);
>  }
>=20
> -static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg
> *msg,
> +						  bool bound)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
>=20
> @@ -1969,7 +1959,7 @@ static void
> __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
>  	 * CGP update + CGP_SYNC (re-applies the current priority from
>  	 * q->multi_queue.priority).
>  	 */
> -	if (guc_exec_queue_allowed_to_change_state(q))
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound)
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
>=20
> @@ -1982,37 +1972,45 @@ static void
> __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> +#define MSG_PM_REF	BIT(10)
>=20
>  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
>  	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(msg-
> >private_data));
> +	int idx;
> +	bool pm_ref =3D !!(msg->opcode & MSG_PM_REF);
> +	bool bound =3D drm_dev_enter(&xe->drm, &idx);
>=20
>  	trace_xe_sched_msg_recv(msg);
>=20
> -	switch (msg->opcode) {
> +	switch (msg->opcode & OPCODE_MASK) {
>  	case CLEANUP:
> -		__guc_exec_queue_process_msg_cleanup(msg);
> +		__guc_exec_queue_process_msg_cleanup(msg, bound);
>  		break;
>  	case SET_SCHED_PROPS:
> -		__guc_exec_queue_process_msg_set_sched_props(msg);
> +		__guc_exec_queue_process_msg_set_sched_props(msg,
> bound);
>  		break;
>  	case SUSPEND:
> -		__guc_exec_queue_process_msg_suspend(msg);
> +		__guc_exec_queue_process_msg_suspend(msg, bound);
>  		break;
>  	case RESUME:
> -		__guc_exec_queue_process_msg_resume(msg);
> +		__guc_exec_queue_process_msg_resume(msg, bound);
>  		break;
>  	case SET_MULTI_QUEUE_PRIORITY:
> -
> 	__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> +
> 	__guc_exec_queue_process_msg_set_multi_queue_priority(msg,
> bound);
>  		break;
>  	case CGP_SYNC_MSG:
> -		__guc_exec_queue_process_msg_cgp_sync(msg);
> +		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
>  		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
>=20
> -	xe_pm_runtime_put(xe);
> +	if (pm_ref)
> +		xe_pm_runtime_put(xe);
> +
> +	if (bound)
> +		drm_dev_exit(idx);
>  }
>=20
>  static const struct drm_sched_backend_ops drm_sched_ops =3D { @@ -
> 2137,10 +2135,16 @@ static void guc_exec_queue_kill(struct xe_exec_queue
> *q)  static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct
> xe_sched_msg *msg,
>  				   u32 opcode)
>  {
> -	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> +	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(q));
> +	int idx;
> +	bool bound =3D drm_dev_enter(&xe->drm, &idx);
>=20
>  	INIT_LIST_HEAD(&msg->link);
>  	msg->opcode =3D opcode & OPCODE_MASK;
> +	if (bound) {
> +		xe_pm_runtime_get_noresume(xe);
> +		msg->opcode |=3D MSG_PM_REF;
> +	}
>  	msg->private_data =3D q;
>=20
>  	trace_xe_sched_msg_add(msg);
> @@ -2150,6 +2154,9 @@ static void guc_exec_queue_add_msg(struct
> xe_exec_queue *q, struct xe_sched_msg
>  		xe_sched_add_msg_locked(&q->guc->sched, msg);
>  	else
>  		xe_sched_add_msg(&q->guc->sched, msg);
> +
> +	if (bound)
> +		drm_dev_exit(idx);
>  }
>=20
>  static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
> @@ -2182,10 +2189,7 @@ static void guc_exec_queue_destroy(struct
> xe_exec_queue *q)  {
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs +
> STATIC_MSG_CLEANUP;
>=20
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> !exec_queue_wedged(q))
> -		guc_exec_queue_add_msg(q, msg, CLEANUP);
> -	else
> -		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> +	guc_exec_queue_add_msg(q, msg, CLEANUP);
>  }
>=20
>  static int guc_exec_queue_set_priority(struct xe_exec_queue *q, @@ -2650=
,7
> +2654,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct
> xe_exec_queue *q)
>  	}
>=20
>  	if (do_destroy)
> -		__guc_exec_queue_destroy(guc, q);
> +		guc_exec_queue_destroy_async(q);
>  }
>=20
>  static int guc_submit_reset_prepare(struct xe_guc *guc) @@ -3296,7
> +3300,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct
> xe_exec_queue *q)
>  	trace_xe_exec_queue_deregister_done(q);
>=20
>  	clear_exec_queue_registered(q);
> -	__guc_exec_queue_destroy(guc, q);
> +	guc_exec_queue_destroy_async(q);
>  }
>=20
>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len=
)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> a5289a9df8d2..f517bf453b54 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -905,6 +905,11 @@ static bool xe_pm_suspending_or_resuming(struct
> xe_device *xe)
>   * break scope-based handling, or when the lifetime of the runtime PM
> reference
>   * does not match a specific scope (e.g., runtime PM obtained in one fun=
ction
>   * and released in a different one).
> + *
> + * This helper assumes the caller already holds a runtime PM reference
> + and
> + * only warns when it cannot see one. After hot-unplug runtime PM is
> + disabled
> + * and the check fails even when a reference is held, so callers that
> + may run
> + * after unplug must guard it with drm_dev_enter()/drm_dev_exit() instea=
d.
>   */
>  void xe_pm_runtime_get_noresume(struct xe_device *xe)  {
> --
> 2.50.1

