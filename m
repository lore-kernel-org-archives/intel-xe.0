Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A38CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233E10E222;
	Fri, 22 May 2026 14:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KG8MMlzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132210E222
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779460320; x=1810996320;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wMPtB9NFgCivsiyLH6MpMXYJzSOtFmTgmbo3Iu2NIdo=;
 b=KG8MMlzhJRjEdC2GQzMDnG+J8RH2qU1dKkBSCvFrpRHeZi5kQDSyHxXL
 /JoLyTVfO5nLncZ1rSh8Ps5oqN3yT7LU1B1PDT+g8MijoQ1mGZqb5NJJq
 DrPG4Tjz6kqydJ1brFdFpXiaTwjVpv7EapUzsvsVl2royozxjCQK+1pRb
 6Kzpe8ECQ7TjoUBUBHqRqPG6xOUzo0bweJvmntgVKVh5Opd7bqhjIPZgB
 aJPOy5NtT4kleVn6MrZBPqH845EdC67kfWgdkuAydCnn+oZI6crsFqzwc
 1Nchy+t8FLvrgvcYjFzf+lhlWq73uNxeKFJ0FF/JHC9f89yTT6dN6SU+E g==;
X-CSE-ConnectionGUID: LbM3C4/2TbC0j2baJ2lqEA==
X-CSE-MsgGUID: +hvE7DneQhmZGRyGVq01HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861710"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91861710"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:32:00 -0700
X-CSE-ConnectionGUID: Ec1Ycq/dR1qLsZlyE82abQ==
X-CSE-MsgGUID: jZFXn+AOSnOfzL7bdYG4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240795186"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 07:31:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 07:31:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 07:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqcJ5DmS2nuiCcHWMkxNY9o86NB8+Pdwn2P91M1OMiUJAwhbjkX9ePGeK6SfLj65HLrtb++gEa3UVzqlQqjRw167mOeEVxTVF70feupBohS2owQSLg1YJB5fxt7anBn2IqIeUgy3ukCgQb9EeFJ+Bar0pg9WvyNjmFWbM8dW4QBqu9ki10+TsSbZlVgr6SyKM7CXo7SgAvMeHSMKy1uKxRsAklV/TOHL21Hj20lj8uZY87jTrubAoEAy7IpBiA8ZIUpDTq1Bv73yDdICVjeSaktnexCY8fRINrrBBQflzlBNyEiWUyvvQ8Ql9LluOILrx6SOclep+2YUn01chxvyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uHCD54+CbhrKS3w6XBxl+to58L8pexI8hPi0EWpqUE=;
 b=efVKiWqUFM0rVQFeVDD+sTaLB/WORezRclPExB3cXTjAzNMokxkVXt4UzLyUouKXAXYCG+Nx3/VIGZBrlPHLlYkAFJIpKnp3LuauuPAhGs5M08RqhLlYQ7dhATJX26ZrNkpokVbFWH3O9VDNOKUPcZFoLVATLi0H9cGz6teI/ppeX6ZMBV+jJV7FyhHCbTsr/Vjr5wvSs8Oj9+Ma6KupjnzCAQ9RYflxewIFPNCrunX2VKY/OHFQrTdNayY6qjFShPvCEd0MU6h8jT7ooEHwTD044WxHp49954vGS57dnUSaGT4EnI2vJ5PKN1CFtRH0PUqShqY8b7TNbMXnQCMk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8415.namprd11.prod.outlook.com (2603:10b6:610:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:31:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:31:49 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Violet Monti
 <violet.monti@intel.com>
Subject: Re: [PATCH v3 0/7] drm/xe/rtp: Miscellaneous improvements to rule
 matching
In-Reply-To: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
References: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
Date: Fri, 22 May 2026 11:31:45 -0300
Message-ID: <87zf1r1pny.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: f004d38c-0f80-4aca-ee96-08deb80edc03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: ExoVW4V5z7zuldmhePy0k+hNduL1IVz2VlztBplfkYEjHnDGjCV+o3/odjmKnZDsM6KjCqrwGK3x69zKjtlqKoOk8hLh5rn3AcYGyjWVyzQg9nHPeDrrn8o/63nLDrO0TDw8I01UrIvvacO/vrOdufr+mTmqSLeGIX9kpTSYsGVR7y8phX18R2QbhSPV/Zk1sHcHG9OejfMw90lPbpjmDir5d0qfkQA6maybqPNJyYkxArldasP60zC/oSqi/jOhY2ixYWrghYYWLrLylAW3qPnquS48tE1ESevV2LKAtBUl7Cn5xQxRUGbTJkzhR2PE3hSq4jpceUo5WlmJsdr/Nb+0r/RgLi664sCkRd9jSS3zHOiZd0WmHfx0FCv1rxTPQh6oeIll6Ty9kC3xbsJqLJJDhYfYFlmgRJxv0A3LwFLdZ46jIsRZkOH29STcaJWD6Re2WXk6pTmemz/PrYl7UwlTsk3H521+66SW46miHQX7L5Y5ojelv7RLGDSl0Ivdbn9N0ve+3v4NoyofPkrcGbaY/o9SuwDcGYGIhs9mH2wbGecKsuCcGxPF9F8B6HtaApm+4399N5kPipID130s1vAWaOHXYjAdCgYAKvL5mgu+aOwKjgmRaPfxGsbfgxRtTUB4i8++Tx48LFfMDTROkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fz9P78TJdoZvlionQr/HhQYF+l/rNGscV1Tm7MiM9pv+B2zjfoVGnCf/0fdO?=
 =?us-ascii?Q?Dd+jgkIGLcZ6EzVWLFhxftYloUjuXH8SmAcaJlHr58pgYEBbFSn0Uk5WISNh?=
 =?us-ascii?Q?BzTZQxcfn8HOWUPXE2faRXU6NI0V1ch8h2b/R0iXe+EI7WZYfXc8JASeaqMn?=
 =?us-ascii?Q?5kaeVXwd/0dye/OzNi+x8mQ08o56YhjWEqQKyIzBO0k7vXK04BUEhD9ePY4T?=
 =?us-ascii?Q?GedC/Aj7Sw6zjcis03WSiDp4xyglTn5SrTCH4jo8c3mMlAXDzuvP1hJvAi0N?=
 =?us-ascii?Q?sACfk/CmZa2J7/jgQOo/1ZPbVSMlIMnQl7pFKhUc/RHq8BDfAgJtrQcXEJOu?=
 =?us-ascii?Q?iHqPMyPBUr1IkABc8rfG7udorLnRXSbsEHKRHX8SHNP+1YKugjJaBEHDGOln?=
 =?us-ascii?Q?Ul8ib7gSWUE/OQszeLKzTQqtrInDUggdUsEqr5/m/bz3fMnqSfsIXIVsFTjs?=
 =?us-ascii?Q?gF5710sb9OObgXKfDdjoUQk9DLb7QdM+7v5QxMEFDJ51IdHmM7mP3l5STOS4?=
 =?us-ascii?Q?fD0F+Z4ETMcg9YRW4a/IXdD2eff3J+Vd58wsauRX9ZnkJ3a6Zr9uJuR21CfH?=
 =?us-ascii?Q?m1+FAYpQLMXdQPbC+W5Paplz93I9oQHoEA+XL0u2swIMUXhBx1CgLvjA1pVk?=
 =?us-ascii?Q?j2wYgwkAewKcsIuUNCkK+yYpozRUNwD1O5o0baire26rrfX7WLIrq666UDJQ?=
 =?us-ascii?Q?6DkqErKpDFAF1JyiNB37R80TDRJLoaZNO0gYuRVHNHBU1GxE67fpKXhwrKfE?=
 =?us-ascii?Q?+lIKYzMTM0dVb2oYfDl67RrKLbtScuY2rR28sUxD+QIyXAg8bw2OHnsh4jDO?=
 =?us-ascii?Q?//q287VG5ZfwFtRYXxyuZ8jGqLxuNE7lKU7rHuHKIDL3AIgjYTPTJUcou8S1?=
 =?us-ascii?Q?okjtAJkBcvgxphgV52S2RQk/xVgCTUb50OvV9wv0qL0UmKnp98N6ADLRoOYc?=
 =?us-ascii?Q?fw5VXtVLn6MjC7rQk0AWDd0H6UAPI1UQitkdV67PIJvEJ1R8hcufc2ANHY8F?=
 =?us-ascii?Q?8x0ssCx7Eoqn4MJZ7P2Naeh5HR9+mM2K00XObCkMDTggFxKyNbcuQ0vJTOnL?=
 =?us-ascii?Q?+mbKYKBvwToSoNBZtgzUQjTVit3EKUedsiQOzCJfxfQWSvJ8UKA/mz9ZAl56?=
 =?us-ascii?Q?nQQRiZa2xi/HNPg7t7FfNxhzZyEHK3NgFAecCDHMCG6Xx4/HW2rvIoGNTsqC?=
 =?us-ascii?Q?v9GG9LMrImthVkIA30ExoT7RuZjtY/F4nkdgM29oy6xSPtXFW0Tv1Jx2iJ02?=
 =?us-ascii?Q?BRdxyUKiByFORDtx5WQk5Yg0GFjZsCUXEmtiD94iG8fKuJri14TjFEJOxWne?=
 =?us-ascii?Q?UXPdEhBFOsIEoE/UFXk/1PFXYGcRbNcOuo5Ey7ir7Aw/jSaLaMl3piEHG8UA?=
 =?us-ascii?Q?Mu+MjN7QLuXrWewR/YW32QKhaY1JS5SPgqNCNnyyl73zKaEdIyLOcqnyRHt0?=
 =?us-ascii?Q?7F0qLXg+QTd3yHn3KtmE5mOCwVbG+mD9CPOXBEAD/v2Fd+IbV7UsciUcRBVp?=
 =?us-ascii?Q?/h3jVfJo/zf+PuWZexWe6auEF3LtqyhivQMjLRRI24MND3RUd5avxBGdc47a?=
 =?us-ascii?Q?TULGlzh6cSm6gy9VWLNg6Y8h7WZ+njRIDxbYuGguNSmPYUapv9HZV2Ck4DcU?=
 =?us-ascii?Q?JemMRvhhf3OzNJVbkMsb0RBIKnzYRQcnN4/RZlrMXh8w7qOyp12lkfDGNNA+?=
 =?us-ascii?Q?1sU2g46DYWUjm2RVst7aqfh+cFNLsclk1tETcO+yr/a4WlO52UPad8wSlT5d?=
 =?us-ascii?Q?w4Cde6WnNQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: VvE8VD4G3nSiTwNTM/7scASv9qzGcR+BisX8SM+H/wztUIUCUOvsRvYHmn+DIq30On0SXGt7IL5iAZsPV/jyv9JbnZ4k0h4I9w1QhEX5rEjrX1MGtFLS3zmwuXEFJ2Iq5LYAtUJ/iWtUxlVbWIROXKJDk4tj9e6yTgnwbcR2+0B1uUUEyAvOCUBSudCXUk4b3t29AFMWeFdQQA3ELsXs5pmdnMtH6pRR3OUgvR3tPF0ZZDsJqe4MQchdh+7hOkizPwRrh2po8yqF25ZmdDYnCEY7jH8CkpKGIsXMxN84zeod9ERMtYFs72RtjZO4IAqiYr8sLEuNuYeco0Yqnmj/kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f004d38c-0f80-4aca-ee96-08deb80edc03
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:31:49.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qIwVUoIebdyYiRlhcM0x/D6lZsb7155T+9moi2+nVfyT08GWTBd4JTsIeerPmBprUDVhw1k2dGKXNB+XoBIeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8415
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> This series adds several improvements to RTP code around rule matching
> logic.
>
> It first starts with making sure there is a cleaner separation of
> responsibilities when it comes to the generic kunit testing for RTP.
> Then it goes on to improve rule matching code by making the parsing
> logic more robust and restructuring the code to resemble a formal
> grammar and make it easier to add future extensions.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Pushed to drm-xe-next. Thanks Matt and Violet for the reviews!

--
Gustavo Sousa

> ---
> Changes in v3:
> - Added eBNF grammar for the rules to the kernel-doc.
> - Fully reviewed now. Sent for fresh CI results.
> - Link to v2: https://patch.msgid.link/20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com
>
> Changes in v2:
> - Incorporated review feedback. See individual patches for the
>   changelog.
> - Incorporated the addition of the match type XE_RTP_MATCH_PLATFORM_STEP
>   after rebasing on latest drm-tip, which is reflected in some of the
>   patches.
> - Link to v1: https://patch.msgid.link/20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com
>
> ---
> Gustavo Sousa (7):
>       drm/xe/rtp: Write kunit test cases specific for rule matching
>       drm/xe/rtp: Drop rule matching cases from rtp_to_sr_cases and rtp_cases
>       drm/xe/rtp: Don't short-circuit to false in or-yes case
>       drm/xe/rtp: Do not break parsing when missing context
>       drm/xe/rtp: Extract rule_match_item()
>       drm/xe/rtp: Fully parse the ruleset
>       drm/xe/rtp: Implement a structured parser for rule matching
>
>  drivers/gpu/drm/xe/tests/xe_rtp.c      |  38 ++++
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 327 +++++++++++++++++++++------------
>  drivers/gpu/drm/xe/tests/xe_rtp_test.h |  23 +++
>  drivers/gpu/drm/xe/xe_rtp.c            | 321 +++++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_rtp.h            |  29 ++-
>  5 files changed, 486 insertions(+), 252 deletions(-)
> ---
> base-commit: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f
> change-id: 20260114-rtp-rule-parser-ac01472acdeb
>
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
