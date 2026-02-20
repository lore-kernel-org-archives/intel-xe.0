Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D31FC5ACC0
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 22:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEFB10E037;
	Fri, 20 Feb 2026 22:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCJE9sj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8902010E037
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771627441; x=1803163441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EGcOj6Z6twtIn4EdeGLgvBQ7ZZseaE/zyWpLCDZ7z2I=;
 b=QCJE9sj8jcz4yDn98MsXcODwJBK4WeeoSt11oSy8gGvKsefn+MSsecD8
 5NzqiKwq/g25zOiqpliJypIZ77LVGSuoeVQtfMSQaDA5dKCHsZr65yo79
 dR5jWzTio0rEoXEtK+x90mjXRn50f2n1RtLG7mUdPeDjhK7K4z9xrvTus
 SovR35evla5Iu6kSSrGMrTjJfKhnORdgNJ9TAZs2kYZLoRTGqqfWC8NzE
 UefGGnV6ZvDEax/XTP4TVRnuO2ZHPOFiYjhOGJPE5c8B8EdVe6fFA9K22
 DZukblk5nDhssSxxUXx1LKwYXFXwYBHLGaCh/iY23OZZ+voAJS+nDU5Fw g==;
X-CSE-ConnectionGUID: NuAAEN2iSOCuHRu+ezOnNQ==
X-CSE-MsgGUID: +6NvFOoySYqvNs+RQeJxLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90132136"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90132136"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 14:44:00 -0800
X-CSE-ConnectionGUID: EImgR5xES6ulCoep9dWezA==
X-CSE-MsgGUID: wZPvtgo7QEGQoXpB+ztYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213054353"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 14:44:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 14:43:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 14:43:59 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 14:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTYX5FyCFJjYS9C7x/bbMQDNBO+cLxa6S+oSeyVnCvRLHPlZmOnm32o5tgfGt4NV+AIPiNg7DqdEqSQGvYBxAZIFihn56D1GNv7l/EComvK+40Q+clG0bYouTe/NsLOCKj1CU0EAkV+eZ3aKIzrWjO0SsQuYSdO0iM2O7KvvDi0CsG3Lx87WkNf+TFm7ENsqwdzhXMRXOa3V6u9s2Iy7q5nTtwzEraAGffry3OuB4HUts1YWGt228Gf0HmGW6UDVg2zdx4cQoVrhnCX5O9+47KAI1k3zkwoYRDu7x8JRU0iRVw4fs7NlVUpy7rm+GoS2tDn0gexiCYZj1oRIL1qR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+lxMqAE/LX3FmHs630iTjzNaNSr/vaK/hA8wJ1ytIA=;
 b=WKkMglnb815bCMXarMI52dmHgPa6d+v0cQVJbtmFDhmi3tb9qCm+ek7li5Rzs5vNlO59MyMGs1KBNhSLBpm0YlEuJ6JCYSywLZhXfYVTOcNOElmy/fQmQ61B3pgwANO4WXyWWzExTQ1xNCoQEkUqlISItpzogAbA2zncnpXrDtZw61qbRMulyI3ZqkDPSfH8PHjbEsZrBCP+EamlPTkAnl5SCIzQeciCez3cLN/JQUIaB+5DqAvU6tWmmDmvwhjs4z075P7yW2u/OzsoTwmZIrliAazBhcWn1WRDRCD/IvOUiwW+D4D40NCZr7mc8FVgPECZ9eKTcCVf/pa8+bujJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 22:43:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 22:43:53 +0000
