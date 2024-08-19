Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8D1C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 13:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CEE10E27B;
	Mon, 19 Aug 2024 13:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRztLjUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E8810E27B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724074708; x=1755610708;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eevfnYKjnrSqY/zIV6CVMnW2rEfiAErVbst4GuuuCIc=;
 b=HRztLjUcu+p98wE/CgGi/vxvRji3EbJyo02VD1FIcps2OgaXJSEjOfhD
 9PQ73G8NmvBTAA1sWxMWkZNnEx280xaWxyWfg1fbqwebrc1Ub+LMs0KUw
 LNx821Hrp+rPrO+hXKNMz3rgOv7GZW0ePk88rfKKULYW6Qk3nAz4OC8P7
 K5L93ujfZtuj3RBoBZVIBD6ne7ebLX0ehDC6NZzKoCE5vdBPUSva+Ki9F
 aP+NuFRvx36W79KQwfxIEjGLlY2dibKYgb46Bx/AwH/WtAZ4/Qh5S1H1Y
 5pIy8kASzWRiyNYBjvXvadcl2gKGLNOeSQybWPz2aWlz5OdINm8G8yok8 Q==;
X-CSE-ConnectionGUID: sPQwV/eDStGogT451pVovQ==
X-CSE-MsgGUID: VZ1ak0jbRcqpPzc+9JpIVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="32893047"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="32893047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 06:38:27 -0700
X-CSE-ConnectionGUID: D+Pg0qBxQhmzZUVecaGz4g==
X-CSE-MsgGUID: vjQzuNNFS42TmmP12iQeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64768568"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 06:38:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 06:38:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 06:38:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 06:38:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 06:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN8jj3N7Amvd/lZb7WZTdJUykrpbwC9haj5yVcqYYQQ2l6SkDVLAEriLsejkuWtT3vN/P5aEYBbG2AQUx9gSeQVTJBn5gC8fkkXlaw1fj99oBpTazeBbwG9+Sizq4Bfk70cHu0C67LpsG/t8gEVNTNPP9QQT4tAihkC13oIjX4pHE2kgO8PWNBNvaZPMhF8g5pfu3YibPPG/gUZjtQ4wV7GKPXONjtLpysd0OoImo9gszkTsCddtgXigvoRhej/dZEYAbdrx+puYJ58HF/7X043nQ6QL0TXO49bTntLHO/zyd3zxlwPRYdvP8WnimlFANP6p2F5FKCxeUyf8Aib17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OD+zprypED7Kcj6DmzM6Nh5WXpc4Oc4GDYEkLOP8vw=;
 b=TS/PSdn9uZeQpJjNQNTgPE2rM3R+tNRGX7uVJditx4nATOKfsseMRfUoMsJdnnMvi818JGsMs6+Qk9n/mwJo0g7UM/+KvI89rkNNK5+SXf0mgfPOVTUjv2Q7204OWYt7uQnY6QHO4Klqk6elLvzvw/b+BYH3SE46kyk5DB5LIqePICv5jHie6vrDNzEmn3P2Ci2zDXsNpXKauH8pnQQcdEOrpZyLmOnRlCw1LiaNzDGWtHfJ8PHENituq3jFINy7we1/5otkEgkm2eA7fho7Za+Ot/sJimlA2F+RfkLejE/jwkfQbN/Fh0HCAS/6kWq28db95zHvmeKqbovTqzeFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 13:38:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 13:38:23 +0000
