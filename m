Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05B2C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 16:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0687210E03D;
	Fri, 26 Jul 2024 16:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGNcGU1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5E310E03D
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722013156; x=1753549156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=veXHfvGmWV14z8F7HF65xkuyb6/HCPiOEMm7Ft32w/U=;
 b=JGNcGU1cR7sdYTgtCdIQGAVyuBo8FOey5x+cPzcTVEiLGwnRVIedLEqo
 XnqAzKc4Ty66Y7v4cJLWxmenfBPayxlLpZVCzIqoxc8ERybunqwyKdeeS
 VX9F3VretIqy9EQ3QkoCIzzpBEXGeUkED+RsT6lvHEGToGLXT+uGa49jB
 hJk0jo2HG9QO56dvv9sTG3JLYDacGP4PRIrTPVx2LqWTvHaoqVFk0fkrh
 idM1q05VWe4x7sgDRCRIQslZ3VSihj21MSjm+kRsFCylV/bEIPzbUSbPF
 PCJgCLorIzMQBvz1L5oymX5N4EjPc+A/DBIzT0I3zEWWAwkUEwvelhxyq g==;
X-CSE-ConnectionGUID: LhWMAiRAQEKrBX8jGJ1ZUg==
X-CSE-MsgGUID: PnGLywFbQPqa9W/MSxsyFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="31207137"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="31207137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 09:59:16 -0700
X-CSE-ConnectionGUID: ThQYWmdiTxmxcdXfkjgt6g==
X-CSE-MsgGUID: /G39TTlCSS6hBzCPYzsQLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53545164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 09:59:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:59:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 09:59:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 09:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsZlZVrkaYcku0KH6jrw/L5ApKiESV5i2FPL6yyUnPB3fsp27/A3JsSX87lb0FfPU4HGHXOuAHlTZY/1OB2saxsONNR1aTafbcfRFpTIxEuk3mUKEY5shMzvE8B2RLWqmEeFACpBFPiJ3UF/g2nGwmJoY06R0M6RJgR3ev5B/upmNzs+mCV1LTxECi8g9ThVtjI8lAYO6bTSWcrEDJjPRaKaPKfdTCQ0OWXMhQB7ESyuznztpggEsz7r1d+Eegrc2DPbNRsmOAdz8KjR11u6eCGqTN++lroanSPlICMC1OUmKy2+qYQeTn2EL9I4s3aSsNZ7IAOQZ3OPf48qPn6CXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wxgxge5z5B8tUkOn871T+GsDIR6x90cCkXHfBW0ae6A=;
 b=byqxCLFMsE2Bwmykw56C7oWSwI8KEKO2mqUT4vXrfItXkTDW3advuDRUWbgxju5X+4CmeecRYG+KJ+EQOuU75w9KnTEKfxA4DOSPz+Y8ASbIsDkIi1hwZ6x0SzgZx/3/TPWxAQhaf5KrY28QtkH33ocjopOkk9LXhPmt9OJnTCRfQM5xs2W1hmu+XdkHaL4jhAGMVQazmNN132lp3NX5dddnWr68VjKVxVfgQC4aQ4E2iujfTrouBT5JdTGN+Bk8RSEgNN3cOdeC6fsbRHyYAxq1+K6lfBNdmOdGk3DJuBuUHd7ByEFwpkxHZw1pc41Tk8mPYFQoFWVKaAf+xtkZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.31; Fri, 26 Jul
 2024 16:59:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 16:59:10 +0000
