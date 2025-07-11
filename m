Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD003C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 21:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6990410E2E7;
	Fri, 11 Jul 2025 21:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyvrYPfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0FE10E2E7
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752270693; x=1783806693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d6RIEBCxB3QgVk4ZoJ2Ib9WgiKVIi/38eb5W3BRyq74=;
 b=UyvrYPfI845m5bnyjiVsH9/FQgiMMHtyGJVrPcMz+P4qbHE7OKjJg9oM
 dF797+NqpiZuTkOvlbgqi34gshGe46UuONJPfLP6bDqsHbzvybDMZFcrd
 //bqxGI2nkNzdAlKHCRCPiozMlBAsjdqWDY4vzwiIaOz6S4tOkLOGE2AX
 /VIMsz+da1Yv4bMoTOpCIBXfMAzisoH+CpUX4psiavVuMsghhJroI3fI9
 7aWsAjV/DfdqLZ7vrNEOOK6GkkiaJ2bNPT1geWXcRcrwz4GucPhBZAXYq
 Rduc5OqUzbz9X4hKR5vqcJW3IzrTNitEp/CVK2FJZnV/APQ0GULx/140w A==;
X-CSE-ConnectionGUID: TQxGDaqnSumvpo3+MIbnLg==
X-CSE-MsgGUID: mftdHp6ySBS8rs9ZYmN3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65272121"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="65272121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:51:33 -0700
X-CSE-ConnectionGUID: 5vVz3ScvQOa4YCfn44cXNQ==
X-CSE-MsgGUID: cD23eTU1SSqT3dwf/OjwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="193661365"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:51:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:51:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 14:51:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2UX6dHSQqZNl37UMfYVbLEIxsBUGLX9k6nabYnWxo4mL30LYhc0B8et4XV5NbcvjIeA18lBYgmbPPje5s3y1BdJexvrci2++4PZh0H9KL1vW7FqK53o0v4YHp+Xeq5JHJn6DIkl1a9pSBqrZF69bfGvJUO5cLc0dfFSREaQrhFKjuAu2xOHcluq1+WF+SWMMR9NtMPomY7hZSR8XDeMJJQFm9YXgrDIQp7GhehYnZWR9xcwLO202miPEqQOzleMlQLrLt7cn6M4Ei7Von7JdrtG7YuxmHPEsYxClnY9NYfr2CN7o4UJWIeDhbKr+hOubapU1AB8SX9q9evsVpOjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNSCE9MTZ3mIvKI1SU8pT0Ec24nG9eVqt5prosyf+aY=;
 b=JZk3ckDqIgfpo/dAnca9AtkKnMmM03fgPFFW2YV/cyP4SGtBTKSiyHQp57B1luGKZTZ2pxhEUM1BQAkbgP8Cm+Y07EqZ2nfH3vzNfONUkUkV7UcerCbbx11xwUz7mvUuupX5905Awbge6joX+aSTqqt6/UoHVW5fYs0G8Bw8I3xC/V1qqmxb3tPgQIJzKCLclDH+lvredWGG1fHOSUK2BM/z6Mrt38JlTQt+Ldnz+SRL4MERldg4DT/D0NOeEVhbLYCPbqNw5eDzx1rXZr3lJODYc0eMpbYr2VmeObqIhfyHrE4AAtRqXDfz+AzkaxJC9L9ED4QkMo1Gj2W0WU/XAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 21:51:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 21:51:29 +0000
Date: Fri, 11 Jul 2025 16:51:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Normalize default param values
Message-ID: <ab6z7eo3wyz4la6ot5jcbe7fskyicyajurlsk33aosnwg2bm76@3ph6bxjhbw6w>
References: <20250626-guc-log-level-v3-1-c3ed8b452e91@intel.com>
 <b91be662-a005-4150-bda3-854521f12ef1@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b91be662-a005-4150-bda3-854521f12ef1@intel.com>