Date: Fri, 20 Feb 2026 14:43:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Fail immediately on GuC load error
Message-ID: <aZjjp9y9lOTjdwTC@lstrano-desk.jf.intel.com>
References: <20260219214529.1235106-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219214529.1235106-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:303:8c::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: e19da96b-ba1b-4cc4-2248-08de70d18641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zvAmR7xTGw3nGmAP/iZyra87La5w88jfVpwFUTFkFE6XIqpxV5oBotsa7IDH?=
 =?us-ascii?Q?2vWEAyQdra8r32cE7C5tD2SGqdLMmtIn4g8khZ4XkLxWeRWkVKisvpW5agVf?=
 =?us-ascii?Q?eyqm5Nvffw3xpkKb4yFjWexLPllw00vU4soFdMuvtmciFGtFE6pqpc75XUbe?=
 =?us-ascii?Q?ghkZ6fuUnRBxbulj/imB4zsQqVGJpgTjpdmEoffxGpIQimJD96F2nSkfQc7d?=
 =?us-ascii?Q?eF9WAYVObM3nmxoDuB62G3DZHFR5H+XnKD1Hso29nDtPueP04D3z9eIoC87g?=
 =?us-ascii?Q?Xz++P4uikyEkR8fOBmO3mIkZwAddp1ESLjrjl9Ez+jlZUZJE09vzFVC/+Qrr?=
 =?us-ascii?Q?rSPt/SlrkmBsV6L/3pErsRSsFt08cMfKMZTMIZPPL3p3eI7LB0TdNDbOZMqi?=
 =?us-ascii?Q?reqZU37zIfi58i+GEJVolmNgIcxCJx2YAoLkqG0U9OGPgopdOletrnPYbGBx?=
 =?us-ascii?Q?KfMcrlJjg5OPOXcRpIIGafvJ3F4Cs0Fpdgv0sZBT1BGyYBZX9qBpWv5NmiYO?=
 =?us-ascii?Q?JaULIr70lcng03qCCH96UFsvql/ilWOVdL0cv/j+yslXs+zXq7QK8kcOc4RX?=
 =?us-ascii?Q?1mv78adiQ4M+AYgvin0fcmT7Z/8qSPC7dkVvB4+52WNTYz5ICAAvW0evVlDu?=
 =?us-ascii?Q?rXa6TWbFRVmt6Rakv9nbUq4Bvy00w72/vsAQfoLI8/Vf0D9yAvuHmQB/x8MR?=
 =?us-ascii?Q?ANQiUCgRSXmDjQzXaRF6cHf5xqQ+CtmljOWZYkYphy0Hm/LYZXnIGC/Y6tlJ?=
 =?us-ascii?Q?pqp17UaKfFNRTKwsdXjQMgwY94G7FhqOBN+vF4gIO+Z2xa9PsrvnKkJZG3/1?=
 =?us-ascii?Q?V59JrQCR0UJJgBv/c9W/CuAdp/HZRbhiLE8Qk3zfEP8id7m4xLfDcBEPW5BT?=
 =?us-ascii?Q?8DeBTjQUpPcnIMARaBe1rvlsR71bISFLEzqjKtKhoA2l6uPFNapTJ8UADFOa?=
 =?us-ascii?Q?nN69s3szNxSNp0zEpjyOnHB/RDGpg4T8QTwXqhP1KjwFZci8GQ/Z4Isqh25T?=
 =?us-ascii?Q?xt7ah8JI8ZRk5pZzrbUDSqCDimMBGtyw0widAq6m71+/NBNQvi6mzgieGmK+?=
 =?us-ascii?Q?psXlqtrLKdDN9DPd68Cxi3pjcHIZXNTr3S5h0JuApIbutQsO+ntpZTQS4Xa+?=
 =?us-ascii?Q?IIlNnrfo8w6N08IfwocvFWmFVx8YOiaZPsPVw8nGhNp8+ZvmFsGU+C53DA+A?=
 =?us-ascii?Q?+WTfYEO1/gLeLoNhW8pI3HJ4YN3x18lx4CVfUFN4NYFN5J4Fgii3cJ3IRPZx?=
 =?us-ascii?Q?2olyWVHQ+RfW90DSayhTD2PlHQJDLSy4gUHzj4W3OGRxv0gJJpDzoSBerAPc?=
 =?us-ascii?Q?wJJBfp73lL/zTLxUEru13kpMk//ERsDIhUB1dfdFowY8kn/eqFI934Q17mmu?=
 =?us-ascii?Q?ANI1dv1eT08znWNmOcxIRVqIDVyqz/l7ndh0LA/iVWfH7IHBBp0AHTDaHtYQ?=
 =?us-ascii?Q?iGvpyJH1+DeCDqpIWq5PkdePRh17aRFUzcqLs4qyQmbNICQ/ITOJu7Pn7UvG?=
 =?us-ascii?Q?vE06IwUatNVP1S/ZpzNnRTcJo9A50Id9vAdn1XuuaxlVHNhiNB3usd3t4Fw+?=
 =?us-ascii?Q?8KOkyYPWKz16Kok07IQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQXWnZ5jGxVbf52XcsJOij5qaUbFYMm6ppQFX2Q7HO/rGK25Ib1/bDobRlDe?=
 =?us-ascii?Q?Jh8dcmQIC2zDQOKPB5B1a+8/xJWA/osk0S+anqNFdvhANRDkPntAqHHDvofO?=
 =?us-ascii?Q?CM1iBeVhX0RigBwsEbuAGWDApmL6htIY4SLo9LJkjxnJ0rXkCRm4Jbw27Azy?=
 =?us-ascii?Q?WAq6hHFk96Gr5hqG5DOFzEeemBq0boUcEsKxcp8gU8lLpJHNbIbyRFRUKTZ+?=
 =?us-ascii?Q?QpBIfobrZKtoiyicCKer3ITSaHN7yRWD0fUhaDVngagNedcP/oDpZ9c1fQao?=
 =?us-ascii?Q?xTS+zcV3zuG2yeEuvzt912h0ZnpalVajr8E6WPfZcprBwDRFz4QUiVSIJa9J?=
 =?us-ascii?Q?5vrvEzN2HY8YyWPmQMDseb8zY9tvtp97cc9Mf4GCJUKx6BDIoww7nvjB0sqJ?=
 =?us-ascii?Q?+brZZ10rrfcQV1aGbYOG9X1Tq3g1/JARBXKYttZxPKyfK6reX9ZLc1sY4EcT?=
 =?us-ascii?Q?XZi3Auv/o5qZNM1WUYDImD87cUYgJ/UrC2mSfBR8b7M7s9fT6OW/Au2Sde+L?=
 =?us-ascii?Q?/2B4qt6VRTuMY8QrXMZWIBB1nVVyESODgFx/xdmG03fvPqzFR9r4uHNuLl2M?=
 =?us-ascii?Q?fZX0IiwQBQt2QEAcMY5Trd5LZDojBlIWsSUvI0d13PqYisd48tVoLmTWN9kB?=
 =?us-ascii?Q?9ZPNEwAq8dFgH8U1gLloNyqd1mGEImgrUwgbrJTAYjasw2zDZ7p3q8RpxZ2W?=
 =?us-ascii?Q?wCFOOWXlGePM60dhTb13jEgUC1X+/6SEpWEgK332hUD16CkX5puqIteePdo6?=
 =?us-ascii?Q?dCz7QcbGYjpdBizff+IDU2y45MsqE8DyNCox6McA4Hz4obkCUHKBfu8NEg0B?=
 =?us-ascii?Q?PpRzSiL7AgZRUY1YNjYJuu51b1ppq2Y9XQMMNM6zVAzgTtpE3g/9zjae5wh+?=
 =?us-ascii?Q?5GXzVLUBx1roK9qTT8XM3Yp+7SseyY5stZX/rZHfUTbLptQ1fCV3h+vNfVxw?=
 =?us-ascii?Q?aq8IWba7kp+gkGSLCKSPnPwaFj98ZXmdJdmrvxo5odl13FUUNyPnCOgc51KW?=
 =?us-ascii?Q?jr6UMSJBGSnskdZ9pcvLfJCwU+Q9jjicFOq6cztBnKtbNwk1N2jHnyCaFs98?=
 =?us-ascii?Q?g6xLD/IJwuPJrk0IiXA2fvUG5nVg+ArRHjrb5/6md/p53j9hSqFvZuMkVlEw?=
 =?us-ascii?Q?nCyLv4p09zQDRNeFAxICPUXfHkhTX8wNY8XOMH8hFK5QRa8JTuEKPO9C94pU?=
 =?us-ascii?Q?lt0g31ASYNwIqux1LlmsDa93n81BvIZ4jA4VODd92PgVTG7a268UgTMYWYNP?=
 =?us-ascii?Q?ViUpunK2HXjRdDm/hgzMcq9KXvCGu/E8si/um+iG3H+PaodpYNCRdDrURmIN?=
 =?us-ascii?Q?tO5i1hlPgR8Xw7KZF7SA9MEYCNP3q/Ns2ZkCiyo00RnONwOqTNXCRDYEw8HQ?=
 =?us-ascii?Q?QpZsE4J2HOMMY5ptGV/K0fG8TdX3gDuyzaowHrIJFl5WWDv7oB7pNPboWgVG?=
 =?us-ascii?Q?Hmv9+yqyhEOqJlR5/X6lrM2n/qaaSe5+frTUpAOEdJIvERNH1hDmF7d/3/BZ?=
 =?us-ascii?Q?XEQcTXikCqr77nJ5dW9Nwq33sDtL9JAbQXO7sxyaMhdiAvQ/bKOnLGwVDgY+?=
 =?us-ascii?Q?o6JP+yIYu1ScOr2Oldj5w7r/T6HiDPQ2n93ZkXILibcoT36pEW2Sexom4RDu?=
 =?us-ascii?Q?BAram8JWZ2Z+YqRtYosK9lCMdjEPTSbLS4GLDS3KDlH+Hc2mzmy1UBotTf9K?=
 =?us-ascii?Q?L1vyAZiwwxYwIbv5ozptbtEy7MVFEo02/eqc18CSpZYRl08emtSOpy4XEq2U?=
 =?us-ascii?Q?Ufo+4a1IEDA3Lo68T14ge+7fcH8qo6Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e19da96b-ba1b-4cc4-2248-08de70d18641
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 22:43:53.7238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xlY8dn+tJJXSmrr/09yTdBQAuu77z9fy46SGzEr/bMgSjVgQBzVuD34AlbfxQ6AGiif7x95KmC503AseNu0mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
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

