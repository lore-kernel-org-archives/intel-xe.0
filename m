Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC120C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 14:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5D10EC37;
	Tue,  8 Sep 2026 14:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAtXh6wD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140D10EC37
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788878561; x=1820414561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QBEQUW3K4YpY8nsmHYbXSBP+bZCMFFSZK3aP54l4gx8=;
 b=AAtXh6wDPGEGX41CDsGf8GBgMPRxWPjTQ8YGz6Q/bX09AfGs7/NA3vT2
 E5kwVdEYxv4i6Zyc2JeZmY+qc/eJDALr5Qcm3mCMxzI1V1ViXZcyfLytx
 64K43iiBW9DuinVNhomffdpu3fVvET5W5spU3jMeRgJIAVthTznx4qJFk
 AF6Iv5iVdl6oDGPdkHwl5lhPGpM7qG4X3Y5KTBT2MAq7+ClFRoRRk+2Uq
 Ds44poCZH2VUyR9zDr0f39lpf6LVp1PJFkVFHYJsDTq+XeRZ+s2jL53hb
 8qMnNGGpzEz3D9ofMmGydwJbdNwAmXbEfu2OaVDb8Oq16MonTM9aNfj4o g==;
X-CSE-ConnectionGUID: DCfQtrzvQTKnUMogub+E3w==
X-CSE-MsgGUID: fus9FA3JQQegAEqJo8huvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89312908"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89312908"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:42:40 -0700
X-CSE-ConnectionGUID: FmN9qxm6RMq+xsa/yspCUQ==
X-CSE-MsgGUID: /BwcW7BOR8q8a0/Plz4k2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="271534015"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:42:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 07:42:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 07:42:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 07:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9XpU7GVR1UijecPw8aVsoSPTtGxgNVTnNMsWjy+ahQSWaiDIcw1loZbCNNUAV36D1F+2YiM0KTk+d8OgGHZn+LzWcIOVNk6riSniGpBp6H4pxQFO9ah8o1/+sD6oPgO2cp6WLvYVKTiaSR6qd3sImIeBY/uBKQID4/EEcMIRqd1/mxFHK8i5V/BiY4zXOS3GUYPRUoNjnudOo7VqAcoUgkpBXRIoS+nY5KkPz/+td6iHZgZQpmcGWlaRGIHUXtU+Rq44Gm97Cocon1SNVr5nkW2XRP7qOR6QsQS34Y/S+zvoFp5C3nDInUQY9H/oRSzVXlEKEts3K09+jsUWZ9MCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Khy1wkrU0SBvPpJ4lmRachXq/YvULD5RrkdfM7c80=;
 b=d5osG19QIWqWETwthbwi7S42TBVPIAnC7kcjYsJyilyVIdFz+kfufmHU3p8pq1n2eiTL9Mvacj6bUwxJzZ/9IbodTlmrNx6RW7kRbJPMGRG5V/EGvT628bR5NIU69cYkfu4NxgDxqo9GoXUl0jk8lJYwkFxo5U4mIurdmMdNFpT+yeLsyFz/aXuS98C6SBM+10IO8Hjq3Q5eBwM+sY5Rox2mg4K2shV73zVjubJypTTINkJwBV2Ja7f4Qv3sA4Ee9cplLU3VcvKZLZw34v1ngPIVUQOptD6r36hgIKLO4pbgeyfNwelkG7LSluzD/aphsDroku6HkK9/czfGVnqpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 14:42:22 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 14:42:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
