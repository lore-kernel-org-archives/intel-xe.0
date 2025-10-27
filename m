Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EAFCCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2210E549;
	Mon, 27 Oct 2025 18:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0+ipmRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1821310E549
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761591012; x=1793127012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kjX1huxA+HORJdENh7+ogQO1lJ+zFtbJMDCkHB4SYw4=;
 b=L0+ipmRiOZQps0QWIGb28Yihl8wd0eWN9nWRxkZwMaCcPSRYrQmMURZu
 hrEMXnRI8QygnS43BxUXsk9zeNXW/62d+5V6zmkfvN3fvlEQ00srAciFb
 5o44ZKwc87BYsz3woH3yFluQFPWsrxvT2rDFiRgtOcWGtrZ2MIE8BMbFV
 JOcf1iswUCCfBsJU5rHFmk75PJJoIlMFBhmSBfRkpWE1RAykShSXGs8Yr
 XO4pRdYes6kaRS5V/gFBjvXQwRLJOuP8z7gSmbUd4DsKt1sJCA6c4YBD1
 PcOJVHakceDz5ImYQUog5MjpshUObnlK578NjXPreGKhe/6DarglavKGY Q==;
X-CSE-ConnectionGUID: r1zTspmlTTa+EiLpAcjH6A==
X-CSE-MsgGUID: x4h0OvTGSMKAf4x+gE4Ojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63607472"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63607472"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:50:12 -0700
X-CSE-ConnectionGUID: 0GQWS/jxQayc3Z7JxYgqPQ==
X-CSE-MsgGUID: fm+H56I6Rb2loBPmDGFq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184747955"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:50:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:50:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 11:50:11 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:50:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xc07OccDx6oinV28YT9Q4a261E/liBjazA/Ha9ihcGfX2Cc+nnZt9SP2BK4OUX38hsr0D7VqVke9NJ3RpOGIPjOTpT0hXkJdqre/QXjxN6HF584i3sm/KZESkMAYzHLZV4Ysq4uge5VpMhAQ1mgTLtjuZHw4pXYdnV4PShexD5VZHdSfFp/1oM/V+ZvN+iZv0kMyAenoB32bJpPaQxAceDrDuxQsDMRjwISOLudmsuIPbq944qPNy2fIohIYoSAi64IxVOXc64C24PMh6qyaiJnhvw+2xEoJKRdps+q9uXyZ6YSSM7moddbS3wLgp+HHO0AqMnt2Rw6jS1lFWIw3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjX1huxA+HORJdENh7+ogQO1lJ+zFtbJMDCkHB4SYw4=;
 b=C9+S0H1wNzp6UV0B04KkNSSLkSHEZq/K02ou6Bo6tNMcL0myqGlQ/Et+VhboGKfTVOQXnbNwEjZSOYxLH1pq7n98Mtsk4kBEsG7hERR0aQ1BBNHy2U5Exb04l8VyxYC26y52oA3YNU+FLHSmGBGoUEu7cZNn1iwPDtXPwB9/3guT13X+ijFfGesKYOfbY04nV9lixJvYascYoqfkTbI1e/ktW0RRciLb5oNcPVjok97E7ZUySr1wjwWYrLEhDHTDs4VmJaldzxTlHocg6aWjvABYFf1wQ9D5JeDdj0vN86D0eGjZP9jG6Gv8vj6ctRNUZIhk9/uv7fvkr4GHx1NbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 18:50:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:50:08 +0000
Date: Mon, 27 Oct 2025 13:50:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/14] drm/xe/pf: Relax report helper to accept PF in
 bulk configs
