Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A5DC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4FE10EC05;
	Tue, 22 Sep 2026 08:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWPegbJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464C510EB4B;
 Tue, 22 Sep 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067338; x=1821603338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fNv8qYv2SNMX05dMvbBLruSqkHLk8oQ8jx85h8tIjs0=;
 b=iWPegbJ4pmiXq1RmtLu7jbkhSqnZIJNhOqg3yov4fvsHR5Rb1DmhDhN4
 Sxklh2ccUsZLFHZ6lCY6qUzdn1nhbh9ZF/xLNXX7Py1+EpOkoMfIfiouC
 k7cz06dwNjxwIzTuQ+xN+z2E3KSy2B1hINotbskc4BEzn4XgIGkoHdrfD
 qlryjuOYO1ylgB4oIbqlQt7+x7HXq/WC/7NiukmSC02+D+P6WElgYjhSp
 TUmqyXzESkgmLwC0Mgeajb/v/HA165HbHz09ytrpP69/5lGD4HZDwzCxJ
 TEsA0nP/Nl8Eul1exALEPXXkkt0RSQafFuymc+GL4XIcfztTbOYFmfgMq g==;
X-CSE-ConnectionGUID: KTCdYHgoTiS9B+ud3i+vww==
X-CSE-MsgGUID: CMKSTTBBSQ+wlSFjmFlBGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89785846"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="89785846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:55:38 -0700
X-CSE-ConnectionGUID: 2vi+Z5e/RLqpkzpaqRvBWQ==
X-CSE-MsgGUID: sOdeHg8pS6Kdz2rYFdguGw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:55:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:55:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:55:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkewYohHFeiH29+n2FwiXhtWthlwehqWXyvrtIkB8sLCHEkyYmH/CFUE+zLgWwk3THh/lqcj94QCTXXd890netLc8kWVT5q9YDKMxAwvW35PXq8+oPX5yFdBf/IoRgbjkelxUFHwcvs6pp14S09BNQqEYyLAkwb48WFM1ZmJ7qSxFexlAm7MNUbIrVMvvSvDgxysF1SVvrQTE14IuA8nDyYKe5KuuO1ALZ6j4g3YTk1cgBDsyFrXXuyAiJXkwq03vjgXu4yrpB2hybhZ+1OPELTcMiGH9AmOUaaEe45vDB1/+Iwkt1sQW2iQmAzpMQJ4ePuI5Ksfu/t/VbMJOgyRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYKRYEKC76/lyjW0PZsXBtDvJh0sHZSr7hAz6oR+IbU=;
 b=nj0AYlbCNnQQa0bvHSBl1ItHMjKusvBGapBAbnVn3LBJd85HdkzGfmk5QdNgy/yIriH3u7IQ1bPwMzT9wNwyrIIRZW6RaOmi0HxxGfu1+ysDptfVP5CpJDaQEBqoDbbQhJWgfRM3XzKp1G7NIN6IozIo34+92ebEhHaymVtFaGeVo0adEQnf8iwSlvCJ3AI0WMqGlepgEGCD4NCnaqcVzDY+5KJRC2lK/N6Qs7SQdo9V1bV329M612rI4e/9gXBsloxV7FWLB8yeLLWo4xUWB9hj97IokPyST6/xlErVezttasB6+OHRcYgjLUt0otQKcUQ3YKCmmCe4rVy963WByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Tue, 22 Sep
 2026 08:55:35 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:55:35 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 3/8] drm/i915/ddi: log DPCD access errors