Date: Fri, 26 Jul 2024 11:59:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/7] drm/xe/kunit: Test rtp with no actions
Message-ID: <zfoxb4wpuo7hgyvrtaizhyc3zkq3lktze3jkkr3lziahalm5kn@smecpemtkout>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-7-lucas.demarchi@intel.com>
 <172201183744.1586.17708055766759678866@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172201183744.1586.17708055766759678866@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:303:8c::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc3dfb3-6a63-4169-8ac9-08dcad9444f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UwbJfZqaEQ7JAs5kY1RMwJb9hFZ+9YLF5F/5x2XGyOdz67JLWYiWQ2F6li3e?=
 =?us-ascii?Q?GK9rpJVHJNvjw0umjKvCI+QQJEu5J3Vz1xQFupoA2HVUHw69v/XzmucfeuwT?=
 =?us-ascii?Q?M+9ySVxw1TtA+/yFCYLwqtUEwUFcwpbpMAp1IHWVH8GGXqknz60Stc1W+hcX?=
 =?us-ascii?Q?/BD18row4cNRzWiDWZLBo68chJdFShs7NWK6aYimhW242KSFHRiLLqRx1cV5?=
 =?us-ascii?Q?y1WK3SoLKOV654WUhqpZMBAyR618aDQZunOJRkcBS+wM6LleFcJssqn1YzlZ?=
 =?us-ascii?Q?ob5VftmS3WzvISj5rbYlHRXYPlZSPjkZBuFp/v0A0h3i9BT9qY9jDqf2sOud?=
 =?us-ascii?Q?pN7uFf05CnOwgYYcnHy8FVXVcRUiXfiEWaQ8Y91Ad2rlc6QYnYdHbX/yX6bf?=
 =?us-ascii?Q?2c3bJguMo6z5s2m13HIbAeJ8t2bg3vXcIXXJEjifLn/NkUfyAB+Mu+vV6RvC?=
 =?us-ascii?Q?zFUm1CrXd1SBk9ZkWC51G8P1HR0bYDbiwuLZDezXf2aAHK/fJAHE80dG00/1?=
 =?us-ascii?Q?8CH5Zh93mLRBwayiEztpZPkXeILpMc3zMWLIvpup64xe8mQmuLWpwQUzxAmd?=
 =?us-ascii?Q?D6uf404U407ddAfgAMN1LoQSd1f5chdGTqQgCF16gAZwzrIfOSv8NgWMltcH?=
 =?us-ascii?Q?3z3mUblRsWfQpe0pA0jeplYcZLCEuXwWp/2MdZmrcNMKP4X83YGnhbU9Q5ni?=
 =?us-ascii?Q?ECwex8jKKIoei29i3t4f2J+CnKbzBxbflrwpnOS/vEdlwevsb5GJDAU4jJjp?=
 =?us-ascii?Q?zzAfuwkVtg8+xpsjKG4nnqwf3iQc6JU7Xst82UOnNKqsPjQYTfI/fShp8NB0?=
 =?us-ascii?Q?amwjdWaXHQIr0PBrqnIiRh88VkinqM7NzV4WSvfljMkpoe4MSr5nw0eGsQoW?=
 =?us-ascii?Q?1FOqjMUoGRsDYOI07+nLg/X7HRtpqZB/HUeuKL1BcTiX9B474PiBKuTXYgz0?=
 =?us-ascii?Q?lyq0lMU+AFlm6CYkv1vK8mGFz9nC7ZD0KSVO5Ie4z2zxR9OUOKH+9LHtFstE?=
 =?us-ascii?Q?8WfO8HG3+LRVUHf6scoEyyEAplpmydy8sJMI+WpV+Ef36MiDmVWeD/5QQSQB?=
 =?us-ascii?Q?TxXsEC1MgZrjCR7O2zrUQ2V25Fo2LY6YzcpnQSbcmJXf0mp3Li0TfY/4ZmE7?=
 =?us-ascii?Q?5ihf4G/ONhhdhoSz/dWN92MqsfYa8dRHCl9EYMusIogzIoY2PH6qTspiR68C?=
 =?us-ascii?Q?bNbnD1G3ABnVSqsw0bOJQia6X+ztD5H5+6CKKWLT2jx9l5klePdLqxSsTdhy?=
 =?us-ascii?Q?4Xi9GePiTwjZ+zcV2hRGlswZathnVnYA/wdpxrUK+bI02bXGijCQD4P3uVEc?=
 =?us-ascii?Q?XwA90N9bosZKeHuUAi0pmZJ4CDT6hwtcP865XzSK79QUWDiEDBqwVmWhQgeC?=
 =?us-ascii?Q?7XTq4g+1Xl8lXwOVPY1Zg/A09U9DZvcPIxfle/Ke2Z/Mj5ZYUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t5OT/0FJruiKe8+arkv7+ToHO8bF6aa+WUD1c4u+rBi/V2Dd2ZniY20VqReo?=
 =?us-ascii?Q?ZzMO9CaVC0TN0yEZyAnJPaIAJFB1bIiJ4Q7tw8JafQ3dHhS/XuGNppzX3MoW?=
 =?us-ascii?Q?H/VcPje8MCX8PGVb+IRVbmZKXOuhXesR4AewJ/0UcGgKck875b4CQ/R42diz?=
 =?us-ascii?Q?j8WdEFQSRnLTS/AyWXeklOJ6WFf2WROaSOa1dnvYFrf1eYBon9/VPLTz8Q6+?=
 =?us-ascii?Q?jSkRKR/zlma5eGpm763v6il0IN6TZiXd/Y913UBPeAjo5eLNwQwqvsRKqNaY?=
 =?us-ascii?Q?QSPEwd4HqlUrsvYEtHb2dLywJQDNiPqp1x+4Kn2Mp57j+mztd/Cipiqaj5Qy?=
 =?us-ascii?Q?3BSt/32kWDHMqVJ2Nj+fQtx/CyMeG4UqxO0QhYhyLBlSnIg70jsvmWYuP6mo?=
 =?us-ascii?Q?x+dbF6CSPa8gWEbYLnsDgvpz1z2iemvJNE4MSPbntIbPcapmu62CBeXYa/DZ?=
 =?us-ascii?Q?jUws6ThIGMwp8hHY7RVJSq2OuDp1S4IHJe9yAmCUTXBMThMu5pqWuCbuVWNu?=
 =?us-ascii?Q?c8sOQXd2+P4++dSAvH21Q4XuR5jhpgny+kd1fa2GS8SKemIdCFdBNqE9yhwU?=
 =?us-ascii?Q?cRT9B1FgIb5hh89fFuj9xHCYX4DvpTlDgIHN8w6YEoY78F+fw1YY68sKewIh?=
 =?us-ascii?Q?5Uq5yE6igdpMAliWCXYc6HayfbZ2iG9aJuZPAPQ1ncnxderdF1GzryCSPxP6?=
 =?us-ascii?Q?sbZ3fJ7YfiaBYhXo6CVRhTxJqeJhiMPPF0kfpvmpqLTBokBmLh27m24fPE7F?=
 =?us-ascii?Q?5ZGesGMAST1FDRBg+soRDBpohQWZ0TC7mqh2a6aJGu2HNsVTrR3qiwTnwluU?=
 =?us-ascii?Q?ZH/65Q+5xrOvYT4YHMiEtZt1gGwqgbYxn0u8WFNCk5Z7heniLwba/R6pQFV4?=
 =?us-ascii?Q?04mZkXyfcUw2rT/IO6OSfPG4by+jg2M8Z4fdvSNYtOO6Ct7pGaOsd5ZRHCai?=
 =?us-ascii?Q?aQJH+5rCpJ1CVXCkf6CRvGON+qqeQzKsF5GJQexWRNzsJ9EtdHyI6qUeQiOE?=
 =?us-ascii?Q?kzGm60b9PMdfYScwyuKHIpuIh5kcy8SC5DdqvOBpE9NjtrtYmBcGs800huBv?=
 =?us-ascii?Q?XKavckh0wWSGM5QrfNNHvQ/Q6JL+YV7t8wJqJzJteX9gDh5HtFkwpz+CaRwt?=
 =?us-ascii?Q?1Q1ggVIqfeSXWFPJoDobU3GkMBFIe8Azehrf0E6OGDEGl4rWigwGmXH0yD7B?=
 =?us-ascii?Q?x1jLC6V6OwTzNTJSHChQUvxmKUl2XICKYp9NhNqQzzrqg2PaNLtJLtCsR91q?=
 =?us-ascii?Q?EUReMHPAnsc6pXPzDrbkmj7JQvVXNCWkCrLXAWK0r5MyLUQ1PR9qYRenAQJR?=
 =?us-ascii?Q?uI9DJhgNoMuDyP7QwZWi3lDCi0epBf7EU0tt2AKotDZPGR8JyHG3cEZOwujm?=
 =?us-ascii?Q?cP/SruxQZo9Vtba9iTWqlEOGFJlbdaT01WgGg4GQVwtqjO37ad4I6+gtKfy3?=
 =?us-ascii?Q?626lhlwLvPAqFeVrGxzCP8KCZKyPKTdYhNBAejncToooLGqpBkTp4PUvDbld?=
 =?us-ascii?Q?aI6lyPtlbjsQ2nWPNUrXMO4GOTnPrDAUhTeit81kopNd7hCuRP+b+qqJFDXA?=
 =?us-ascii?Q?nmF9bJeQrCuOX/QtVsFkww0ms/exEgq3ZyePPmVbdXXyS8NLh21n/f81iZCz?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc3dfb3-6a63-4169-8ac9-08dcad9444f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:59:10.5751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R28wf6nb0+YHgUlEDORkeydfQ05X3P6sJXL6IzzWBU8okf5A4HHCjwwapn1vUKi5z1wfqIQAQEcy/vD9IuPLKR5HSBaU1Q3J0FW7Qnj+k2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
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

