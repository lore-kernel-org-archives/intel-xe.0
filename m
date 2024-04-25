Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE014C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 07:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7693811A20B;
	Thu, 25 Apr 2024 07:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZq4X4H8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783FD11A20C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 07:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714028832; x=1745564832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XblPkYwCBp0QjPYv79SaBPCeASPkwYv6IeGhIj9g3P8=;
 b=AZq4X4H82gG3oUKB3/OIiiWlagpQ6hwejgvpXPnY7MHFn29t++eQDjJp
 X8udmGq0RSZ3t/g1e+TamiomLfpuiDMYlV5ZRUpMpJeCzo4LCkj0iTMVw
 Ej+opxM9syONHl3IZUvfSkDm8cY+tCsIaVsCxQLJt6qYoPo9wronb605y
 VzdCqaNbQ0CgdX3ZAhM3liBV20v0cpsP6W9QITCMBKG58o7s9LIoL5hIz
 yRtKTaQ161kdLiLJKHOA/bFUtAZs34+5OSx/06mvRn8nlnFu9qhHlfWAx
 uWifJG0bcicj8tKLChSLgux3yJbKZNWai6HAj7yGyfIBrbnMnzVpi7wR7 A==;
X-CSE-ConnectionGUID: RvLuB5YYRGqEISHI3UBATg==
X-CSE-MsgGUID: cR7qE757SSqL+Yvk+aWQHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9854499"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9854499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:07:11 -0700
X-CSE-ConnectionGUID: MO8RhHBmQjiT4CA0ubfZcw==
X-CSE-MsgGUID: a3V47L8KQleWHPb/XdVTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29589277"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 00:07:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:07:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 00:07:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 00:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3kqZhIVynyB4aLzyi/9up0wKr1Nt/pmB7FULekMZGsbvtuaJ82LnH0Lwii40+preQg/QQ0+eiuDs0KYeqRFcYQYZhJSaFzEb7aWOSCbs8Gfv0UulKmZaRBQnjeUPTe9fRMfiuy8+/ZadoVaED6znt+sSIFf/RMpEPV0ebSH8SoPU8Y9U0p1Z99nW4aifpZcPffRXaPxu1xy7Aed0fyQjT5hYRnOP4+kxsAWGxJO/SpYvpK6hR671gIxI1UpDhCID/z7vrs4AFNWk7AURV2+ZH+htlWF05UBXjGQ/2f1Os8bv63Q/kXG2H7vJjJbNExmIlVxiPoq0XDbU1SF1sWYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vubFbFjlkfjxirla7zMo5Journg4nBpfxz1xJ7VSGmA=;
 b=MOjFkKD4juX5QuT/rWNXHJ6jw8do0OiFMeUOWXGFzixkUyjhO68KysZVEORMTd2rsy1nA7InBHcou3yR8b5xxZAixjQZ5YJAIvsZ1tuof9Cr8MgWDN2DoWqgNn6vosWMfBkL3g5hVBQOXAZ/C6xy85GukbSneFRfCNvU73AE76UGeo1iB51wHqx+mFznwEkLKWKymEa3mqPEKCL3gvcyTzQNBXwJ7vYiZj+wJU3+hK1EvQfYQllk57EzNOk9nDgeLWOlHFtgcUyWZES88nyo4eNw02tVFtwrme//y+TUII3AUM0WGuIRgfOqr2bf74JPg6bPUJEiWSBNd8YbQCaXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 07:07:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:07:08 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 4/5] drm/xe: Fix alignment in GuC exec queue state
 defines
Thread-Topic: [PATCH v2 4/5] drm/xe: Fix alignment in GuC exec queue state
 defines
Thread-Index: AQHaltUed26jByt/KUSnmllcypKS/LF4j4mw
Date: Thu, 25 Apr 2024 07:07:08 +0000
Message-ID: <MW4PR11MB7056AFD8A22098FE9318149BB3172@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
 <20240425055522.1919005-5-matthew.brost@intel.com>
