Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B5BC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 19:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D8110E20F;
	Thu, 13 Aug 2026 19:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKxrLlSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8110E20F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786647611; x=1818183611;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QkzjaJJT1pjzR5r7mMIgac1IL/qK/3Jv7wn0/X3RukI=;
 b=KKxrLlShD3X+tq/HUoGkptTHbkskd8YkYHUKI1o/y07vBPVhuQek4ErL
 FXt4j9i0nbGl7zX3tzCIfhA3yTz35U0mXWKZ7rdGOBszB6TsVk8ySAbeI
 A7AdJRieZ+X4NixSLlwQTFHdlbfuWy84ixoia/4uI/6e5sOg2F+9X5W8i
 RiYemLR2g8Cvxc+rsf77hiOJV0KffrpPsEGbMtxT9M2Ya5UHr+Vhhr4B8
 IDujWCS5DP0UJIPI6j6Yl6jXbXMYUaKtsCOAVyEZXe0ShN7zdYTxIsT18
 NX3wfSLsEN2VFYH6+1mRt8NiLOjApMQYFeRs0c+HtZoF4o8waGczndqMe w==;
X-CSE-ConnectionGUID: zb7ztMyCS7+H+BpleFhExA==
X-CSE-MsgGUID: hma36iuURXCGzTZPXOgs7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86194685"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="86194685"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 12:00:10 -0700
X-CSE-ConnectionGUID: YK+WYhCmQx2Vnc9AG8v4VA==
X-CSE-MsgGUID: y9TF/3NoSGiVCw0RgCpvgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="293950921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 12:00:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 12:00:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 12:00:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 12:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX6gX1lW/vbrvZsFZWKvveWX2nn9jk950ZL25xn+y35r8Qu+8Ut2A1j14J0zbiFwOFQg2ra+DH6L9840z43ho2jnzzZXbLyvcok2Fsm9KtcBbc1QHX/6lg+FC/ThIthXpSxtbmtgyjdjgjRD0ue+w/+3Yt3sQkWrv51PMsITy/Y3Ojo0Uwag4UfV9hKqG9ecTMqHbKW4WOTUXtMHpgavdewFoolbpsIwRuiWIV4l1UQ5ARLHpyGY1jl8LNwKpGPCud03UUxe3mbqqcAbpYuHikX8I0EjH1o/qsia43P05JgKus3exXfW4b4YCmNvVESwMk/wCvvxDrtzugTI0JvZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4Swn8ziRY78ln1tbeDJw2GRgAkFev3ya9XmxtQ3gRA=;
 b=RnXKrYveOQoTgUtjndF55+Jn5PjXxYYlBN+bzmGWnC/VyLZdxf7cYU08Ar8LCapMLBMrsJnwsWFh6Yv3VGb8QvQguuEZq1zFNpIpsEn63hrxuLFNH3o14BmLEyTQV1Jt/ziHZNBVq/ht5Bzy89wbqe8Lnjo0pcPZihC3xS9EeigggktrXnFMmvMCzFHKHQwW/cESvD/W+NF0+Kc8AfKUYFWq9JY3hepnWXeLd/4JamkvALqGsQNYELGEoQC+lcjrGeOJpDeNw2gy/DUkGG+YH1Pcb3KcePzMCwA2vNyyyRKzq2VPkRnExx+qAqx4GJu3beT5rhEFlu8xQLiR3yIgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 19:00:05 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 19:00:05 +0000