On Thu, Feb 19, 2026 at 01:45:30PM -0800, Daniele Ceraolo Spurio wrote:
> By using the same variable for both the return of poll_timeout_us and
> the return of the polled function guc_wait_ucode, the return value of
> the latter is overwritten and lost after exiting the polling loop. Since
> guc_wait_ucode returns -1 on GuC load failure, we lose that information
> and always continue as if the GuC had been loaded correctly.
> 
> This is fixed by simply using 2 separate variables.
> 
> Fixes: a4916b4da448 ("drm/xe/guc: Refactor GuC load to use poll_timeout_us()")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cbbb4d665b8f..aacf77f09522 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1179,6 +1179,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>  	u32 before_freq, act_freq, cur_freq;
>  	u32 status = 0, tries = 0;
> +	int load_result;
>  	ktime_t before;
>  	u64 delta_ms;
>  	int ret;

Nit: load_result declared on same line as 'ret'?

Feel free to fix this up at merging.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> @@ -1186,7 +1187,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>  	before = ktime_get();
>  
> -	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
> +	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
>  			      10 * USEC_PER_MSEC,
>  			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>  
> @@ -1194,7 +1195,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	act_freq = xe_guc_pc_get_act_freq(guc_pc);
>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>  
> -	if (ret) {
> +	if (ret || load_result <= 0) {
>  		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>  			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>  			  xe_guc_pc_get_cur_freq_fw(guc_pc));
> -- 
> 2.43.0
> 