Thread-Topic: [PATCH 3/8] drm/i915/ddi: log DPCD access errors
Thread-Index: AQHdSYtS9JDK51cYukKWXu3seidILbbaTR5A
Date: Tue, 22 Sep 2026 08:55:35 +0000
Message-ID: <MW4PR11MB6887E2EEF5E8BE7B635D2164E3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-4-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH7PR11MB7549:EE_
x-ms-office365-filtering-correlation-id: 1ad5fa84-58b0-417e-f16e-08df18874444
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: C5d56tyGl3xY0dqhWoHUg0y0Gu1HxMLy1tc5UY/FnrpzMmoFRdEDDkjbXmbx6pyOksujHQ/2vuTQeh8xr8tsJg+mjgxXhTjqFHApKggwQ2pHkQQhSAN8y/v68iop37F5pYUE2A2QTNJnnY+2AaOLdLqQqxZE5EkXnIJ+T2Bg8gaefvjb6FFbRHRngyoYT90b2AshHrLWrfnOVzWIN06fneOxOIdtHoUw+kXRLWPnO45DvHOTa4x01E9aH6AI46uiRRbi01uj81+I7bFwk8EYiI/cosNVgpzbTzz0s0MshUno2v+a8uDuzChoohcKrpax4j7iAl7jueMykW0gfbqzsOXs8iB5rXx7dNS9g2tBQrHuhLpylaRfXEalqKjPOOC4vbKBt6dz1oG8Z3NfOkND/K7UqtHeND1lSMujr7tQ7xeuhX76EyH4SwVIrzIWLp/ZajsM8eryOpjedzNuDwpfaKj1e4j2+btXrF6/27aI5U0F8tBnAviF/cXV2mdp1nF3m/NSNxS52PNG6qY1yedSwuVzO3uSsV62RY8X3Os7PhQuqcYtVUF5ecCg5pm6EcJflQ1u5SReq4mKIqoqYO0NtOILFvNtIQWuzj1GJ7ENsyH3aUruAd1scgE/nlPhsmEpPlWZYQh9jIDZK9sALGny3IKR8zWr6hanOX+zO6++1v5Dxu8P2haxpSlc/SBFJCuMmCFeVR5QsSgh1jKdGHx3uAJPEg9MTFIb3RPk1Yc++9s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FYNpx0U8ofvDKbTMlYO+Sg/opGyKfNwtfmL+g1MgcX8uNo+Tuuazot4/YlsH?=
 =?us-ascii?Q?GOO7Fx3CD+OuugdNlykspTBHCPANFQdO/OIlrdxql36b5V5jpxWOpJHGx78N?=
 =?us-ascii?Q?+4koK8XR8nEU/1YZdDEJm1dHYOIw82D97ep6zuZ44bwDhurLINUiz4Iu4RPL?=
 =?us-ascii?Q?eF99Y2ALGTvp5J5z7pw+iVP+LpI8crFCejO64uwe5E2E6J/s2jSJykcS+lfx?=
 =?us-ascii?Q?9D/TN9XEjUM6XHjpMDr6R6CwEmQ3LukGSjG4HvEh6DzuYpOgJqBRhjhaDk2L?=
 =?us-ascii?Q?llziq+4Gzi3tCx0uuE6VPfoBFbbeS+FekpEmGfVlUle1xBm4cb8cIZuT9CDj?=
 =?us-ascii?Q?oAblxoq0W/nCSEuTVZIjBqEpfTYxtuJuc84YzZoHx3x/sPXfUqxbvY130BIl?=
 =?us-ascii?Q?lXViyql1gyuuw3iQyAHR1oLpqOduhK35X3TdiuLHmFG3BvuGfj3NjtMAEtj+?=
 =?us-ascii?Q?/tax9ywvCMEzWmUweLjSs5u41g7dlUIsF0LMk+xTw/JDOvgl5ccyRPK1tJeb?=
 =?us-ascii?Q?vdHokB0Zjg5Nmm6JTmLq7lZ57V7XQjYwkIMNIBNzRjdedkPIJLyjB5N/P0Pg?=
 =?us-ascii?Q?tEf81iUuXKssegeEJl6t5X7WZc1TG3wqTvCUYyTY0aTjvUYBGPGGb3lUDdjs?=
 =?us-ascii?Q?817HogJwzkxQf4qBpsw9bCYhpJipgbvhhAsf3HVSFMj82bi7Y6JoeHyI5o3B?=
 =?us-ascii?Q?nizTYA63A9iyu/4M/8SPkJub0dQvbRYT571erhBC3jLhglrPNevrwW+Z8vIW?=
 =?us-ascii?Q?KJGQq8qI8zmXCpcVk16vcBIsrKUvnKrhPEMasZ8eWz945WxnvoC6FkZp9BdM?=
 =?us-ascii?Q?nV+EDu58O2ARNHAblWf6jJm2t7+fk3WXFBAodP+CzompHzea8MA6M8cPkqZU?=
 =?us-ascii?Q?CGtXNl/rsevEihUbe+s/eN22KP4dhtkjriUQrmylTrL3hdKrJatBb1zkhvGB?=
 =?us-ascii?Q?TMHoyojNMDIH0/88afmd32W/yCxnmxdOmFswGltMSM6cUsnoFhuT79leecxQ?=
 =?us-ascii?Q?nZsUMMQ+ptdHV/x0m50csDhcCTUIGirKNFIUIjCLZ6HeWFHASyTjEpmt+x1c?=
 =?us-ascii?Q?GGHHH8wxJXsKij45xrOzmB+kQgacZd1m7P6QW5WrJq/UCeMyNLFuE/vXpYxZ?=
 =?us-ascii?Q?yuEMI9r9DpqnZc/mNr9gGghy4Ww7KznPlDY8lc2OjUMFDtb5Z4f8MZ0z2h+P?=
 =?us-ascii?Q?I3QopSm3nKErRIInnZd3U7j4PizAC6Zk8BPoXkGhQlq7E7KYUmyEhdoNoQ0f?=
 =?us-ascii?Q?IYmR5v6EfhFHWhooJQnJmiLsUZlmpUHkAYlJbtWGkt5Z6pmVBgvyAxGdyUWm?=
 =?us-ascii?Q?hrqdgr8MmkNJqFKUrXKu91NXoSj9ixV/BcBXjW9Nhctn9giRCfjKYBlHimlN?=
 =?us-ascii?Q?8F9b+v5mbIXauyblgHtkakDujlUXQ3Kk0XoRJO6S6Q2pzL8Am7oqMoR//uT4?=
 =?us-ascii?Q?OL6xPE+U715TIdRf+/bblBse5Q84rNplmVdQnKHp0AXdmusPuqmzTzju1lJm?=
 =?us-ascii?Q?QT+w/KEkn2OFFMA3oH+XcoJZCr6A6VwzMlcBJMRqVmnjFZOkgFlV+6pOpAIe?=
 =?us-ascii?Q?1AEoy1936AxGpss9n+qO+y9T3b3cX+VQAWKzioKsi8gDzr/wZ3QsT/Yvq89y?=
 =?us-ascii?Q?ulZHDWpNz/9q/Bk1kuerchybC4dC3w7P9vLREATAx0tLmTY/m7IF6EncVRhY?=
 =?us-ascii?Q?xRxlPnUjAsYXMhicN9XYm7rTpPoHNux0r7bYNze53rTKdPXJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G71qjyjcwyBuac1c/c8Y3suwlVcFYuiCAXI6NIjM1XjVs+4+nv1i0c5XhIeIxlyhb1SmqqANJKChAiJAYJUlFKOhfJ8przJ2jkYKeTl39TqpyvMamw5B6NXjM7B9LViQqrMDpnVHmjn9h/yQexbw7uRZ1SCVmlJN7jbFjMbpVFCs+uj5J0QlEaO1FeOAPDyiBKQPZtjt4l3fZ8pRjbfLegaAyLFOam6UFAyut1IhniPb/hBe3aCCGJ/RGq3TeQEcJX4Kt6GctDWCisHdPyF6W5pMlgJSfKkL8lDiI9e/5mLk9KUD3DusLORha7InTi90bxF+NDdaZDVRcz2NTM/qZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad5fa84-58b0-417e-f16e-08df18874444
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:55:35.4631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNauX/wp7t1PzyU7KV0ewxIeatH+NJqixmxd2XhZqSjRoI95sIXwE4LOG0Syi7GQHEFxbSPiwLicPtgivdSbNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: Monday, September 21, 2026 11:07 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 3/8] drm/i915/ddi: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Store the FEC_STATUS write result in ret as well, so that it can be logge=
d the
> same way.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 7efd4c4d4994..a46ab5d3d70f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2341,8 +2341,8 @@ static void
> intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
>  				     enable ?
> DP_MSA_TIMING_PAR_IGNORE_EN : 0);
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Failed to %s MSA_TIMING_PAR_IGNORE in the
> sink\n",
> -			    str_enable_disable(enable));
> +			    "Failed to %s MSA_TIMING_PAR_IGNORE in the
> sink (%pe)\n",
> +			    str_enable_disable(enable), ERR_PTR(ret));
>  }
>=20
>  static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp, @@ -
> 2358,13 +2358,17 @@ static void intel_dp_sink_set_fec_ready(struct intel_=
dp
> *intel_dp,
>  	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_FEC_CONFIGURATION,
>  				     enable ? DP_FEC_READY : 0);
>  	if (ret < 0)
> -		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s
> in the sink\n",
> -			    str_enabled_disabled(enable));
> +		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s
> in the sink (%pe)\n",
> +			    str_enabled_disabled(enable), ERR_PTR(ret));
>=20
> -	if (enable &&
> -	    drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_STATUS,
> -				   DP_FEC_DECODE_EN_DETECTED |
> DP_FEC_DECODE_DIS_DETECTED) < 0)
> -		drm_dbg_kms(display->drm, "Failed to clear FEC detected
> flags\n");
> +	if (enable) {
> +		ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_FEC_STATUS,
> +					     DP_FEC_DECODE_EN_DETECTED |
> +					     DP_FEC_DECODE_DIS_DETECTED);
> +		if (ret < 0)
> +			drm_dbg_kms(display->drm, "Failed to clear FEC
> detected flags (%pe)\n",
> +				    ERR_PTR(ret));
> +	}
>  }
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

>  static int wait_for_fec_detected(struct drm_dp_aux *aux, bool enabled)
> --
> 2.34.1

