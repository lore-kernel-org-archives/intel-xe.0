Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BA7C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4960A10E3DA;
	Mon, 17 Jun 2024 14:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nN4gWeRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB4910E3DA
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718635746; x=1750171746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZM+B1x5ZWqjoEcQVhboMNhCZkSN/+i98VZV7XGEccjQ=;
 b=nN4gWeRhQGZvddaIquFJnCvD8Ey6FWDPwJDz6mkGPv4wmMww7Mu+7MbU
 81TnbHt7o1xAwDmbvChD8sm1cNsY1TBDtek9a//Ka0REvAx0SZxXECXX4
 YwOXOvcSVGW27dRkF8HZA21eNhzJc5tmrd6bgB00ceYQ0TWyxlC4vZkUN
 yHSfjgHaAO4Z4Ae6h16ouQvCVf/+2aG9YUbqhjdnJtSyA82i1qxjYRi9f
 OVnxbn8UnhQg1nBFMRcs69cYvp8+g7beECcscLTgY8Td8sONxCUa8RfTF
 GnnCEvdH/bTb6FDF7TEgiA6zGFTW/s1d1XTLxca36im70VcUou38lMzat A==;
X-CSE-ConnectionGUID: 3nLonREMRPq9Kj73XIegow==
X-CSE-MsgGUID: V1SFjZ8uT1ebt440Ze//Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15234806"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15234806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:49:05 -0700
X-CSE-ConnectionGUID: NpbUlta5S/i+B0pUWkDCng==
X-CSE-MsgGUID: OVqs7gOGSKqm6WezM/4HDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45757991"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 07:49:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 07:49:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 07:49:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 07:49:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 07:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLFTfu0wkccegQ7oWOwZs7Zvr4OqK1kTQnyezAWooHZUtAYrshr1zBkDif9Z7Ca0qeAPkoFXLkQcs1SHiAhC+kLaKgxSVaVuiTF/DNV3WHqv8+QwUwBio8P0WI8LZY+q7rYRxeGFMwYGsQ15AHmcKK+X3XAAFL2VfKiLUuC3OTjtPn8FN/IXp6XqHbtYWDkucQeEaeXsWeVCKykyweV3v8R3zVi0x6efHI/z+di8d36qdXCKBo8SCFK+qakLCrq2uDa4ywuOsK7PPtA2LGxuIZf2qS8OoXH1NYxOT6dP+XxlgV+Wuzne7MxkX1tCvpWPnWPJ8VBxo60GIyBM6h8/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6hqzIM68dfBRGnoaP7BWaKW6cIKX9GnsYJviq35GGU=;
 b=GmqJ48Re+7rRm7F8H8lAVyQLd3WsCybe0b8m+GW/R/1IYSEd/xFOLw7ISGsykEM4LQwQc6C2ktB3VGv0iTJiEp5SsRJvwDeep+o+dBgWtz9XToREDKFhYt441kFSmfij3FC967Ic5nZMeKQibooR8KbNK+61eOlzEZOcZ14S1LALyoPXAMfcZ03bFP+vjPmA6S/DC9xsXF8tgji8ZXRxu503nl4a2vpn+7fMS8yiHNsBEXxKlsWh9nLzeHIGtAyd0E191IPZmQbD+RHfsEqokpiNhTSd5Jr6i9yufvkw+egu7mDP2JupZ+b7SPx87mwIjJUQsuIR7+tvgojrphWxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 14:49:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 14:49:01 +0000