Subject: RE: [PATCH v4] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Topic: [PATCH v4] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Index: AQHdP0L5zCCtSrcZwkmf4pXDNHTV4LbEwd6g
Date: Tue, 8 Sep 2026 14:42:22 +0000
Message-ID: <DS0PR11MB8718E5B09A0D348D0792A2D581B12@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260908033417.1019602-2-varun.gupta@intel.com>
In-Reply-To: <20260908033417.1019602-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB7399:EE_
x-ms-office365-filtering-correlation-id: 2ed36c3a-e613-4f2a-29d0-08df0db76442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|3023799007|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: yXyPquMZBqn5LGSH9Z9sD9wzT/fVqgA2t17grFPdW/wzBj7qtuISVmq4xMwLWcCE4qDhrbgUmbVW0fr6/j5aJWPxsXwWhrspGTW9w4T5zHvfgcZfvJMLdV3lKSNJvI65NjCR+M2tRg1RyF56QN5aNV7TlHkhE74fCDcl9BahOq0k+lbJ2zofSCePDDEDvE9YwzNJAJHwjRxw7PxOsj7wWmcmBpELkmGITTO4Q1486MhxW7g6mlygCSZCTbNZPl6PY3SrVt34Y5X44ozqB0sOkPquFeA+188U5rF2Owx4fPL5bBm1RLgiHFqooHuoisdFT3RzZHKDU7wq0Miz8nKkO4effN4yq2AIEpHl9uLkQt1fyicgw1HcGOC472DOw+Do5isf9SEOchRZc1Ng0PRyVmiPhHBlFDiJGPoIJ0shV/MOPFPiF7174po+L8H0OmX2Ljto0/vR+JXIlIoivchGnDlRQuRal88/L7rMMIfVconmr1d4KRXIAb68j/FjOt5PmrsOvdQuOgFQojNXIqPSZDndK+lnVkqTz/18uoZS85EbiyHAVYhIkrpUQfP+4HD9W6U1eTGnodh/znLIWz34mgT87enJBITPvknVtAq5PB/gl2a8hsLHWZCir4Vlob2rpCWa50gZcOkrLHqxHgwIwyH/tcB9iXz+LJaAsd3w3AIUWP6ap3/nwgEUMyM2APsM4tIXACfB7FImspKk7lOzixPxemNzogDIk1YdYHihdbQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZFianuJuRcdJiVmrq4vMv4fD09gdOI9lYaV52nEo7WKXianhly8m7NVk7jrc?=
 =?us-ascii?Q?BHZyMX06T8nuc75GIHqK2Pdl+PQFj3lZMCg7+69c2rSNEV64HJX+fmCLwMGf?=
 =?us-ascii?Q?cjWMg0YW2aEJ18sqmse22xzJtM1/aW2rJV2lure6TjTTTYNg46SNiSDPdE3+?=
 =?us-ascii?Q?DckvIbLEXdOsP+kL/DOzSBfQK6CR2mvoz+zZE+ktD5bPPpsr7Nir40hJFi7R?=
 =?us-ascii?Q?lp9gtDVt171Vu98BSrmTB9f425vH7g46R5iluz+9YwBsxxpozkOj+1YpHiJf?=
 =?us-ascii?Q?Msya/P9J7CHycDAqNsL767swi3Yi596YqyvLHnEjjQL5O6tlWOYusPdrW1zT?=
 =?us-ascii?Q?6XJ08V9MkLFCPtPR6fDWgph1JNOa2cThB0bKSgjzPVjVWbHBSlhXa8UVY9rj?=
 =?us-ascii?Q?ff59gtN11kk4UOJN37k/abG32TqMI9wBaGA/fcPc8WyVWlJ7XZgLtAXCmgv5?=
 =?us-ascii?Q?3DCv3h1HcuYKTVqjlGxsb+FDsoehQ0e7I8ulJ4iKbqwA2JmV3wIrU0S+ogK6?=
 =?us-ascii?Q?TO5kPkUe7G1P1ttvckBy0RujHUYsR8hojpu/vIV8UW4PvEWWh3brBO9ug+3v?=
 =?us-ascii?Q?bC0LJUO46RyJuG/STR1mF5CloRJjAK0HtzGk7wTgQ9iIa6cJNjFLwtvvNe4W?=
 =?us-ascii?Q?kZux9SvTDYt8EgeOHmEoJBmJS0p6N8qIm6IzPREQv+tUMjHWDhykHQvinq7o?=
 =?us-ascii?Q?9jb4BiJxiOx7UBTUlcJrwC8y6OxH7bUv+92Ne4NNNzk5LvRJCA+pt+JotkKD?=
 =?us-ascii?Q?ZIS6+qjBnhBsUNGseJHhgrBCFhzrH9OTUf3TxSVlrCm3h5fAiModyyACfiwB?=
 =?us-ascii?Q?m/0iGA7Ch+iJxqE0vFbZyxeT5qF/0Li2stvDYE11XiylPg0JKVWeoWx+zc4d?=
 =?us-ascii?Q?4hyf4ATIrXu65ekFlQXXjfpMeMrcIGAIRLNrhlh0liogZ0PbmA3G3lp/fO0j?=
 =?us-ascii?Q?IwjaHBxvSnB1aZtbVjIxSskz3H8qFZUqYr90t5e0BHIOvBfna5y00UMhRWhj?=
 =?us-ascii?Q?0MdD+hpkk0B2gCiIjJLIEJztmuEtA2scp4i7Y3tqZNbP+FFPbGrOuxJ4UFg+?=
 =?us-ascii?Q?TIDKd5omIyu1YacfDRc8NBhdm65EVIjcguwOVL/rFiDeUXoNQ1SjxkEmW4fw?=
 =?us-ascii?Q?DZxN1vpFzZnR/dYlZB5x/6cWJtJznXaZVEYD2hGvRsq0AmS284PKS/GnJk6s?=
 =?us-ascii?Q?xwURP2RfyK0LnkWGGfTQFvwG2shOZ2RErAOiU7vVqEeA2ng6gHgWKUBFgcTa?=
 =?us-ascii?Q?IGooGex2O+zxifjS+LuqEIdpB8xm/O3wiLdGejSfurGViP2q7S4yTs71jkM7?=
 =?us-ascii?Q?w46TSz6vNBTLuoJkHquL1Wfv6dARo3MSqhNTuDG5Jx3vkYtjDUDy+Lm2OKa/?=
 =?us-ascii?Q?H5CqLqNqidQPHMnP2dWE4ucNfeUwbSV1VsRf8wDGIjntLr/3MMzf+xkxO2wW?=
 =?us-ascii?Q?aZvpQ4lHpOQdSzlTAs2StEFd3qH7xMQ6z9hQB54sfd/g8ujTGG858EtL3lr4?=
 =?us-ascii?Q?MrbVBwOXzSLAgfO7rWGZuw93IWOQ15MEUVQBkdbH4owAgvtkTt9vWXoazPG+?=
 =?us-ascii?Q?m3y41C04Xo18pQeLtyvtJY5iyONdn4Xa1V7DLUzK1FEQxMZ+MaeTJ+y7vOAA?=
 =?us-ascii?Q?65/SeGKIOVRzO/MZdKDQL/ydC+SkFGxst/FM3VUog/im6cMDe2mrNrT6mJnd?=
 =?us-ascii?Q?FFRUN1sjFNGcjo7XyexalrT2Y1+TL7OaBp7FaWgZMl4TAF6tfDw8BK404AIB?=
 =?us-ascii?Q?A7SCaM6YvttZGVsFQsIdgmP3BpkRnlqJebWddDN8M8ZMsB7oySmuZ5BqtY01?=
