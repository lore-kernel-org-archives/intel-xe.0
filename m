Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF0D132CF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80810E44B;
	Mon,  4 Nov 2024 14:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtHmkllF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DD010E44B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730730687; x=1762266687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vjtAGL4UDR7eJNgBtAejDWWfLMxuI3IUQUpfdQxx77c=;
 b=QtHmkllFgTFJc84CZz5x4dcEqDUtNd8x1LL94Y5BMSu6Jet4b5spI4sg
 FWWQUfmioyeIcl9jsM9ndL8huc1oxHUDbWHj9MaUx6Sgr+qYcSYD3r+VF
 SuzCebvCaVpNHgOcgTzHFZit+gDuhPUsMUGHQ5SGHxN2D/RaqEiOMsG6l
 D7HKbKLmjV28+tV41jppqTGr8z0HMHlZBTOp8CDhhLtJM6n5qi1XjrDC0
 wmiHnhF2jbRRTwomheRpZZSUCSvY3q6x4yxuD8wacNG5XBmklgjCRoHGx
 pqxDVV8p06fEI3+e9EZ//Lt6tCwb3hhrgbqWdTVpPhaIp9N3s0odLLwjv w==;
X-CSE-ConnectionGUID: bdmxIdGUSFqC6Eh4WB1Kuw==
X-CSE-MsgGUID: cU2jCL6DR12IgXU8NA2SfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29852694"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="29852694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:17:03 -0800
X-CSE-ConnectionGUID: GKO0lwK/TYSbfqK82TcKdw==
X-CSE-MsgGUID: Td9e0ugKT2C7aF+bmqL+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88236032"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 06:17:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:17:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:17:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:17:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uARbWC9m28y3dmCbR7CSx+hqR0w1MWvows938q891Rc/+YKPtliPdbSdqNeeaWvpqppu6pp8sRjYWzz03HueLChT8LJMnLaDW3LuzdWM8+iG6cZ8IirV1pRFK/5N5G38n/eg3Z+9tkBT8QQRLLLK52A0vo3rXa6vpMKG87qJ/P2w+uVvTe/79ELCI1X3EenHZXhAztQRPwL6AnmZ9YckikL47wqN7g0RY2OJhDdjjXn6oLaCqoG1WiRw1qUclh4QhMacluAK58jo+sF2iC+h+amcdByzB+KKyn0a7ou/EC08DWvt1Ai2bE0ZU9D9AYAM5mn+nASwtndb1CevYb2Mmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+V/XNWIGX5Y5b7EMD4qAuqaVgKApHIGSIcXBcPrVPE=;
 b=BPTzqjPJprBt6ND8gqyLclWG+FtC7bwj4JIhFCF5mEQSG8RjUHNc4F6cpY/F+2zBfbYqh3RdYRa+z0PJDc8wRTC8MJ/AynaVHudlKnEZYoJWhPw5s5U3k4xrlCxduzEK9SlOuG/3xg8Qa3Dzcm6TVaG4tdM6K5ldsGGKf88YJNBKaYYKEhl0ELPrHqYwU0m0tAw9RNajAOPUEEpdCE22q/fhqc1f287eZbHeTnyOy4VPyww5Q2csSLVehwDLJMb1eqHwXybSUmavk5Vw7vkKqv0j0dOsDSwjkrHWC1juIVQTbHlUolc2a299Ig7ffk98seDGIvbO6jmJUrBxi68X+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:16:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:16:58 +0000