Date: Mon, 17 Jun 2024 09:48:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/kunit: Update RTP test to check VF rules
Message-ID: <ia5y6be2re3cu3ulht6exduszz6fsn2ana42kxbkxhjxrccf4m@z7ud43xwjdlh>
References: <20240614214821.2252-1-michal.wajdeczko@intel.com>
 <20240614214821.2252-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240614214821.2252-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: b054b9ec-73ea-4a18-927f-08dc8edca036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iqdee50maRl2QkoIihZcWrBWaEM/IUcoqVnb46gziGVxlpz5vNfxquhIfG3/?=
 =?us-ascii?Q?YUsmK4qsQTUzK8xKBNOdLapLd5T8EK/6HgRzJHZL5o/dnCyMfgGykZLAC6KO?=
 =?us-ascii?Q?+2pBlnc32H3v0mbxTQaNXtanyDFv0GH3/uRMQReqg+Op+VlY9qYn89H0l3UM?=
 =?us-ascii?Q?N7Ej2Sk+f0qjeFrPx9jBY3O+xOKNx6HcTuoWeJCOmW0WKtHY4ErYYvt21PXv?=
 =?us-ascii?Q?MZd6toOKqVwqfVG7errrpkW6Tmgj4UjQPNfJpF1oM7/6H3wJB9EYJxxwiJbM?=
 =?us-ascii?Q?TK2ak2oEPDs6V8H6DKd04OrJtfAqBnc5gpaVxRErkWdVPb4FTxuDFfdioF95?=
 =?us-ascii?Q?lyFM5LcJDSBBPJtiYxqOaBoxg4OCP9kajBQf5MfIL03FQmcTctMO1cK6lJvM?=
 =?us-ascii?Q?8/NQ7moSbYspkcy2n+A0p6gzF3DmMi65RrXNGdYG4SXAUNlpj7FJLL3ZC1JO?=
 =?us-ascii?Q?rj/xGxoa8WRzlDsxmNwhpHeWOnltAl19ngwSt1tHk90YCQCgo6k1c+tZZsy1?=
 =?us-ascii?Q?Y08d3lu2ZeJm4oWCeF3t3N4zrs++b9Co3jarIeH10zptLqbSUs03LklYLvgG?=
 =?us-ascii?Q?lY94qYlk+81ny8EXVhLyQmXmxZ07SO5wwLOM03gfMFkSyykNCIJOzbXkBA6f?=
 =?us-ascii?Q?SlSTPG7/zDApLPDYaNHDdiHXASmwqiW4b8RLf5iKwcxcbyyZ9766iZiynCPa?=
 =?us-ascii?Q?gwNjy2/UO3IYIHlU9B/024zqzwlGTslCqRxIYdBPRX9+318vzYclHjFwcjiw?=
 =?us-ascii?Q?KZtU8JTk1T8JzvMx7CXSnf25+ekPqxlMUuee+w5zli25R8S7vsqSzenCcSBj?=
 =?us-ascii?Q?7dErKKo1CqVqlEq+6D5yqfaOPiLoMynxm5oyB+p8sxpygbVKSolZfCrLH0m9?=
 =?us-ascii?Q?ZBaFzgdH+7ukRvdzquEUS06sOkl9sY2a4Ct4o9A9qrHraL7SwlGHekSKjmhi?=
 =?us-ascii?Q?RWQ5S1r0bTbcPv8iwuA7lSkZnuw5T+bds65rqHsTx/fwAMsiu0W0brU6LjrG?=
 =?us-ascii?Q?oAjPFH/WAxyOOiX9i/pWDxk52PL70G119/Rtn8t3s5MbXlDRnvOokHqq0cXU?=
 =?us-ascii?Q?YRXTKlTypxf8H3pP/vw2A5cF+bl/VAhKIGiWi2bDGGhwpAXetJAlQW7g2IAY?=
 =?us-ascii?Q?7pqwcEAY66uSktItc60i3Y5I+mXtRxTBXrF08VLM9zR6h588hFlL1/KcZHX8?=
 =?us-ascii?Q?Al5e/j7RafTU7xtarwaaf/MIMaYJeZypRh1L7A2lZjKWLC5B0IvBFAIy9RL+?=
 =?us-ascii?Q?/5PEew6TBrLOjjPkhBO8Ln+yNVY+XcQ9dgD2D4HSTThBKPYazzVYd+zvLn2F?=
 =?us-ascii?Q?IM+sH7xNEVyZF17dB9+OkvLQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GPnECSgLo5VGdWDW17xbwTSB9Xq/XUEUEocMqp+NsqtUNGFMYzIOC2NilKCP?=
 =?us-ascii?Q?fYB7phruF3yDJXgPp51AusmSIPx1DbJbBKvbRIjZv3evNiNsU2L0VhD3s1X/?=
 =?us-ascii?Q?UM8swCm7qeWQcFrzOFTZj11NHDXs0uRpIeJb/yrjtfkagDbVaOCR+Bjf7KgQ?=
 =?us-ascii?Q?s8IY+pWUPRmrskqiXJ+eQ/OEjwSQiSsFqWJ+lNGlTFkmbSzD+ncJmqLusQgy?=
 =?us-ascii?Q?Z94vp9eElfS58s2Jo9AQi3fa0MtX45C7BmWpI5Y4xsL+UdOvrV1HGzgzqJEM?=
 =?us-ascii?Q?74NLc6HSitO9alSLH5wDfzqsZ8If52kxbtbdP8aqhPgw7GwtyJtLKjCuGdHL?=
 =?us-ascii?Q?qQ6AMYP8fD7w80LyfSXh9WZYfy1G7NSAXaUJb4dcPjvnz3nIijeM90Pf3JIs?=
 =?us-ascii?Q?2I2MbV0ILOUQF1fLB4NixLCncfirOF88pI+e+I2wB7rAJQu/JhmVe5ZeLrN2?=
 =?us-ascii?Q?VtF3J/zzPuEFGIIqQxCxKpS/foZ9IMvvJx/1qVlLaP2CxymfOagYuhB/XAJG?=
 =?us-ascii?Q?6UChmM/vzjeAcAeDHbtjTAUUwvCUlVy54UOY6zJ2lKhAnAfFBdkTZmojd6gt?=
 =?us-ascii?Q?nsLGP+InpXn+9Qer7V3rWjNZxv8yc6SBxnK/xDv6DLw4xAs2LgPgejKOgZUx?=
 =?us-ascii?Q?7wpdF0u/vrgpME4I+UjlXTBZikAnDEn2bXPnDQa0B4jIVDsxvh1RPkxjG511?=
 =?us-ascii?Q?F5eROu7T7xOMd1mpM67VeiKv1n+cw29EZrwJlh2tDOMISWOY7bwlHEZQRCaw?=
 =?us-ascii?Q?ZVKmC/p7n5qfWmlhUQsOEA7D/dLfVAyDw+KAsnXt0FTKBVNmMRkVoLCd2L3n?=
 =?us-ascii?Q?dBGG6cX+arTXcuQz0sGpT41yX8wG5YjEU0rCDTOS4ocAjLXJwCkCwFrY7uw3?=
 =?us-ascii?Q?giOHVG6urTe7MIn/UopSKDehQkwUvVn29AB1zBG19wD6F6nEzgpDDaF1sdYR?=
 =?us-ascii?Q?U9A4V+i1RJrVaHS8dFKG2bWeoaNnI7d/sEkOsMYDwSycBBrf/7pQJp3q2MYh?=
 =?us-ascii?Q?sX5/bUxzVbF1YjTawcufBdB+YbQxtNHQM/9l6emkH8N7QDeibn7zOlYik2D6?=
 =?us-ascii?Q?y6I+htOsmHTxV828H/7bS+nXQYSDFvXQVxt1ERFgYXIIy4scY+3wiJqrYKx3?=
 =?us-ascii?Q?LmHzuIvKdevFeaHYOYvQ2ZlAfVRdWTshBdWjK17Si+LJSAe1mLMrKUJY572t?=
 =?us-ascii?Q?yyc1zbcLM5NTqDuW3r5XMkXFwIs+CBh6ljRd1GlT3196EQQXUzHwAfJXBxOq?=
 =?us-ascii?Q?OJkQCpFiAwlsvUJfry2Glr17zsGpSXDa7dXrVbFRjkj3Xim270s5BjESEYlM?=
 =?us-ascii?Q?XyVSAwCDrUJJ4csmVGcGy8/99vTPiwPzgppEZzSVLd76nBdkeEhksxHAocWQ?=
 =?us-ascii?Q?Qi3jSoSm6Ust1+BWdEQrhKlZO0GQ6d/08cXKXbDk16ZEYBu8pw6HCFZqrRkj?=
 =?us-ascii?Q?NqhViW0xCxBnxFA/C8TuLBBIQKce3f8cmVL5fIjwvrEjpYM6aIMmJlFZ4nqF?=
 =?us-ascii?Q?hgsKvNuRriDzQRmNAlHpEKN3RqvMC+UDguIoMB0ByKZoS86GXvaZ2jeq4/rJ?=
 =?us-ascii?Q?xTYAqTsrJqdSnKBhR9z4WPViZyuFtxK8hnomyCES06YN2jlHN1LjQu9ry7Qg?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b054b9ec-73ea-4a18-927f-08dc8edca036
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 14:49:01.2516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZpHrKtNA1mHAFwR5ewRDUGtAZNPOtPQPg+VFj2M04cDtu8doqPi1Ij+LA+7M3HXejWeFMA0nYyk9cQVJ3QYapwBrcKsQC9rpelnW82TU3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
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

On Fri, Jun 14, 2024 at 11:48:21PM GMT, Michal Wajdeczko wrote:
>Add basic test cases that will verify VF_READY and VF_ONLY rules.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 118 ++++++++++++++++++++++++-
> 1 file changed, 117 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>index 06759d754783..0d8731e13217 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -232,6 +232,109 @@ static const struct rtp_test_case cases[] = {
> 			{}
> 		},
> 	},
>+	{
>+		.name = "vf-ready",
>+		.expected_reg = REGULAR_REG1,
>+		.expected_set_bits = REG_BIT(0),
>+		.expected_clr_bits = REG_BIT(0),
>+		.expected_count = 1,
>+		/* VF-ready does not impact native/PF */

this contradicts the above expected*bits

>+		.entries = (const struct xe_rtp_entry_sr[]) {
>+			{ XE_RTP_NAME("basic-1"),
>+			  XE_RTP_RULES(FUNC(match_yes), VF_READY),

I was wondering if "VF_READY" wouldn't be more a case for entry->flags
rather than entry->rules. Do you have a concrete case for that?

Lucas De Marchi