Message-ID: <nmjaoyy66bfvj53xfynangtemubbmtaruyh5c2n6rhb3uco6eo@oo4apfiep3v3>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020182414.576-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: c59e4192-6e53-4af2-e2ad-08de1589a691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7qmujvr0Wtc1vwFzGTlfkthwydGc+LOdKN+ao3PotQAVI1KOZREjC7/Bxvrl?=
 =?us-ascii?Q?YrCdkEE/eLBAhRkr+NmS944WU31KHMlEXSnJKpnOg7ykveLeO/ETwZTEFReq?=
 =?us-ascii?Q?bO2Ax3IuRnqtfwFmzZMZLgm8ljpV2cB2uMXgWQetxfdtRFhK5Y5MkoQ1QIrg?=
 =?us-ascii?Q?CDzB5/ZEjOOIqsUY9WX1491gjg+hoc46oRgCmlEaX6BNmZWs+wzOiuzCrH1l?=
 =?us-ascii?Q?Ya52c+9qh+wfqCAY92SHhzuaYHDwvJmM3f33MrDQEA4OjOEk3hPQmZla7a8J?=
 =?us-ascii?Q?pZ2of4hlVMVW2wFRQGBqBoapJYivkDm1bdMWAhS9BohjhTmElFsVAdqG6mF3?=
 =?us-ascii?Q?mXUwfor+iXYVSw5YkCqnuSrBwKxbT9ZpcAFzDuiIPT0RRDQQS1S0YSZulWMF?=
 =?us-ascii?Q?T+aoGRLqB87Jc7C2qjenS1ElqJMD8gFFthD824Wps1OB1odF8zeZ61c+3R0a?=
 =?us-ascii?Q?VZeX2VPVDPXhbCMtB7q/518zbIKIsl08vqT6EKnXlEVwkUPlYxhtFgRf23at?=
 =?us-ascii?Q?bdr7KDcl9omC6lRu+k41Y3tKB2eyIGz9QaRi4jLcPxHIhQCrbwjs0Ou99+rz?=
 =?us-ascii?Q?6vZGKC0UssrLsuVzJ1IfM3v2ImTYN8mu61y1NFrZxtN0SyfkY8RjFEJYS8nv?=
 =?us-ascii?Q?FJIjnughppIv2+t5HirLJL7DRN3IvK2CMmGUNRWA87ATiRPdeh9CX6UKo1GJ?=
 =?us-ascii?Q?5unqgBlF4MH0aFIGZhShqsgbWzNVYHwnH901/jimBmRrAw9CwAwTZilD579r?=
 =?us-ascii?Q?e3olqaHYAYX1F70fF8Gyx7+8Izps/tnIOcSM1jzJKNUOePXTCqU+SweLzGRR?=
 =?us-ascii?Q?N8ZDOG4wKXP4k2R8Wv/AXKnRWMrKa9b2pjBtYP7gJTBsfrTkQ8zITPMRbrzF?=
 =?us-ascii?Q?3gKGeNZgsDnT2rG4/4idZsxFSoeX31YFOKcwKhAD6slDI7l8RhufH9kgZ35I?=
 =?us-ascii?Q?Bxx2pDkhXE6XLpqKauVQl1Qn7X2wifDQeeslZnBKiL0DqR7g6a8hnBC9B6TQ?=
 =?us-ascii?Q?SJP8amMj0zrm0PGssDxaDoQe6fCvE9DF/Wt3uIf1VnqXgtByRcNo0VRZwayr?=
 =?us-ascii?Q?4cOhEGvIgAL2/8jpPHsq0kzKF3w3Kky6znxBDCe36kglcujk9P2OlV1iv2aD?=
 =?us-ascii?Q?dwVCK4CC7YtppGRumZxscGYygn9syC+CGLqAjplzQraibIxzofogkf6M/cyJ?=
 =?us-ascii?Q?lIzGIYNIACEsBDiy262HgBew70mSDZrBijUUsILfWhHWeDDLM66bIoWfX7Ja?=
 =?us-ascii?Q?6BbaFQMizUHuCgfBBvbOF9h0UCgHOcGM/FjMAUR8C0Mg5gv/uJ5TZq48ihDi?=
 =?us-ascii?Q?qYcB3Qw+GGdm6FlmBat0Gfmm+3ssxuT0l+nVgdy6vOYerlfHm8G69yWQc0II?=
 =?us-ascii?Q?3RBj8NtZdzI2vIkuV5Bk0BI+RIkzooclE/xZCu7g0Z4hdM2e7FO1/aMwMeDp?=
 =?us-ascii?Q?hDqKLLUSRD9NR+My1I2sh5tAo12vQ+bJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kiibvNN3XugHT/Im7dKgfDKBjcQaAbD4UBgFO45Gr7sKpy8EQ1YmlPyIJZXP?=
 =?us-ascii?Q?46oZ2kjrta+C+sOh4b4+rNRRsTkW7iWOZE0gbnVnEGvR/avL8fVuVAgBzDJG?=
 =?us-ascii?Q?yg5p8kofRHKaoiTgvrHl/qmtWcyyfQGHFXAJKfVkgQwPwXIFvYNLbFNJ4Ogw?=
 =?us-ascii?Q?M0r2Ynel15wF0aYcoV643cxj8D25MDNNGKHItBcrmw1tW7ZbxQ71bP67uIYn?=
 =?us-ascii?Q?NuJmPcMFU2Ywe74mh1O2lswmwmS3lTkHEKSUTqPksviXDAfKtWlBmQvH8bmr?=
 =?us-ascii?Q?izPjweScYZqV4IZGxVRbBpWraWAOmFZowUIHCUnV46Y5dROqc3iXmwtQ/jDV?=
 =?us-ascii?Q?B2By1kCzRC2UOZrkm1qr3GTrUGoE69ReuqgWw4Gl4Y4df+5xSJwB8lhj1MpE?=
 =?us-ascii?Q?NnKmRmap43Szyqiuhsd8C209uRegrJprwezn3GfmsEo/3ecXy2Bi7JNLghrn?=
 =?us-ascii?Q?fN0wnp+mtqyp4SaqSpumu31ttUUGUnWKMfSo58Y0X5nl1inWVczygDOm4VfZ?=
 =?us-ascii?Q?SHUsTBdOoAt8XlKtc2+DZro1SJV+H1naRdENC1DxmVP8Tux1wKAph8EZTDwq?=
 =?us-ascii?Q?gKkI6QE8TteVSm26llSPYvn3bNmZVwfCOf9t3QjWdKqCNJijTfvXKVBos8Dp?=
 =?us-ascii?Q?xJfd9GZN/eQnelXVSYg/duazyzGt/INw8kSxa+wfYa5nc4cUvw6RBb7AXVXT?=
 =?us-ascii?Q?yfCFsRQndmeVbe9l6MDFLJobXmNLE+8bxKQP0L9SKxO6r1gIqe7rKxMQOcQW?=
 =?us-ascii?Q?ejrhAlqb9rqRAZ1ueiWJ93aN9/8DbAictcvKUAa5kkzj5qGhDogLXmYMe5Gw?=
 =?us-ascii?Q?jRMBi77tneAp5/vGkDhIN8XNzRzQGw01oOns+G6foaCJYjLXsGHa/w9h7YLE?=
 =?us-ascii?Q?0DTy7P3gkCupNh9w+nQxa0ZOs7ICZcJpUXMcoA09+TgO2V3/GRmHKbuGIMTQ?=
 =?us-ascii?Q?Gmp+aTRsnqBsgEXJd0JFJfIw1TE+qYmwITDAMW+FBEdmjzjmmR6o/k3UEj1h?=
 =?us-ascii?Q?GAQiCMlmbOu0o217dSkimYYUuSK7jUkgiw5lvGlJUfc+Ft3bCO3qUVsZ9O2S?=
 =?us-ascii?Q?aYcY3PDYjSCLeFiGsKsdVWYys/X8wjWHa8Qsy2Yu6IZAKnhi01c3wZx2i6Vp?=
 =?us-ascii?Q?Nruyg6USzEMnbz4nfTKYOKyjRvvtHUYimf3aT1E51TK1x08Q4UTCrNkS26pb?=
 =?us-ascii?Q?5R2Po8rKeKD8WxF6F47HWoiAdkJaobeyBDhzr78PTBHLC1ODc/Mf70sl3oXl?=
 =?us-ascii?Q?eo/8qxzb15E7v8DkJR1+rDJZGW5Sechm7ivBKrVXAZZna6rUBOW5udwtWV+A?=
 =?us-ascii?Q?p5i14L5d5mj7FplE/MGeXzUC5AVwO6vmgpcW9l9DsocKyipELAIxf7b0hzwD?=
 =?us-ascii?Q?jh66/9gzyel/HIDYCIwoWoZTXE1j/KeMnlasOWK/p7H48xuLn+bCr7kOOdDF?=
 =?us-ascii?Q?Mp6JDS3lCdxv+a6SLiAPdRhuluuGuYuUEBd9KxmOjZfolSeq66E4Y6sAf3AZ?=
 =?us-ascii?Q?KHcuS07CeWCh19ivhT8r8c29s4y0C/DPEVROi/5dk4W10OvDuYN+voBE5hzu?=
 =?us-ascii?Q?t4NhIo6tHScPdOSVdM47GC+y4P7w4SqCS1R813u+kg8xHlwD6u4uQNy56ZKj?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c59e4192-6e53-4af2-e2ad-08de1589a691
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:50:08.4289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dobx125O08u1pO+BEYpgFcoNztIve4a2gc6WrLdV4z44oCavOmba9ur/Q8v50GyJJAZx8djhTlIHVMvAo3YNPbbQS6TrAAvOqM+CArFBNY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5014
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

On Mon, Oct 20, 2025 at 08:24:04PM +0200, Michal Wajdeczko wrote:
>Our current bulk configuration requests are only about VFs, but
>we want to add new functions that will also include PF configs.
>Update our bulk report helper to accept also PFID as first VFID.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
