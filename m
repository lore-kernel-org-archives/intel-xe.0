Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5AD10F9303
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 21:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B311B10E311;
	Tue, 31 Mar 2026 21:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZihzZL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7400F10E311
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 21:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774991815; x=1806527815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KnTk0O2RDXvaOvLAjqT+kjmBXl6oL/o/jO9Jr1jYXvs=;
 b=SZihzZL4Ez3ZIR0LuFwFjGZ0NHn9IjNNsx3+komYaqZu2kdw2RkGQPWE
 CHc7ozzrjSY9pMgqkRyl+PVOiGOTSQgKzJVI+K8Ppt250WYjF2Q3Xh0VH
 94hVNg/G+Apu6Wq7VrybZUIAi3/U2bmkzA0ii54wYP1csrCZJiJ8wZmHg
 v1oL/uXMYsGhRQztCn8PbymjpoWtA1bBpsEHqzLWYCEhOkAzWk8rsCSp/
 7neI2LSfV6dE6eeiIPZO+OGcmUB2l0gPcBWpR2Q6dv3H15+Ym13ckqUW2
 PW/e8wh3NfFZjyfyJFle08+WaOxC7Sb5js7s/pYVCJOaJIgZJ8avJ9Qi2 g==;
X-CSE-ConnectionGUID: Nye9+9JLRmCTsvTWSX6nzA==
X-CSE-MsgGUID: 5sOEfyjpScm1ZODoRjgi3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86322231"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86322231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:16:33 -0700
X-CSE-ConnectionGUID: 7sAP4Gz/Tp+h44MuNQlQ8A==
X-CSE-MsgGUID: sKCc8vJFR+GwnV/Wfb1BXg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:16:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:16:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 14:16:31 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilPjAXU6LQFurG5kjDksa4iCi3Re46INGiLZgNmfRT+I2jtlh7gIdeIAunfc96o6nsSANpRAy/luP5rBsbDB/J7xuOGEGBwGye5DD2R6GzoN+rA93xYmtxOIzyyei9Ax2FQ7CIEidpTRatbHmGM6Y73XVC9vu8bNbJeib382SzmplIVDsbCzM70XVL/wC5jNYiVmxP3dH+5dQJRhkdJ/NvzEN1bUU+fnDMSrLW7ksmPfHNGpZn9SaDOK99iV4i8oUrWHirGGfsN4kIyOWOymonacJVUDIOic5kPC5rpWYvEmh5g3vVVb9U0Q2uBhJCL1FL4gigGRZWMAhfvpkC3JWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66qU3DLBOz7c9/0HtfN14Sjvxq+6mGyplNlizdwyS2U=;
 b=gidrJ6Ltv6tuDAG19knBg/xBDN8O3SJqo8TTZH3OfV9ARKu1KeQnTlUi9Yf4S70EubRi0twwT0fbnRO/ulWJeIfAU1sUJt7uSZwJwTCRlDRx0wnl2wofeks58xTUEWZILTlwLBcTVG5mSsR4HpEcaMo1OoBdn93+dJOsBrYYTlWoKc+aZ3WPKWujrH9WIqkegj8NrgbGSfLPji8nFn8UbheQpodHZb4hdaZYvpoQWSGNAMLqjy701QzpJZ+vTJUKCUah3QDCnhLv27RbNrA6rkduWtn0mS+Wel3qytYUj9DbVEdra6WO9u5jZpfzy2QhEIxNV2b4BdyXh2n5bxomzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 21:16:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:16:21 +0000
Date: Tue, 31 Mar 2026 14:16:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=3A_Se?= =?utf-8?Q?t?= GT rp min frequency as
 1.2GHz default for BMG/CRI (rev4)