Date: Thu, 13 Aug 2026 15:00:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <an4UMRmPXPbTnBGh@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ed5543-4bb1-4741-0c7f-08def96d1645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Mm0uk038tNmquIYVvziT3LnlUqlnmYhKRqoPE0ANKSZbJyXjWAmYHEFtvHZMwwpiiDEUJwBt3dJ4KX2dCDU05VNlKTd4s05qplNGyRdPiFU303OjQBPIxFkuZirlOONzigFv4SeXTB/7i2EM5/QBa0MhoikpeTlYoX3mvUVTmqBC2nExunqgIGH1T+agE9yIlHx/gAVG6/ESXI2ZV17bWsIpRhH0gic9aPs3r5wUN6ec5ZR0KATBY5DZmAqDmTfN3OqMqOhi6z9ae67hfKWUz9ZwAEG80dNV2BR7LKsxE8oPCVPrLFOzMJu/DPFMC/gBiPPWUWcoFzc/hzfzGCyCwlVc+dgZne5/M3TZIM9VBR+3yM4Vh4bFdG3ZQBiBM40DfOv2MRGR22KIQx3X2YB++tuVgHZjynrvw/dmbsyjFMNQek0SSmQFk9W7dWS/xU2ieeZsM9dCejSjGfSfwWAcHlioUkmioMTJYez+BROa0wMHcEPsCzZxocuyjYxpda1wdd0A3ORNG2ahKtIv0C4ypc/cX55YNtxdYwffGGw6grmaZIAgJ58s7m0RVRtVLQOXHf9s7VSGBAKKhuKDxxgOS/OABUUabAhYEKtVT2IhQUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vfoppctzVvm5JMjTCz62xun04tpjkSVwzLyozWtHrldOnC7lUzdShubs9E?=
 =?iso-8859-1?Q?yuUnsp6y+Qbd6p8aLdqMn5K7HWODoclMXGWhZ7N8yJeIxK+BbFlF/t4WY7?=
 =?iso-8859-1?Q?CP8bnJkZPO6lbyKwwCsWcmIlbIZgHLuIm1sW+t+jQkYmWk+AT9ml+jPg4w?=
 =?iso-8859-1?Q?QsTuqM5gcEP01X9sPjmt+IKXtYmct0YGWX/8PZPPN4k07C1TkfCwYp/bVn?=
 =?iso-8859-1?Q?QFRb2VPRcxOKrG30/Dh1qcKkoEwr6fe96kH2haiAnDC6VnNpjjQBR2GCzh?=
 =?iso-8859-1?Q?Yb8Fz6AydDPN7Fdu495o7XMaNKHupzGz6U6iwocLaFqfVW8UjjQxXJi+Bf?=
 =?iso-8859-1?Q?IISsRPkb8gD2V2PmDxEX/d3V/YcIYBph27Scwxps9djHshiHAWr44WyNTr?=
 =?iso-8859-1?Q?8mNO9GFWCEPADMOaRLqVBtRIGe2OsGp5/1/B1ThoYfqdmV+9mAoS/qCy8X?=
 =?iso-8859-1?Q?FdjBpq1oyZ+CPow6SZ8feUZ8xuhdcy0hUsO2b1sOhugHkcPZEcngRa5POG?=
 =?iso-8859-1?Q?rL88B2FFEu286EvNMM4xt9/yNlQwHvqbcz1PPrGkIA/sDPsbfg/89FO6pP?=
 =?iso-8859-1?Q?bJ7bhAxBd84uGq+Zd4SQvHantPo93uIMPU4obp4avOqFHqhrh+JoiIEqLj?=
 =?iso-8859-1?Q?AZ8opRYpk5K1DSBb0wN2Dxjh7sLiIWSHVJpmlacDioybvwrDBhQ4uQW/p1?=
 =?iso-8859-1?Q?B1IpCkYlVehRu23URt4vQJgZ4edji8Ap0HjNkMcYePq0GG9+3DFy8tIawm?=
 =?iso-8859-1?Q?SibDxayBH853Qsb9JXzy+xXgywlvmJf5hJ/4+6CBU3lczg52Uf79dRWUZO?=
 =?iso-8859-1?Q?lzY8z+vutQD/dndOAGDSorgvSDvab7hBcOalSZcZbIG68Ei9vMWT7dXSga?=
 =?iso-8859-1?Q?Z2BNx/WpNOtfod6Ef90TiBhcgOj+jeq6GvxMxpqCSLFx/lw+cSdVK/0wjn?=
 =?iso-8859-1?Q?vp4hcm1lNK57m5WNU9fkULfFbFUhP8Mv4fOVI8Vwi/Gur36+0vkfU3GpY0?=
 =?iso-8859-1?Q?fZEB+5Rc3K0wGoi21nQcublACYBd5akAjTNBHsHoBMS18QW7yLWJ2ORFV4?=
 =?iso-8859-1?Q?w++rYDenPfMka61cQnGYpxL2z5L8zSVZVYWYL/kvNXgCIHR/hpqhSsGyw6?=
 =?iso-8859-1?Q?Ck+V9sIT8x7DcSv/caufd6Cr7zOmEntoKtLYX/JExQGTci+GKypNHOvXI3?=
 =?iso-8859-1?Q?hJTbryeIHmbCzfOQ4B43AgMIIaXGNo5WjwNPDqBgRCYYbyf2WVysSDAa5/?=
 =?iso-8859-1?Q?y8aVReAjdYT253PjRtF89wNsAMvFlQhr5lP96UC86H3pu8fzWuGlw+COMQ?=
 =?iso-8859-1?Q?net9NnGzjCHFGDhstpWPUEPN+xS1FC9nmCQdcTHL2EKj8Ohhf7UUrkjcHw?=
 =?iso-8859-1?Q?HPooxiMUmYYWFnpQH1xgAQ4rboJQUQWyzcY487H0uEUxqhlzjYHia1+ry+?=
 =?iso-8859-1?Q?KAlTcgluBIc+WrlxCeVRcNUj9Rm1fP+WowOjOMf0Qxucz0doxE3BxSypFo?=
 =?iso-8859-1?Q?turyl4kYg1jl9s/mzyqRx+nl0UbC0cxIf+pPJubEFSFQikl/VghN1JHjO2?=
 =?iso-8859-1?Q?flF22yLhb1I/rmwuaAjdxax08caBplG4N4Xd06l+hpyzGv1rBOxMUpgF/7?=
 =?iso-8859-1?Q?E71BYgq8xPCQbnzoEuxMdVNRSBMpw3b3X76tBmbeHiuj6U0ZQoHhRAYYbB?=
 =?iso-8859-1?Q?1dDQMLzMVAIGTdq/JPc9AmUtprzD1teBN+d1BElBRVzXgZINI4qOA037qM?=
 =?iso-8859-1?Q?eQZtsd630Cu20zy7ogM+ZEHVsAVuLeA35ci4bEI/5vEah0NbL6oa/c3obl?=
 =?iso-8859-1?Q?LN+vyWyNmA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Nm/x/hyB9wf2gvFDHLfZRGP1YMboTHKR8ogET7nInutL28MZBZ8OYfhBre4SLAAYYghtm/2uC0zgUXNdmiZUIsKb+ZCFxw16+JdH8HC6kyB7PhGz1Pc65UH9EOXv0SMHdYUUJgM4QP+oi+La9INEAP2paCvdhKLWCqtYc0bIjrXFEu71prKJZgv0dSZ1EW6hnLak3GE/ksY9eYXWEUX5kWvw+xvodW3zCnRVaujpD9tyfr9bjNNMJZasdYqGSue2+1Zm99E5SYZL0BUef0rwpHV/tIh0PL9QvrxNs8y+KvfpPz2LTN2mKyqh91PR0//6shl0KCWXZVSlmonbp8SiXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ed5543-4bb1-4741-0c7f-08def96d1645
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:00:05.5577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+Qsl64rQvSzDofvXVDDbsA1kOtUOGNUWRzBTTue62S0YQTYFHUjKWMehoPuH7Np7/rsDSpWvM9NET38NFUtUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
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