X-ClientProxiedBy: BYAPR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:a03:100::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc23d3b-5a51-4ffe-1e92-08ddc0c51772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BH8uPGfgGcgvZncUxBqI1dl5K64TfR6QE7mG+Kanh/PSUGg2xns855F3mQFI?=
 =?us-ascii?Q?aVJZni/R5FEUwT/dxoq+cKe/fAElTtjPZd4FXu4KQqPexaFSonDQ0cv7PcE6?=
 =?us-ascii?Q?9bhGjms7xK+qwMlrerlA/MvtHiPnwS4PJp4IW13yrGqscVH7Ah8T2mQNoGaf?=
 =?us-ascii?Q?58cClmzJhAD0RRvYR7llwj75x16aLv5XL+B55GB1aoq2LaYiHiXvLXH4fHYj?=
 =?us-ascii?Q?xXS9Fm+9ftF2g64D1iiuLWKP3ChNy6cwItNq3akd8pvz4dnIuTLPe94CX/0p?=
 =?us-ascii?Q?GiBoGLivjAzYgr3Zx0x8p57SJqEMCJbUnra+Djo/tt1gmeEVTtCeKQ+QWEmv?=
 =?us-ascii?Q?8snTeUNHr1d077k9z3yQIxr27T9fnqUSk9ew4Ukr/E1hrx7g2z6t666sIxsX?=
 =?us-ascii?Q?2GQwwEpcdFY9oW/IlETrSKhehVacp9B9TmslkzHtlo6vNGowH20ScKYFykkn?=
 =?us-ascii?Q?d8aOidssS83em9qofEPb89y1qAJC04RqI7y/gCQCKcWYl/u8CH4OZdMQr5lA?=
 =?us-ascii?Q?oqKgp0fE8g2AfmKF3jgXqNjaKV6Xt7ZXgKoj3tcCTEjghK+BL417LW5BOt2W?=
 =?us-ascii?Q?4FXaozINSxds8c5mDCTfoFD4Egh+jxwklVFOESdeK+ccG60QWcEl3CpCqtLO?=
 =?us-ascii?Q?F+LK+kr+LdbX74LkI6wVi6UizJCEzdSSmgUNTgdxo2C/Yx5BmKiBiFV0huQs?=
 =?us-ascii?Q?0ifTSoCueG48wAWzqNhVCC33S4SuPak+Q3zk15ZsWg6wJQ6YHiP9W4JXwRqS?=
 =?us-ascii?Q?v8CJKuym9XMXfkxfx1zphdiYb4jNjwQlQ5DwFEwuWMIqtfM8Y0nHcO+GVK27?=
 =?us-ascii?Q?wms2CeOd5UZJHoFkviaOql4uZBru/iklGeJSj3KIUUn53e5lJGujLpVCmDRl?=
 =?us-ascii?Q?kecC6e+RCdtmu6+39ja5XowjTeJqBPSO5eDPEpgtHqxxzLvoHMg7gmwAEzSv?=
 =?us-ascii?Q?z7gqyuKhpKGQW8FYbJ+JEpRTDENepJyo46O+u37i1wnDGzjdC6kob14f2Qg2?=
 =?us-ascii?Q?W4pdW6YQczK4tkXXlGA7qFfvb0yVEOpgemDJGH+7q13cOhW7E8yIP7oLIQwo?=
 =?us-ascii?Q?iTRed4jpDuo+gJQtJ8tjqhRndtZRzvMAtY7PwosQ2j5Q7uzVtETmNxxMkq8v?=
 =?us-ascii?Q?A0GU9KG1v+fAi7syKMGd214cWus9wVtefWaNsYV+O02Y//wlt767h50oxG9k?=
 =?us-ascii?Q?cR7sYCAePPn8/7RjYzk5sx/rskm8mi87pRT++76EtACsS7hn+5aDHdrovXmJ?=
 =?us-ascii?Q?IMQ5Br77tWsvZoCGoagHt1c0O4yACED2wcIgcHxUT4Sfba1mioKP4jx94GwB?=
 =?us-ascii?Q?xCIgJX4Brgqv+kfEi6b/ynWXswT0SuPxdY+s9RnOxE69YNJ0h4A9/rjYGR1N?=
 =?us-ascii?Q?74w1z385+sInRfqVymU9mf7bYGlra08WJeP1OHJdGR1TPqlKokYPl5bvvuf+?=
 =?us-ascii?Q?OS7dvVjCyBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JbGKBGVMj2WLgnVQxDAthioX4pB+icCVQfOAOw7bLSJKcXGE3rlW4wyLxVo8?=
 =?us-ascii?Q?rzkC4gJSBrDbdNwwhucUDFjg39fyqB9DhbfkqsivBNHuF4B9L6Ih/oCaHGrI?=
 =?us-ascii?Q?8ItyaXGVNZDrxF6b9cIxyhSLCsG+qxic2FsoxjTGJxOeU3ckp3xzh8q9SJhA?=
 =?us-ascii?Q?Ib/V4ct2x4vmL4nN7/DDk5E4BqIUB/GnJLvKtRc0zEelh7WN6sXnPXzv/0qi?=
 =?us-ascii?Q?Gb2i7urXgzdbpi8nZcwUppRSZNzzpCc4HeM3bkwP+P7qxcnwQN9K3siMLr0M?=
 =?us-ascii?Q?1oFjZZFTVnW4JNqrFje5WJbYd0xaEosID+X3a93a11U0VQDubPWHyz1l/97q?=
 =?us-ascii?Q?qIB8KQn/RLH2rmjrTeM15+aim5cQXX7p8PD72GbYURb+s3FnASYJvLGsLVtl?=
 =?us-ascii?Q?9F5KjB0yJ3wJj6fhO+juIbSytqgPaC3jcP6q+3Bd++s3X6sG2zV1Z0DtQAYK?=
 =?us-ascii?Q?fI44toJ99c5TXGNhwG77tDjUUh8pxmxT3wo8WCfH5lTYBnDvbxtfAFaFQ15s?=
 =?us-ascii?Q?X2tfX/TA1E5QsJRaAS2QofQ/QWzT1vCtRNrQzG/5zVyOWVLZO6lxqnkVjQMh?=
 =?us-ascii?Q?eDwuPSW4mBGWEysdnuU+TWvTdjRFYwFsZqemo3eUi5w9QNYuOcslLplRjixu?=
 =?us-ascii?Q?ZiLrxrvUJ3w2vD3ZGDlvPauoUgMMvySi+x6upkmvvT7l9+tAzyn4DMAi45IW?=
 =?us-ascii?Q?duTI6pcyArxY1rs4DB9ZAXUpP05fzY10eBuIw8uvDrnY5cBGZH3XhGhjdo2n?=
 =?us-ascii?Q?6D5OiHQm8FVb6FSrt36s4T/tTBl2YJLpqBjmkgX9ll2bYAvaEejiwVTC0lYI?=
 =?us-ascii?Q?Ku+M7a4N1l0wd4dPuRBjHuS9dsl1s4UI8ScHfjvDLi7VAXd3gfpLKNWTvzkP?=
 =?us-ascii?Q?+4XKFzdlmzcvpu0NeWVz4PY6vMnUribKSQIomL1EbeYKfhSmxAdjiO7k1nxB?=
 =?us-ascii?Q?+WrZcwgDExLeUjZax0MzHM05ozNO4bBFGt7dY2DLkG/i7Qq68yc8b8wGopWZ?=
 =?us-ascii?Q?XRhfOHjt+gZp+DGngxxlaF1wHUdpAkXN8ysyxVgLNiWe6wJ7gFP7U96WpD7E?=
 =?us-ascii?Q?FjzNQuunBhplB90FLNPtgSOXwvjk3nnp6qBHtR2NWuLvFrWPsb7uljStttcX?=
 =?us-ascii?Q?vsnJBiXrqn/UbZj+0AgkskA1wjaXcgas/UCSzw50/wmOOv84tFtb/7RklS39?=
 =?us-ascii?Q?q+s6ZfYP5uFoiYbY8w0jFmPU4IDN3cW5GDOADscs4P3wKbaUqCNkqOugQWGR?=
 =?us-ascii?Q?WWRH6HyTHoUQmZdW9Y8twhuE7ynS51yfF+PWM2xgLMSpVkbL2PmaVBdcXbJG?=
 =?us-ascii?Q?sArFC9SybZP6AcD3Ak5u02gA1FljX572MynjFeI67KvPBDu/JeUkNjEB5yHI?=
 =?us-ascii?Q?o7SBtTScpJt+eY/zhHlIlfo/GN5kjh7DKg2BvaXSe6XJUQaXkR+ECHQECmEF?=
 =?us-ascii?Q?8AJPmQx/fxUmoEN7x1Jy/YS8QP/tBDA3J2gApzsjI40u2fAgGdLEkSiR1mvM?=
 =?us-ascii?Q?n0uNBbfIvFT4svyCd7OO5GWQqhn+AqOQmKmxuNwCZD+yYels2var55j7K2sJ?=
 =?us-ascii?Q?W1s8qXFm4T/p1mGOy93RbuZjylaFGzkUqNDAMPSuE4izKDdvvPh6wnSoiiy1?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc23d3b-5a51-4ffe-1e92-08ddc0c51772
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 21:51:29.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYn52uxFcPlOy6JwVQbLTot9XdwuUzUhMxU8Hiz+65RZIu1NRnPVqfZmPxAIPIHRvYy9Q4j4/XqMiXz5A0H0BDSgBkRv8QcW9mR7B+GtBic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
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

On Fri, Jul 11, 2025 at 12:23:36PM -0700, John Harrison wrote:
>On 6/26/2025 2:25 PM, Lucas De Marchi wrote:
>>Document xe module params with the default values following a similar
>>
>>strategy for all of them:
>>
>>
>>
>>	1) Define a DEFAULT_* macro with the default value. When the
>>
>>	   value can't be directly stringified, also define a *_STR
>>
>>	   variant
>>
>>	2) Use __stringify() or the _STR variant to make sure the
>>
>>	   default value shows up in the param description
>>
>>
>>
>>This allows us to show the correct default according to the
>>
>>configuration. max_vfs for example was wrongly documented for
>>
>>CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
>>
>>documented.
>>
>>
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

I split the patch between drm-xe-next and topic/xe-for-CI. I didn't
realize before the max_vfs was a patch in topic/xe-for-CI only.

Applied, thanks.
Lucas De Marchi