On Fri, Jul 26, 2024 at 01:37:17PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-07-26 03:43:36-03:00)
>>The OOB WAs use xe_rtp_process(), without passing an sr to save result
>>of the actions since there are none. They are also executed in a gt-only
>>context, making it harder to share the implementation. Thus, introduce a
>>new set of tests to check these RTP entries. The only check that can be
>>done is if the entry was marked as active.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 163 +++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_rtp.c            |   1 +
>> 2 files changed, 164 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>index 73e97f8d2b5b..5b425a335706 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>@@ -42,6 +42,12 @@ struct rtp_to_sr_test_case {
>>         const struct xe_rtp_entry_sr *entries;
>> };
>>
>>+struct rtp_test_case {
>>+        const char *name;
>>+        unsigned long expected_active;
>>+        const struct xe_rtp_entry *entries;
>>+};
>>+
>> static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
>> {
>>         return true;
>>@@ -339,6 +345,155 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
>>         KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
>> }
>>
>>+/*
>>+ * Entries below follow the logic used with xe_wa_oob.rules:
>>+ * 1) Entries with empty name are OR'ed: all entries marked active since the
>>+ *    last entry with a name
>>+ * 2) There are no action associated with rules
>>+ */
>>+static const struct rtp_test_case rtp_cases[] = {
>>+        {
>>+                .name = "active1",
>>+                .expected_active = BIT(0),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_yes)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "active2",
>>+                .expected_active = BIT(0) | BIT(1),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_yes)),
>>+                        },
>>+                        { XE_RTP_NAME("r2"),
>>+                          XE_RTP_RULES(FUNC(match_yes)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "active-inactive",
>>+                .expected_active = BIT(0),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_yes)),
>>+                        },
>>+                        { XE_RTP_NAME("r2"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "inactive-active",
>>+                .expected_active = BIT(1),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_NAME("r2"),
>>+                          XE_RTP_RULES(FUNC(match_yes)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "inactive-1st_or_active-inactive",
>>+                .expected_active = BIT(1) | BIT(2) | BIT(3),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_NAME("r2_or_conditions"),
>>+                          XE_RTP_RULES(FUNC(match_yes)),
>>+                        },
>>+                        { XE_RTP_RULES(FUNC(match_no)) },
>>+                        { XE_RTP_RULES(FUNC(match_no)) },
>>+                        { XE_RTP_NAME("r3"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "inactive-2nd_or_active-inactive",
>>+                .expected_active = BIT(1) | BIT(2) | BIT(3),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_NAME("r2_or_conditions"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_RULES(FUNC(match_yes)) },
>>+                        { XE_RTP_RULES(FUNC(match_no)) },
>>+                        { XE_RTP_NAME("r3"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "inactive-last_or_active-inactive",
>>+                .expected_active = BIT(1) | BIT(2) | BIT(3),
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_NAME("r2_or_conditions"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_RULES(FUNC(match_no)) },
>>+                        { XE_RTP_RULES(FUNC(match_yes)) },
>>+                        { XE_RTP_NAME("r3"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+        {
>>+                .name = "inactive-no_or_active-inactive",
>>+                .expected_active = 0,
>>+                .entries = (const struct xe_rtp_entry[]) {
>>+                        { XE_RTP_NAME("r1"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_NAME("r2_or_conditions"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        { XE_RTP_RULES(FUNC(match_no)) },
>>+                        { XE_RTP_RULES(FUNC(match_no)) },
>>+                        { XE_RTP_NAME("r3"),
>>+                          XE_RTP_RULES(FUNC(match_no)),
>>+                        },
>>+                        {}
>>+                },
>>+        },
>>+};
>>+
>>+static void xe_rtp_process_tests(struct kunit *test)
>>+{
>>+        const struct rtp_test_case *param = test->param_value;
>>+        struct xe_device *xe = test->priv;
>>+        struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
>>+        struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>>+        unsigned long count_rtp_entries = 0, active = 0;
>>+        const struct xe_rtp_entry *rtp_entry;
>>+
>>+        for (rtp_entry = param->entries; rtp_entry && rtp_entry->rules;
>>+             rtp_entry++, count_rtp_entries++)
>>+                ;
>
>Same comment as for "drm/xe/kunit: Test active rtp entries", otherwise,
>looks good to me.
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>Since we are on the subject, I wonder if this "unnamed entry to
>represent an OR" could be now replaced with a proper OR rule, so we
>would have a single implementation for the OR logic.

yes... I was looking at going one step further and merge even the
process function.  One drawback of merging just the OR is that we'd have
to raise the max number of rules/actions for not much benefit. Hhumn..
however this would only change the preprocessor with no change on the
size of the tables, so maybe it's worth it. It would also simplify this
kunit tests as then it's simply checking 1 entry rather than a mask.

I will think about that when sending a v2 - I will merge the bug fix
right away, so I can mention the commit hash too.

Thanks for spotting the bug and the reviews.

Lucas De Marchi

>
>Since xe_wa_oob.rules currently has a nice formatting, we could have
>xe_gen_wa_oob doing the conversion.
>
>--
>Gustavo Sousa
>
>>+
>>+        xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>>+        xe_rtp_process(&ctx, param->entries);
>>+
>>+        KUNIT_EXPECT_EQ(test, active, param->expected_active);
>>+}
>>+
>> static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
>> {
>>         strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>>@@ -346,6 +501,13 @@ static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
>>
>> KUNIT_ARRAY_PARAM(rtp_to_sr, rtp_to_sr_cases, rtp_to_sr_desc);
>>
>>+static void rtp_desc(const struct rtp_test_case *t, char *desc)
>>+{
>>+        strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>>+}
>>+
>>+KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
>>+
>> static int xe_rtp_test_init(struct kunit *test)
>> {
>>         struct xe_device *xe;
>>@@ -378,6 +540,7 @@ static void xe_rtp_test_exit(struct kunit *test)
>>
>> static struct kunit_case xe_rtp_tests[] = {
>>         KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
>>+        KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
>>         {}
>> };
>>
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>index f054ac9cf06d..1c641cc0f5a1 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.c
>>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>>@@ -327,6 +327,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>>                                 entry - entries);
>>         }
>> }
>>+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>>
>> bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>>                                 const struct xe_hw_engine *hwe)
>>--
>>2.43.0
>>