On Thu, Aug 13, 2026 at 07:12:41PM +0530, Nilawar, Badal wrote:
> Hi Michal,
> 
> Couple of comments, on rate-limiting and XE_SIGID_WEDGED, from v3 https://patchwork.freedesktop.org/patch/743308/?series=171022&rev=3#comment_1373861
> 
> are not answered/addressed.

Hi Badal, could you please be more specific about the questions and repeat them here?
I couldn't find from the provided url...

But as we chatted, this series doesn't change the behavior of that and
the comment of rate-limit is exactly to ensure this is documented. To
ensure it is clear dmesg is not an ABI. It should not be reliable in
any way or shape. It is simpler a helper.

On the wedge, the resolution buckets were removed, but I'm not sure
if there were more questions around that.

> > + * Examples::
> > + *
> > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> > + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
> > + */
> > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> > +		 u32 component, u32 location, const void *data, size_t len,
> > +		 const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +
> > +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> > +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> > +
> 
> From kunit example I got this output for hardware errors.
> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR*
> SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: testing HARDWARE
> signature
> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR*
> SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1:
> testing HARDWARE signature
> 
> SIGIDs 202 and 204 correspond to the XE_RAS_COMP_DEVICE_MEMORY and
> XE_RAS_COMP_FABRIC components returned by firmware via xe_ras_error_class.
> If we want the component name to be included in the error message, what
> should be passed to the logging helper? The current KUnit test uses
> XE_LOG_COMPONENT_NONE, so no component information is being emitted.

Our design goal here was to minimize the SIGIDs and make it per site
due to maintenability concerns.

There will be a field in the actual CPER with location and that can
also be printed in the msg if needed. In a matter of fact, this
is what we currently do anyway.

Increasing this to a per case id is a big no!

Thanks,
Rodrigo.

> 
> Thanks,
> Badal
> 
> > +	va_end(args);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> > new file mode 100644
> > index 000000000000..d475e816ee0b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_log.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_LOG_H_
> > +#define _XE_LOG_H_
> > +
> > +#include <linux/cper.h>
> > +
> > +#include "abi/xe_sigid_abi.h"
> > +
> > +struct pci_dev;
> > +
> > +__printf(8, 9)
> > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> > +		 u32 component, u32 location, const void *data, size_t len,
> > +		 const char *fmt, ...);
> > +
> > +#endif