Date: Mon, 4 Nov 2024 08:16:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe: Improve LNL work-queue flush WA warning message
Message-ID: <rn5hhjvwfwojxt7n3k6cfsylezumxkktj5fwphzcdry3ccbpux@dmnujixptkul>
References: <20241104090755.85131-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241104090755.85131-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b7daa6-f4cd-483b-7b7d-08dcfcdb57f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?15zPrww6o+ZELVjRtH6pnM06i01Ice97eLkrHSZbIT4u571XDZzjRnsi4pHa?=
 =?us-ascii?Q?4Rv455k4eWe44yfa73xykmtYJ9ElvfvhC9wisxhB07Lz2vPOiuIIJlppvMY/?=
 =?us-ascii?Q?pSadAZUeJGgfqd2rek+u+Rtpm5NtAw57ij2n1Tmfkx+zvhNY8S/Ch1S7oJAk?=
 =?us-ascii?Q?OjoVwklcjRM4P2NYOtTnsJPnHOvNjtOY+kPuU6fwnOd7TN+0wJjPC36h4GrS?=
 =?us-ascii?Q?QEokot5k5j65+9OyVK34n9svSaz83TVH2x87cle4VvTRrsVhviqSmh544f6q?=
 =?us-ascii?Q?vSyX+Ctnd1wwuBFIcC0RmzddEGXug87lxIDVIap23wVDhs77TUPU42R0Naem?=
 =?us-ascii?Q?v9EXVzRCy1Y7UsVN6WyuR/LYfuIKKZS6GxUaLQR2rs2mPmska1k0UV0h/Dn0?=
 =?us-ascii?Q?d6GV9jeMfNl4NLw704BL5lzNxQvn5YIZhJPF6gqxZ2dnpsf8tTSjNT6ihXlp?=
 =?us-ascii?Q?pxZx0447O20BH3oU1RLcaNclXaZkTRLKRNyB7ApgIzJu4/EeJ8tbe38b13qL?=
 =?us-ascii?Q?OTqNZaUbWRXyQbm9C9UhEFfj21eD6pQ6U9zjQLsXJNfupXfVLJcNXMUhzkcZ?=
 =?us-ascii?Q?/xkCHJUTzPpbBW1d4frLImtk8VplY/Sr76yCzbcvn+AZNp70Im6tV2TPKLr+?=
 =?us-ascii?Q?8hEmC2/gEveYFxoe1mNGBgolk46GcmDDh3PzmB7QrpWn34YjfICGaC0fMcOp?=
 =?us-ascii?Q?KS0FbQ1aXNAXOryzCOebLZLXIjJdsrc29Jj8I9IH9ClAyzP3q5xQsuXwobJh?=
 =?us-ascii?Q?qwYAAxuWP7x1/KsEHN573IqZMjcxI6gHwjThkFvWDLcCbP1BeFnh0+XVSJS4?=
 =?us-ascii?Q?JAOPy9b7sj5yNv/EBgGXpFXaJ9YR8NUFHDSr4DucXxVy5Vie2G80g7GQGY89?=
 =?us-ascii?Q?8eTq/0sYi/ZGeMSmGTytGIUK+cuXJL0rTopr5gFc3WW3VUpXMANPg0fNJlCK?=
 =?us-ascii?Q?thn+fmJ2IdqJVkOcU3ZFzu76jtBtJ7WbxCqPTJgy88uDmw5WS59rqATzNMWD?=
 =?us-ascii?Q?Y73Zhjmu8SlWItp9XbQKhPF7FohvF/mvY89nUEB8miH/aD58dkLk1XMkkzDP?=
 =?us-ascii?Q?VNMuQRV9XqOzXvpLZbbtoq0Qy8R6ckf8whwqRdK2wbAzOf8DuuRZ41S7neZ5?=
 =?us-ascii?Q?RF2PgI8JJyAM2yFMeiOkWjZ6KliGHtYZ9bwNm/OptkmB8hPPlEA+sG+8eeyR?=
 =?us-ascii?Q?Nhozrypaa3hIlS5t+zXfd8vWKL2VulfqW/FxInZpWavLmhtZgYgswz5Dszlg?=
 =?us-ascii?Q?FJIAJDa2I/P1VNvuX0p/CRhV96OD/Y4vsvw/7EMNTopdwtfqvVQrYIHisHqX?=
 =?us-ascii?Q?13jpVSM0hDPtfBFyXd2vU3DzOQUrBUBXs5a0n72ht++ye8A6ARUhnsn99yRI?=
 =?us-ascii?Q?MohyRvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rz+XJzHe3lgTKKAKIZdNXXjrCbOoDDngraJghhP6aQBiPtpAzZQe5XiO7xGP?=
 =?us-ascii?Q?BfScT1/qpJOMHLnpzJJsxSABwhTRho3zbviQWtCC03lau7iqWyTeKPHz9IO5?=
 =?us-ascii?Q?iGtwXyBTKqCHz1YLRc8ToiUCvf02EskBWBF9MBDAy5bRJu4fmd0BvthdFYxi?=
 =?us-ascii?Q?8KTdtxSdQ9UxTpMF1OJ21XdqrnAC+xZdKiC8cvkZruvmw+xPneUXOO5dr7YE?=
 =?us-ascii?Q?q4490F0ZM4ging5Riz13XhfOwAlnZkmqBFVYRS4yQP90I8JnhHDoWTPKxEhu?=
 =?us-ascii?Q?GGzZ8EyZOdDEL76ZgJqnCl6uZPRwQC3Q898GOF0r01prs6zsCUhbVrQK9qaJ?=
 =?us-ascii?Q?+J2QH2gRDeW7MkJeNagQOn2eJW/y+1xiZ7i1GJbzlQvEnYSDYHrkecEJx4fk?=
 =?us-ascii?Q?kUHwCOfhc4PxDLjbEiYfqCnJShZtRWOBEdrNY959QbAOMW4FYUGKvfX/LQO3?=
 =?us-ascii?Q?HYhRZCBnBBZRghIrLZDlVwN30NXc0QdVSxs8inRUIbtT3ijqeV3uS/0Oh3Y8?=
 =?us-ascii?Q?qyDOzkwCXh3xX7RzIYbZDQJy1hwRXH0V1KBU/qBjlp2nNc4WM3cWYjSOSRm8?=
 =?us-ascii?Q?8Zx1zAvrbxu30lkxm8CYnSCgVzFw3Q/os1xSOv1eGmX4SvvxWP0PKlvtca8y?=
 =?us-ascii?Q?M5FI9JgpTczE7N//zjbJe+YspFB3r4BjAUQyICiLhEPcp9Z+wutITNzVPxuB?=
 =?us-ascii?Q?TkbZO91RGd7nCD4B77/VPJxsfn3w/iSyTVaM3Obt5cPoEkDXL2SjLLr0BPeC?=
 =?us-ascii?Q?TqEeT7q5sZPANuwVyX8Rh/dU6CJSJdQz7OuI+N+6qFpv90BTZlLVMBlqjdXV?=
 =?us-ascii?Q?q3K3eqwHaL7VOX/sfAJJOSU83ne4avO1jLXlN9kXngVzjVILVF3neeJE6iRv?=
 =?us-ascii?Q?iEzL8ROizDqwrCL3u4ujza1t4sNYdviNZ0ht8osrWBFb2PaBEDg1CZgQb+3I?=
 =?us-ascii?Q?msuACRZxkqOCqerB80Gs7NNhwuAvg6SJazmQVr53L/Ey3unkrueQUK7UsPbf?=
 =?us-ascii?Q?teA3jIskjXVDP0WeyK/8Xd523J1g9f8se0nqxgiVQPRqV3i1bx2AIHP4BZtW?=
 =?us-ascii?Q?h4vXl9giLqfIofSd+TQ+GM00Tvgp9IWHdNJDa5dV87ob2JZrMyKIr/rRAcDZ?=
 =?us-ascii?Q?CFfgO8B86YysabZ6q5wC2zAmT17IMSE/H9QVMbj9sU6zNIlFfrJ7W7LMZRyk?=
 =?us-ascii?Q?Q6u1jrkpP03glXH6YwdzKwTHJGaEZ41VtiXoow1IY/ekNr6Sugd9tzhR71oF?=
 =?us-ascii?Q?/Wv4CY5SbuZVRCWcYWwwK8fMCQa6rXD2RvRntOqO2VuEQtkvf623QuznX1M0?=
 =?us-ascii?Q?5jlzjxExjh76Ho4nm27zLK6OjK6dn3xbR7objsM3GoBQGfBpsACCUGsFkQQX?=
 =?us-ascii?Q?s554EuoBLRBYtBnM/YqQm0N2tvPc9eJ5ygrtFZ8WXlIiNgvOT4enRnq0MBfI?=
 =?us-ascii?Q?f6HpOfJr8Hz/D+icOegVJBlH4RSdUiKVk/Vucyn2Q7Gn88irPN9WhBHSv8BN?=
 =?us-ascii?Q?XkzZubQc7XUIw2Pk+Yw8OcUKhvYakhhmn+TPDZuhvVk66DrjljRaYkLNekWk?=
 =?us-ascii?Q?gZBusPv3JUThMzzbn36vjNFLpAWkyplHeVGtP2xdFxZvrK2zN4c0mnac6w5n?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b7daa6-f4cd-483b-7b7d-08dcfcdb57f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:16:58.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0cDuVU/tN58kb/OKxA8muzo1E+5uLdi6XPJBTzEBDgmVyQW5z2/mfK6o9M6l81hWJAAbTpJsuWartbuTi+f08sryo4HMfnG31aGGdVO/JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
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

On Mon, Nov 04, 2024 at 10:07:55AM +0100, Nirmoy Das wrote:
>Improve the LNL work-queue flush WA warning message to avoid giving a
>false impression of normal operation.

it's already a warning, meant to be temporary. I'm worried that if we
keep polishing it we won't actually get to the bottom of this issue.

Lucas De Marchi

>
>Cc: Badal Nilawar <badal.nilawar@intel.com>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index a405b9218ad2..63a476ba1e00 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -1021,7 +1021,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> 	if (!ret) {
> 		LNL_FLUSH_WORK(&ct->g2h_worker);
> 		if (g2h_fence.done) {
>-			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
>+			xe_gt_warn(gt, "G2H fence %u, action %04x, done but required a flush\n",
> 				   g2h_fence.seqno, action[0]);
> 			ret = 1;
> 		}
>-- 
>2.46.0
>