Message-ID: <20260331211619.GM2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260326063407.985568-3-naresh.kumar.g@intel.com>
 <177454950610.403161.16980901391584418414@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177454950610.403161.16980901391584418414@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: ae31ebd7-dd99-4ea5-72b3-08de8f6ac1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: d4XrR26VstP/UcddUOT4XcO5JQe8yJEFpTUuYcbNF8E81UWamiU6lRGS+M4F5my17PAd0Ztup9guZNEjMFGHkzp86LbYDdX378+i1iG2c2fGwqtF0Aj0d3y3QfZeqSJgX2YnLmoiSX9MlWU75Xx6mWx2XiRifn67Nqgpvn9g3DK+c+9ZeETdTATQiF0GjckMX1vgtk0QWvyY+cPqUleymypdbBZBeE6o3oXaQNnzp56/AUa8lFxVBGmxvvRW6OX+fiPTh5WUDBhvUbWEdbojoyPpy6KstTRsd4mPVAfVxMIT5HsJRxgAI4Fz7LNhlpiOJr5ub9ix5qu3jCvfUo6nMJ9swVocXNZCfLncnpzh2nohrG/jOe2IrkqIezO54eEfbGRz/D3zXyBR7wbiYvWp/AlI/XO8YoQdR+4/XAQKK8pW4gxRaSAzatI5pPj9n/ZuoLnvFHYt3Ak51bytuSPjWELkgFFkcEx9FpwnYdc8FRpGNQMRUXESMnkkLkvHOLmwtLAh647wQYvp/vY91K0FLhoXOqvr6+uhAPONf9bLquUtufugOOoSpGK8/Cw/erxokXdsJgAfmHcYM0a3jo5hhgGubvdKXu17c+DqKkpLpXVUaGAlOpsRw/iGAgCDtcjkprqy7i7MAxhKOl2QeuMefypwL7ZLOFNw4DuqsEN8WulJFwHeadFD0ZD4xQa3F7Hw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0XZAtMjzqP2MGIwNR2sVlCdQ9s8tA4/OZXFueoPQCTgizAmuKbrXeoclDsL?=
 =?us-ascii?Q?wbP7NdZx5EaekyaqTBMjSRLeSJxwLBhButMiL/ZFa1/N6ilysGykz0BRKdQv?=
 =?us-ascii?Q?4Z9ncm58HHtvU7YDA5M8DkhGVvKMoQfMw/bj0HZlEXWnbdFbVYkiYp4xo+Mt?=
 =?us-ascii?Q?II2k899AKVqFjYMQH9fIvIiinXmtoQZEcBiH2A9ci99IUuMQS/xLysUkvSkt?=
 =?us-ascii?Q?t1bFHkPk/7/3jHeE6oKJQyuyblTgx5GR6zJBx6gfSC/OJ2qvn6u2+6h2Hbfh?=
 =?us-ascii?Q?aLcw3JsWKwJkAYz+KlPGtLGQg3DK9tdq0nfDtzoq9BFShHvTGVAUj5eGGMMq?=
 =?us-ascii?Q?inpSuhxogM2nHH6qGBY6wc1g8Rz2iNHbBovLpegfWOtPa6kCZK4ZhG66ct2e?=
 =?us-ascii?Q?0acqrkl/fLSJzY7IZdHJJgGoSXaCJXGvKNVC4FGiUBHmuVOkquAXR7RmDyo6?=
 =?us-ascii?Q?ALYB25cAViO2gzfb2p2J8T8XrWHyvKl3GsuAEexvMTLM39izSdUw3rIrNDvd?=
 =?us-ascii?Q?n6sz3IyZh1JaewAHH64Bzw4hhvyeCDOkIbcFg9E+tvNEFcMdtzc7iZ4LCsYs?=
 =?us-ascii?Q?9+3p/CK9zSP7FDj2zrE7I8EvbFNznni3+GW1yDbPeKQ1qepkFpuv1Fs+rsIg?=
 =?us-ascii?Q?QKlkk75JHyPs3fAmtfziai1bQi5mXexLpOMZHRKk/jNTpkuO54kOagBj6Yuv?=
 =?us-ascii?Q?PiUIxNIckGhY+tJRplnSDY+7fQUTQCHzaMwQEyJkgFIVCQ/zhLlghQs0PpTX?=
 =?us-ascii?Q?6vPyFS+mo9mqQcgK/GIQsjRdxS+uiy/6bnxX/fz/HjPXJOhS/AGiIe7bPk0m?=
 =?us-ascii?Q?dogIQcZjusoqJpPYbRqO3+ah7RCV9GvHEN5VYV4iL0LAbDySeFpC6u91F/nH?=
 =?us-ascii?Q?lIXfIh7QduoX/q+tzFB4Law2R4kvdOdNaohUzYL7wMhsy1gYTcuWYfCxU+Jk?=
 =?us-ascii?Q?zvxVKQmR71uocpTGuoWflTSPQ41/c0v3I4qgP56GnTVfqwtP+oHJWKh+7/JG?=
 =?us-ascii?Q?s14+J5gR2EZju2BsG3kDcgzSQZE7fZRmT9XDfBQw+SaDDwG4M0hI/5JQ1fwl?=
 =?us-ascii?Q?iLsnOntRbX/fuLrTkYHLNLOg/P0SqoT1zWCGc2i6wisCqIXdNNaNrmFU3vRC?=
 =?us-ascii?Q?jn4vWg7OFfK9JEaKViG2x+yhJi7Fc6rm/PeUvV5HwwOjattQ+qI5hdfaF+8X?=
 =?us-ascii?Q?WfPakeC0yCypPOCofxt3yjQLVW4VBsiPhU8gGJXdWtuW7e6XtzMuPPEXvTOA?=
 =?us-ascii?Q?sj3uxCQIWmPrevdqXoyhdoc+pdrLbkbbA+jN0tHTQiMXFi83fcZb0H/uK6E7?=
 =?us-ascii?Q?Cma0jgbQE459xLl4vF6jTsW5mYaJPrSk3/RkIiVhLhjuK+tezn3cQh465+aq?=
 =?us-ascii?Q?Hor05Ypc886vWIuC4X1hCPPd2o5DFT+kZZhSYL2leHxqBDXQIASS8euwDo9N?=
 =?us-ascii?Q?ExkQrl03CxaY4sawLz+nahb6zr2ryIiH8mWOg77U8vYc2TLt8pmTPuCmgILH?=
 =?us-ascii?Q?H69Zqqs5o/WOWuP9ppWFspfQLxrn/UyXVWqzTHi/au+FgvusiUgwwHZDmECE?=
 =?us-ascii?Q?H+CeNpjeA7YtShM7vu1Nl3N+38AnHg4y8fQffw4eCwFDz8e4LDfcy+pmEruP?=
 =?us-ascii?Q?+0CIJJsvEPU4H2oV7Z8HCVQDg7FxMUFnjujdarOLOHUzrPsvMPQScw4Iye8R?=
 =?us-ascii?Q?4Oi3Y2QhhQQCFkditq/+BWvVBtee5OvKowcuwnu9CSdBcktj3BmcJkDuuIXM?=
 =?us-ascii?Q?x5C6OnihqWnz+vddYomAKjtgTDXROqo=3D?=