In-Reply-To: <20240425055522.1919005-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM4PR11MB6096:EE_
x-ms-office365-filtering-correlation-id: 784f7e20-d8bf-4b14-5e69-08dc64f6527c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?0+vbqi3xQhEr1SV74AjH79SjUTDsl9Sz3+cXZj0fkVgN2KPrXPfkPgLF8TfO?=
 =?us-ascii?Q?XF3jhiNEED7oWFlmdRxE6aQ9HIrVAj1ffKtnouRvn3rcx+yvT/i66KHc+OmZ?=
 =?us-ascii?Q?2A6PLjPN5qWMZgYcWr6K+Pu123sqHpQZGrtBekXv/u+beEjCsLwsaq5UMvek?=
 =?us-ascii?Q?jF8wpDxhcEAcHQ8EvFd+t6yopjB1+MmqLpCmiRPx8kRCiD/5gLNhBaYUhVAa?=
 =?us-ascii?Q?qlJVBaeR8la/kAUCTCl0m/Qy1C2ODOetjH4+nSTlLPgPN2obSuxm3Ni8BLv4?=
 =?us-ascii?Q?IOBLkqwJruFRqlYCseVIvjh1ObB9gBFl3lDInInPIa835zudelOdEd+PGzmU?=
 =?us-ascii?Q?neEFrclnzWfmj9vq8ecWJ8Yj+nBLDScuwE7HlvI99akjMQc4mFkuVuU42Two?=
 =?us-ascii?Q?5ftlD2wUc8VSlOvgRTFSDtuZ6wwKYmViptgx7rx9BX2LBqTN1SzhKDDzOO0k?=
 =?us-ascii?Q?Npo1uKebOFS/buXp556gWI2LwHkFeKIC3e4EKlb3Ua7O4Ryqr9HqYBbhLI/u?=
 =?us-ascii?Q?Y4i7n4TlbOiU+fStWxlbJg0K1esnP4hopTT1rn8U7HIWgmVsDTjU2CvzAYCW?=
 =?us-ascii?Q?SThy6NZttJgQmVx4lDqOvQocniTnNDgeClv0n4XkcM3P2TGYgdPwyS9JHX3X?=
 =?us-ascii?Q?9k8qXoZ4wSSF//gXc/jRZOfLOUZ9QEeg77F/JUSPcVXocwLBmgWZNoC25rpR?=
 =?us-ascii?Q?EIcyuosPtBQezAe+7hlrWr0vhPeSqxL2BeW1uNwkJ4gHrsFfgS5bGKhosxiV?=
 =?us-ascii?Q?5DC25WfAf6Sxe2EsWpkQTsLVspyl2RkBsgs3+afPWP6S2e6UTS42fNh7b7jo?=
 =?us-ascii?Q?zdVNjuRP1crM82kO/0Swez6OEEopptrkJNxu2PKDvWrf8uNe6U7GWZ4pVrbn?=
 =?us-ascii?Q?PAxzZSoIQi3XVtZfp1L+cGEQWOt2j3YsqVz0cJKa9czZUvciZrQSCNARIfjy?=
 =?us-ascii?Q?wYantHmEnYm0o4M6tKW2i6vKI/0H7L9Sg376gEfO41hTbb7cVplkYHDcrKE5?=
 =?us-ascii?Q?GJ0e6cqaEAErk9pzkK+c4yu9xJ3+ztClGORAu+bnOlqwmMKSs0zqxg4Fmw4I?=
 =?us-ascii?Q?o4XZ2k9RDVD1+A++IzkI+pySthNEY8pl0IAFRqtSTcrlDBq3lXEURcTD/ld8?=
 =?us-ascii?Q?P+7ApTfBYsdLMgyjTbqZwfaxIZuxzmDiU2tmeJEPj2tpJxJ5LglZduAaMA99?=
 =?us-ascii?Q?uVPf+wHb7tUmQ+MIrZckxpc7XORRqWLE6MmOW4ezl8E930pP3rechtjDgg0/?=
 =?us-ascii?Q?K22kAzempdwzU8SpEAvlNmU9O2bvAJsE8DwGzRtkpRaP0769VUZcUmVQnzUm?=
 =?us-ascii?Q?ErcfQ17umYYnIjYepnXRwpr9wjbxg4r+TudJgjXbIA8zpw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nB6oMWDuLL80cGFLE6IKMtcwkMa5WFP8wOw5NduJh/3qllK61Xo0jM3Mc/85?=
 =?us-ascii?Q?bEUBg00JwWrrKlH1zul5IlX66IsibUAUOjDq2V2VziKTlNdp8iumFlW/lb8/?=
 =?us-ascii?Q?NZ10gbazcFAmDunP8POKvMwfHvmOZdYsl8spB2LI+/WoNIOIhogGH+e9p0Gd?=
 =?us-ascii?Q?j5yIgDiXKP37V3QSHRF0hByWjpFnE0/tVP49UJR4G4cfAy57dR3mCR0xOhdR?=
 =?us-ascii?Q?hkUgJzKOAi12wra1N3q7S9BMPtwmUc0kwY/vRYGkKW5iQdHBUQnzT7X6AASk?=
 =?us-ascii?Q?o9tQ37Mo2FbW5PwQFwf2hMKEvilJNgR2REueoOGNdjugoEBSxDAkYe4DHvbz?=
 =?us-ascii?Q?scCclOk+FpaqB1B62IA25wvMDFr+Tu8UgInGnuVhYMwLun19n/RqoFg8x7Eo?=
 =?us-ascii?Q?TBwDqdSQ/UVhojWCm47E/TFC6/wWs3Tn0PrSoOl6tYIj3/jBGBgVKsK7mQIc?=
 =?us-ascii?Q?oRwIZDXrKpBoTdGPuESEuAHwisfCsV0Lx0AiNazm1Ii0C6D/COqp99t9oSej?=
 =?us-ascii?Q?qOZ9EFvbmeU5mFhvlcHC1o83folzvBXLMpplcQQWhcN7+nkVL5AAm8bThXkQ?=
 =?us-ascii?Q?MhqKySpeIKCgzFHWy23lT0C7pFkC0Wbf13dLIk8kVctTth220lSStr9EYHw9?=
 =?us-ascii?Q?+mnD8yh1gzZh2wdR/kb2dEACJgMYVqEitDwleXz90LSUVyN6DtkFUeYMtgmo?=
 =?us-ascii?Q?oG3IdiW1thvbxkDWsCBgIkEgHVdautZ9g5vt8tQRO11GYbizO8Pei+ZF+V1e?=
 =?us-ascii?Q?TqkjkqgbuQuICu/w6thNO1tiePTKBCXw3IbIMvDAy9epteUhnRysvaSzyMjL?=
 =?us-ascii?Q?pFyUE5W3KZeKjrfdWHwHgovv3GoRkxgo7+7WxYrCZxwuJkdUdpHsEJAzO/Vm?=
 =?us-ascii?Q?INMZMMCm9xlbYMDeXRk4glV1h7HpkolDynMibShHkioflV4VKy0EY1tWi8WK?=
 =?us-ascii?Q?KGfKQ7p2RtdjVVqZ/JYbIR6MyQbCT6ZeCJ4Q/mvLThPJcZRtnYhmGYPU7okP?=
 =?us-ascii?Q?NCHFEAYWnzyesjl1t6mGsMw9qBGtB61OXyXpZTvWabsVGMMSc8W6CphXwKVz?=
 =?us-ascii?Q?KpaAeN0vp+4A7pss+AGiLfGjP+Jef+N+Mum+sODsI7l+aunZibvquBGAs7ea?=
 =?us-ascii?Q?CtZsFz/AVpPerETYeZhvrbrYb05fbAeCYVw8bc38ByFIT+iQX7A9z3TRqXnP?=
 =?us-ascii?Q?4Ns7XeKUpE9+YfXdLC0vxmeEOXKjwmUnnR6xpQ95cKWmsCSZUYSNw/sBcAkj?=
 =?us-ascii?Q?7JOPTk/NwIsmjAwWgfSxXTSENJhGijjPkGyPFm0D72FJqR7WLgV9q6KRTDoR?=
 =?us-ascii?Q?J+SePu5x/SPRx2RcFtvwbJnJ/dIPWM05dufKHSf67sjL8xuBEW5sf4dyKJhI?=
 =?us-ascii?Q?TRxVxwP2b3rTIVboXBWoQ/td5onOPJYnKTvnEbH4I+7QDk51mWUVLph3psZx?=
 =?us-ascii?Q?9iGCzdOdSN2ElAhwsE0vFRupDOPlgM06jq7cuP9ALJy3mDQNallBkfWhZgyu?=
 =?us-ascii?Q?hgPDiGSmhHrFn8iCJWnBwUF0deVmYXpB4PHEW9iV87XUvXWTsFxk7uCHqrDo?=
 =?us-ascii?Q?ZAwJ5dbedUz1Bouo2DlJTmmfBpiOEpavX8VQ16Fn39o/tBaAUbFVhlqiVu/j?=
 =?us-ascii?Q?sQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784f7e20-d8bf-4b14-5e69-08dc64f6527c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 07:07:08.7837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnD6d0a2DRHfzd7BGuVC9bi7hSJFmNpQSddEOYTrqdvg6SlnovFswFqgLF7E76f0/FYsdUIGBNQSKIqPwXcP/lmqOEfMy5eoGK4L6zOe79w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 25 April 2024 11:25
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 4/5] drm/xe: Fix alignment in GuC exec queue state
> defines
>=20
> Normalize the aligment for readability.

Typo=20
s/alignment/alignment

Can be fixed for EXEC_QUEUE_STATE_WEDGED too.

With above addressed.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 19f92a107342..28c1b9b46251 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -53,11 +53,11 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   */
>  #define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
>  #define EXEC_QUEUE_STATE_ENABLED		(1 << 1)
> -#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
> +#define EXEC_QUEUE_STATE_PENDING_ENABLE		(1 << 2)
>  #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
>  #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
>  #define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
> -#define EXEC_QUEUE_STATE_RESET		(1 << 6)
> +#define EXEC_QUEUE_STATE_RESET			(1 << 6)
>  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>=20
>  static bool exec_queue_registered(struct xe_exec_queue *q)
> --
> 2.34.1