Date: Mon, 19 Aug 2024 08:38:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Wire up device shutdown handler
Message-ID: <nywmw7hdeoimky6vqkaezucwkgftxfsapam3t66w2svl3qti3a@ouzyckusyrl6>
References: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
 <20240819133138.147511-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819133138.147511-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW3PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:303:2a::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: fc60f0b4-ffee-4c67-3c63-08dcc0543280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yE14bvP6QR6kjmYDYIqeypYI7bKr/KTNPGoVCNv0pVB5Df2X+/7ObY10v6?=
 =?iso-8859-1?Q?zW51CTvLAqP8k1I35WEKBw5EkQuLVRzsrAwqRhL+8MrIm+ftKz4ZK/SiGC?=
 =?iso-8859-1?Q?SjwFgvQx6WoZucI6eQ8NLemK0nXk9wIpTk56Dr1wY0ej/BI3khZvhzuW98?=
 =?iso-8859-1?Q?km+vc15AMZtFGeN4AjsanO2xInXecclHqAuoj0kA7tyAgFa0Haeg5GwcTM?=
 =?iso-8859-1?Q?sLxxv36XBD1StejninHrq3oCXJuYe0bXl6PuJhkTkuW3HjUFTA4e+5jln+?=
 =?iso-8859-1?Q?m0lCp8GSzTgMidXJsWYK92qMfDqznUkcqkjrXU+shy99EwVW1Fc6nwKam9?=
 =?iso-8859-1?Q?nQHCmOi6myvRjxnSHlx53/97hNy9Ubdorn6EmXaulrTQc5Ovo1oPSFPZ4D?=
 =?iso-8859-1?Q?PsAorYe1Onhgr6dBqyi62Ah6RWNilwo4qcYuZfW45Ph8KXEoSzlVwGfvzG?=
 =?iso-8859-1?Q?c93DvvqmtPYrwjO5OCVjILYIpB8evkoWNd96O3yZFFskOikP5OADKoAGpc?=
 =?iso-8859-1?Q?iCYHbsNtHFXVPKTrPmTfqXswRNrdjJ2Vc5e4AJjdNyUNH6JA63hTTnHJ/s?=
 =?iso-8859-1?Q?Lm5pTepT1RTYDGzqJvvgrAqUOwa+VBgUpnEINcxj2Xee2zfugJy3Uj3usI?=
 =?iso-8859-1?Q?7koab5SJrVgS0g8J3jJDgr5BxmDb0Kicz4OImeNCPMFk+lOyFHkYZx7DX6?=
 =?iso-8859-1?Q?uvLAz3rBiGzirrRGYYKH3wrOzQScju/9xcE4tSm+rxIDUyak5TZz1jcw+U?=
 =?iso-8859-1?Q?0mMg8DjpoqPC0BrAggFVu2CHw7W4ZbwqkISzOza8jg/lhwJ6GBs9QA0Jyo?=
 =?iso-8859-1?Q?gGEDu13Hdx6HPFjtvhpD7W7giqXMe/D9odolIqH7acL4Ku9BXxpTU6dvNn?=
 =?iso-8859-1?Q?MwYiV1iv6UOquVFg/LnGFNfyMmbyi7vJYHQcUEko1JdqF4WKvSACaO1tl7?=
 =?iso-8859-1?Q?ji47ixh9isWMMKBhAI680Hci72oaME/sCEISDNrkjjzGTPTjq590zvK89X?=
 =?iso-8859-1?Q?ZWuLizY5NOyfgs0YQmxF4sneTJD5cvgQdE1umMorOvQq29zIvjHbZOA2r6?=
 =?iso-8859-1?Q?uP2hg90e7uGam74r4+kuJEagDpJLfCuuSAeyoZpD4075cJFOpm64HNnlGg?=
 =?iso-8859-1?Q?S7k4ptbslh+x/Pt8jG2AIPE7rijO6Z7/EafLHiv+aVB368jGUYKKuPJtXg?=
 =?iso-8859-1?Q?e6Lh2RFlBjWy83NDe7dMtT3oeNwBZnFjeq7JbVlY7gpb8uNQhKcxKdc0vb?=
 =?iso-8859-1?Q?OQ5b754OReaRzKPCI+PvZ1ps8NZRI9joGYVopF2b0/JkIvxcAnpOXK0ak8?=
 =?iso-8859-1?Q?2bGk+86E8i4JM5I/DvKuk2xWA30P4yFyslL7zApKsiL8EqecQTOytpTcjD?=
 =?iso-8859-1?Q?Ip5f0tvNg+iT6WwQV8ci+2nmf1Z9Nm22vqn0Ki/XrWH5yHcqpCLSU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YvUhWwgdDKaNUVt6+9Rj8WcnetUIyXlh3kS34qcoDiXgJlDWng0wP0l17m?=
 =?iso-8859-1?Q?b/lKqVGuOhMwOqUbxSajopNCkZuRBMQHgG163JkFCMZ28RPgGFFl5SYU6C?=
 =?iso-8859-1?Q?3eNpVGXuNqbucqKRTrIWhV9b30vo1hzZQHdCWR7gUnypqbGrcwV2Duy4jm?=
 =?iso-8859-1?Q?ebOd9GlIshVKguEFyp9Aa6f3gpxJa4YUFptdFZhXSdldcbfojYhfqvjVda?=
 =?iso-8859-1?Q?4fl2J0jZURpxY0T/3sgcujq6vbSGo8h1caSlda7OfkKbG+Z5n8t0P5A+w4?=
 =?iso-8859-1?Q?4hI4jFjhsPsyTYcKPvJSOyqrbOBZFXCkvJaa1i0JB5S90bj5lU/GMvqnGz?=
 =?iso-8859-1?Q?ccHvvBvw3a69bzEouBZtiqZhipdAq78SXyfRE7a7Mcjik1Tz/7YWiHLuR6?=
 =?iso-8859-1?Q?2AT//lH9rdGJrnKq1f6uN7LHxlNuc7oNygWlpOsp0fSIkb5ym86nML5J/X?=
 =?iso-8859-1?Q?OKAhr8rcALbmMHD90OjfnG/56t6sL+lKGcoKiY9jKn9a+8Vollu3o7Q1+X?=
 =?iso-8859-1?Q?Sc3pl+52/TnWT6IrNp2takhqp3ZvPv+Lg+5QnIQc4qASiWqQYEeSNSQhl5?=
 =?iso-8859-1?Q?B/62jxpvXZRMwkIh2D2w7xvj6ziqN2W4elxtVZV3S54Y9SfSmqQO8b7xY1?=
 =?iso-8859-1?Q?h3/FLv/c/Dzb3+k/jVy2BN5wqBnPhR0VTWMfeVJRAHR5NP3EykWu7C3qGy?=
 =?iso-8859-1?Q?Zh7T0cM5oKRGl7uJFGHifa9Id2P6TF5hY/3TReWeOBwS2f6fIP11tDrpuC?=
 =?iso-8859-1?Q?gEsnw4q7Xeg05Pj4XMaMnbc15I3guaAVQpQpWYIJQprWPPKzTGKVfzCMaq?=
 =?iso-8859-1?Q?G+v4Po/0QN5PK5n/bjxCHH+/k8koA+SZwP7RKgzqa+K7O1w1L5gVgzQMC/?=
 =?iso-8859-1?Q?l6dige+wTI/gOipqhBIb4V8M4q6+2uneVw1oIwazRlQEQlUr2oZ6WdRqY8?=
 =?iso-8859-1?Q?AP2htBe4Nbsvanvn5gciLRmut3jIA1rpQ7USeWVrc9KJG1/FffseEG3TbU?=
 =?iso-8859-1?Q?TTBtLC1V9G+1SPa4+hQXW6nb1rzbjttLGDvwtHw0FNEyMbQOC+yLujV6iY?=
 =?iso-8859-1?Q?MMyCS+1gt50YKzd4hAsHXNEl3o3b+K0rEol8T+y6fj8WDFud+nIWFo9IEa?=
 =?iso-8859-1?Q?62epfA3BbFk1ncbiz/EegaGEnS3Z0IiMwlg6jsG43TyHpstQtN78+ZVzjT?=
 =?iso-8859-1?Q?FKBE6KeClbH2D5asrlzekmghKBxVtJkhAlhPUS4+UEzoOvhvI9LdDHfzA5?=
 =?iso-8859-1?Q?eOelWgAAH7rRt23zBvgr6efzUmyAH6JWMUxdMPUu/ZWWBXIWeUxP08Fi8F?=
 =?iso-8859-1?Q?1Pkhh5omMxdcqMu5BBYJjzQ6BBjEp1P0mU5/O/UkRq06JODGoZIjBtOYYL?=
 =?iso-8859-1?Q?RMBp8FYblE2FhGvxLgYWbcJx6geZbBOy6oMN2bz9mrILiwgGJtB7hTNRnD?=
 =?iso-8859-1?Q?w2FfrTMauHw0veJ7mNpvodDEGFMYYcZDHtdMo2XfbokuCrOnrZbmWNavC5?=
 =?iso-8859-1?Q?HaGTm6d43tnptHWkY+dgqwN27x1Gx5jGGa2FMIB1SV9pVCbyRsu09sfXH4?=
 =?iso-8859-1?Q?ToN74B/JltfHruq2+7JHj+Hru4ISjkaYTeNzXIM8FKrp/q3FMuvb78Dsyu?=
 =?iso-8859-1?Q?9SLTGEuncbpuHbAx+ZCSfWJx0GE3popaYGW2SbX7P3IJlAsxjW+FZDnQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc60f0b4-ffee-4c67-3c63-08dcc0543280
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 13:38:23.8134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knjIuacvLR9OXNRuik9k899fsXVnLhQRFjo9ZUH1v+1GGStzFl6bdOk3CsdvPHv0x1n3cM30AHmIhhHkLB21+Rp8UhwVCgrvjZE+CcM8qPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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

On Mon, Aug 19, 2024 at 03:31:36PM GMT, Maarten Lankhorst wrote:
>-void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>+void xe_display_pm_suspend(struct xe_device *xe, bool runtime, bool shutdown)

https://lore.kernel.org/intel-xe/c4hemi6eshos64d6qxfux6wosyktw76thvzbwgvi26rbhbvvgr@3jkem2ozvclg/

as I said we keep adding these bools, making for a horrible interface.
Please, don´t.

Lucas De Marchi