X-Exchange-RoutingPolicyChecked: g4Yo0D8mLP+c8PDa23bf+6K5cvW1sm2o+4IvZgXidE67V+96PEa6sDgKLFsfGHGZJWKi8d6jzWEpBEKbBhhd9Gpw9Ggv9OpGXp2S+D1NLZiOm1FojY71Qi5bdQD5kG8PATAR8HU+j8WPPl1E+ls/oj1aKY7gdrfQmG6w3YLozFeWFkI/PHZHUcuomgl0q1cTvsBL/vQH/fLpMhM1fypk+4B4RFQmiP2L7X6TfDeb+phwJvGLpr4BYuIc3L52XH08pOs7mPFm72CQ22eyDb5Byw3K0pFlHETFa3IPRv+uBIyEX/gboPqkwH0DmtklOvYjk8kvv3pJgBmFSGOnDHwQMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae31ebd7-dd99-4ea5-72b3-08de8f6ac1c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:16:21.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7TbEILEtn0xjhf96QTkw0CKeWELcmnBb9MJJSFeu33iea0D0PdzN/eQ2HErBa1W4ndoXg7CLS07OdnvXG3Ff+hEKf639NoJOOU4guYTbY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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

On Thu, Mar 26, 2026 at 06:25:06PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI (rev4)
> URL   : https://patchwork.freedesktop.org/series/161656/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78_FULL -> xe-pw-161656v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161656v4_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#2142]) +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][3] ([Intel XE#4459]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78 -> xe-pw-161656v4
> 
>   IGT_8831: 8831
>   xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78
>   xe-pw-161656v4: 161656v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