x-ms-exchange-antispam-messagedata-1: UMsNtHicVw//uA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GXZxOAwy1yTJwcyygCi6jhzYeko14qsL7SN9kybaVWFgjfjaUSjIYEBdfT7Y1rNN3yzdspnHhANtaeXRlTkohfNmxiHpA2TQL3y0KvmaWPdAZ+cRoX3Ana/iqd4r1BlnVAbXZ+7TMe/BBaDeOhYXwM6yKzZjswI+AF7/RLL3sHVY98fnIW2DY2WPyLAbEk9ArX45pNM7VQJAfRsa/3z04XgJ1ujvBdjkSlngizpq9RSSutAjqRTkYLAvhbdnMHCkU0L2O96h6pA8WeV4+eIho1DNJROLAZmjAtMOOMYJXitk12U2ClRgiIHUg0b0GXHhkNIR9iMQiGbr7Pe+0bHCPQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed36c3a-e613-4f2a-29d0-08df0db76442
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 14:42:22.2102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+fSBlDd0zU0WsKWY1U5KzjJ8BS0aOw9zptmO4sIHDeageCzOeCeRhg6FvSbkWHNJIUYR8a7fosD2YHGIjZaLtlPDZbJFtPaIf5McDf6MmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 08 September 2026 09:04
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> Subject: [PATCH v4] drm/xe: Add multi_queue_active_lrca debugfs
>=20
> Add a per-GT debugfs file, multi_queue_active_lrca, that prints, for ever=
y
> engine supporting multi-queue, the currently active queue ID
> (CSMQDEBUG) and the LRCA of the exec queue occupying that slot within the
> running multi-queue group.
>=20
> RING_CURRENT_LRCA only reports the primary queue's LRCA for the group
> and does not update to reflect the active queue in multi-queue mode, whic=
h
> makes it hard to tell which queue is actually running when debugging mult=
i-
> queue CSB/context-switch issues. Resolve the active LRCA by matching the
> primary LRCA against each queue's group and picking the queue at the
> reported active_id position.
>=20
> v4:
>  - Extracted multi_queue_active_lrca into a dedicated
>    multi_queue_debugfs_list to prevent debugfs node registration on
>    platforms lacking multi-queue support entirely, via
>    xe_gt_has_multi_queue() gating. (Tejas)
> v3:
>  - Use xe_exec_queue_get_lrc() instead of raw pointer dereference to
>    safely handle concurrent multi-queue group creation and avoid race
>    conditions (Sashiko)
> v2:
>  - Maintain alphabetical order for includes and
>    pf_only_debugfs_list (Tejas)
>  - Export and reuse xe_lrc_get_multi_queue_active_queue_id() instead
>    of duplicate MMIO read (Tejas)
>=20
> Bspec: 60321, 73976
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 54 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c | 73
> ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.h |  5 ++
>  drivers/gpu/drm/xe/xe_lrc.c        |  6 +--
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  5 files changed, 136 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 361a70234d1f..bb09e70ee44c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_managed.h>
>  #include <linux/math.h>
>=20
> +#include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -25,6 +26,7 @@
>  #include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
>  #include "xe_guc_hwconfig.h"
> +#include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_mmio.h"
> @@ -130,6 +132,48 @@ static int hw_engines(struct xe_gt *gt, struct
> drm_printer *p)
>  	return 0;
>  }
>=20
> +static int multi_queue_active_lrca(struct xe_gt *gt, struct drm_printer
> +*p) {
> +	struct xe_guc *guc =3D &gt->uc.guc;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u32 cur_lrca, active_id, lrca;
> +		unsigned int fw_ref;
> +
> +		if (!xe_gt_supports_multi_queue(gt, hwe->class))
> +			continue;
> +
> +		/*
> +		 * Forcewake is dropped before
> xe_guc_submit_active_multi_queue_lrca()
> +		 * below, which takes guc->submission_state.lock, to avoid
> holding a
> +		 * GT forcewake ref across a mutex acquired elsewhere in the
> opposite
> +		 * order.
> +		 */
> +		fw_ref =3D xe_force_wake_get(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref,
> XE_FORCEWAKE_ALL)) {
> +			drm_printf(p, "%s\tforcewake failed, skipping\n",
> hwe->name);
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +			continue;
> +		}
> +
> +		cur_lrca =3D xe_mmio_read32(&gt->mmio,
> +					  RING_CURRENT_LRCA(hwe-
> >mmio_base));
> +		active_id =3D xe_lrc_get_multi_queue_active_queue_id(hwe);
> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +		lrca =3D xe_guc_submit_active_multi_queue_lrca(guc, hwe,
> cur_lrca,
> +							     active_id);
> +
> +		drm_printf(p, "%s\tactive_queue_id %u\tcurrent_lrca
> 0x%08x\tactive_lrca 0x%08x\n",
> +			   hwe->name, active_id, cur_lrca, lrca);
> +	}
> +
> +	return 0;
> +}
> +
>  static int steering(struct xe_gt *gt, struct drm_printer *p)  {
>  	xe_gt_mcr_steering_dump(gt, p);
> @@ -254,6 +298,11 @@ static const struct drm_info_list
> pf_only_debugfs_list[] =3D {
>  	{ "steering", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D steering
> },  };
>=20
> +static const struct drm_info_list multi_queue_debugfs_list[] =3D {
> +	{ "multi_queue_active_lrca",
> +		.show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> multi_queue_active_lrca
> +}, };
> +
>  static ssize_t write_to_gt_call(const char __user *userbuf, size_t count=
, loff_t
> *ppos,
>  				void (*call)(struct xe_gt *), struct xe_gt *gt)  {
> @@ -521,6 +570,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
>=20
> +	if (!IS_SRIOV_VF(xe) && xe_gt_has_multi_queue(gt))
> +		drm_debugfs_create_files(multi_queue_debugfs_list,
> +
> ARRAY_SIZE(multi_queue_debugfs_list),
> +					 root, minor);
> +
>  	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
>  		debugfs_create_file("gt_ia_bias", 0600, root, gt,
> &gt_ia_bias_fops);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..a39dcb85e3f4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3853,6 +3853,79 @@ bool xe_guc_has_registered_mlrc_queues(struct
> xe_guc *guc)
>  	return false;
>  }
>=20
> +/**
> + * xe_guc_submit_active_multi_queue_lrca() - Resolve the LRCA of the
> +active
> + * queue in the multi-queue group currently running on an engine.
> + * @guc: the &xe_guc managing the exec queues
> + * @hwe: the &xe_hw_engine whose active queue is being resolved
> + * @cur_lrca: value read from RING_CURRENT_LRCA, identifies the running
> +group
> + * @active_id: current Active Queue ID read from CSMQDEBUG (position in
> +group)
> + *
> + * The running group is identified by matching @cur_lrca against the
> +group's
> + * primary LRCA; @active_id then selects the active queue within that gr=
oup.
> + *
> + * Return: the LRCA of the active queue, or 0 if no matching queue is fo=
und.
> + */
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	u32 lrca =3D 0;
> +
> +	/*
> +	 * submission_state.lock also protects exec_queue teardown: an exec
> +	 * queue is removed from exec_queue_lookup before its
> group/primary
> +	 * are freed, so any q found in the xarray below has a live group
> +	 * and primary for as long as we hold the lock.
> +	 */
> +	guard(mutex)(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_exec_queue_group *group =3D q->multi_queue.group;
> +		struct xe_lrc *active_lrc;
> +		struct xe_lrc *primary_lrc;
> +
> +		if (!q->multi_queue.valid || !group || !group->primary)
> +			continue;
> +		/*
> +		 * Multi-queue exec queues are bound to a hw engine class;
> +		 * GuC dynamically schedules them onto one of the class's
> +		 * physical instances, so there is no fixed queue-to-instance
> +		 * mapping to filter on here.
> +		 */
> +		if (q->class !=3D hwe->class)
> +			continue;
> +		if (q->multi_queue.pos !=3D active_id)
> +			continue;
> +		/*
> +		 * LRCAs are page-aligned (4K) addresses in GGTT; the low
> +		 * bits reported by RING_CURRENT_LRCA are not meaningful,
> so
> +		 * only compare bits [31:12].
> +		 */
> +		primary_lrc =3D xe_exec_queue_get_lrc(group->primary, 0);
> +		if (!primary_lrc)
> +			continue;
> +
> +		if ((xe_lrc_ggtt_addr(primary_lrc) ^ cur_lrca) & GENMASK(31,
> 12)) {
> +			xe_lrc_put(primary_lrc);
> +			continue;
> +		}
> +
> +		active_lrc =3D xe_exec_queue_get_lrc(q, 0);
> +		xe_lrc_put(primary_lrc);
> +		if (!active_lrc)
> +			continue;
> +
> +		lrca =3D xe_lrc_ggtt_addr(active_lrc);
> +		xe_lrc_put(active_lrc);
> +		break;
> +	}
> +
> +	return lrca;
> +}
> +
>  /**
>   * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>   * exec queues registered to given GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index ccade320dc69..29abf07d8f04 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -11,6 +11,7 @@
>  struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
> +struct xe_hw_engine;
>=20
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);  int
> xe_guc_submit_enable(struct xe_guc *guc); @@ -55,6 +56,10 @@ void
> xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>=20
>  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
>=20
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id);
> +
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 25fe9dbc9141..f1cf1463f1b2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -2705,7 +2705,7 @@ static u64 get_queue_timestamp(struct
> xe_hw_engine *hwe)
>  				   RING_QUEUE_TIMESTAMP(hwe-
> >mmio_base));
>  }
>=20
> -static u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
> +u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
>  {
>  	u32 val =3D xe_mmio_read32(&hwe->gt->mmio,
>  				 RING_CSMQDEBUG(hwe->mmio_base));
> @@ -2739,14 +2739,14 @@ static u64
> xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>  	if (!hwe)
>  		return xe_lrc_queue_timestamp(lrc);
>=20
> -	if (get_multi_queue_active_queue_id(hwe) !=3D lrc->multi_queue.pos)
> +	if (xe_lrc_get_multi_queue_active_queue_id(hwe) !=3D
> +lrc->multi_queue.pos)
>  		return xe_lrc_queue_timestamp(lrc);
>=20
>  	/* queue is active, so store the queue timestamp register */
>  	reg_queue_ts =3D get_queue_timestamp(hwe);
>=20
>  	/* double check queue and primary queue are both still active */
> -	if (get_multi_queue_active_queue_id(hwe) !=3D lrc->multi_queue.pos ||
> +	if (xe_lrc_get_multi_queue_active_queue_id(hwe) !=3D
> +lrc->multi_queue.pos ||
>  	    !context_active(primary_lrc))
>  		return xe_lrc_queue_timestamp(lrc);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h in=
dex
> 7be5e3da8bc8..a8ff4e59a1f4 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -158,6 +158,7 @@ int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs=
);
>=20
>  void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum
> xe_multi_queue_priority priority);
> +u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe);
>=20
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);  vo=
id
> xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> --
> 2.43.0

