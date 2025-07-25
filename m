Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DF3C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 13:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63F110E36F;
	Fri, 25 Jul 2025 13:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ho+a4C3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991F110E36F
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753451520; x=1784987520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RPNSFEdN4gPvixfRdrRZv2Bn1r+tB1Wz3HizUDuGU7k=;
 b=ho+a4C3Hr1iKYxXg4zYacxb9kWKTfM+O4GzUV5sdWmDTirfga1vLwbU2
 rUbbnF7pEvFPBrDRGtG+siRWZynisr2zKYyndi71KdAPzuTsc2CPiBbG3
 x1ehqc/AN3SKWUguqrGWJEUyQ1iaBOYYTHhhkno8ky2ShtMhxr2zvEWe9
 d1WJ4JnPz5aixA/rRHVVRBW/S9BXwbGAT+pjNIlqbSfBAMK0VufLoaAuS
 dQQRqSPyiedbGNywNY/w+rKWJ27XYfx6HVy+FrIsbU99Gn7wzG2s6ZuE7
 xuT3y3BHFZznDaBkwN7KWEs5HHtdHzdNrj1jS9/lcBlSfOfjxqsEo7yqy g==;
X-CSE-ConnectionGUID: MAGI8QF/TXyjJBjy+jYYzw==
X-CSE-MsgGUID: bihgOY0ATeutR+n5KCTc8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55664970"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55664970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 06:51:54 -0700
X-CSE-ConnectionGUID: eV0yggizRTuRul9nwAMVeQ==
X-CSE-MsgGUID: OXm8GOBoQoqfYMNBF5ZNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161257427"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 06:51:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 06:51:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 06:51:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 25 Jul 2025 06:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR4nmFTDgVPfCtZ3qWittn5ZptVmOF0meIu+5Wd+B5SCFOxZqGImfxbO6oMxcKvs2TBzRzqhySDvzBcB8Z1ln3fpLqcy06oGqmURvj1GsZQsMDq8b+0fdeltWvbFlLwYdAhkRAH+pv0uGFVytAm5+naiRnT4W22tt7MVfuCiNnCj0r4upYnCuVUxa+if/J0/kmz4LA0r2KoOuRw9kRjLJtIWsjZFCkcpJ3mHmmvCPx7oE4Zrq54mvdr+iTdtJHrLMWw/7ndKrTy5RWy7kwYmI8wm4eJA/O0OfxYuwAEynuMXfmW/o5VYdy3UPDJNeIJcdKb7tCdWJ+UDk1AhvW29xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZHxP1LsthnjKOgyrxxp590f+tdNguu6/SiOjVI1d30=;
 b=X1YY+M2uNj+sIJx/Yf/DPN7a4rm3Db6K/dw1h2ZE1RjjyLUweyi0A1uRidwLkebXw6UhtWS6GOrclrjOTDyOT43KOvIqVIaPLHu+grgoirnGF07wKcxFh9Un7fbAbP5hF9UpZW8E7M6fxn2jV/rocde3Ze3rdtO8MMAlsH2NEmO8B5vHKUoAVCdb0yVsaJ+lD6nzef8oaYcQON96ZYCEJmw2l551JPdLAom/LW03NI6jMAwcKygIXPNSC2A0oWUcuMNqrdkmDuQa/olE87Xi0R7etKom60HK9DfxbbGSbz0YtSS7M8ir5UTB3/w40i/Nsoz0l21WYT7RYy3mGbqg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 13:51:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 13:51:49 +0000
Date: Fri, 25 Jul 2025 10:51:41 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/6] Updates for drm/xe/configfs
Message-ID: <yv2otl5d7fxilyf5nlxrpqh3ccpggladbiizclngb5igc7bygt@hnxw7vlkcpa5>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: dd19dc81-2d93-41f6-f66f-08ddcb82673c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mID3oScaDScVeKF/0Y24dUQe2cYjYQvxLGqBUyzs1M1fVwBkLzGBosVa+hn1?=
 =?us-ascii?Q?E9G2aGgB5m0pWQB0+Fvq5q+GYtqEUudxSHccd7PI+Nvsf39HLkAWt6acz6Mu?=
 =?us-ascii?Q?Vav+LDYv83xN72Jt0B+c6qdncVdE7jbLjef31eCA9tEFSVdJ4l22ih+6Zus1?=
 =?us-ascii?Q?HMJmNrPj6VgCSM4Za6sgTH2N/qou0e9TweLx9rT2VCOGUnXb+SxDe6I0wOM1?=
 =?us-ascii?Q?hgTPYQpQmbbXAyCbKcDlWlPmm7ZhSHOV3l4OgakhQJwBnMiY1081M9kU5yzK?=
 =?us-ascii?Q?IZgSOyiq0a5r1n1Z5Gc5HhRzy897s3HZUVsHhiJnNFqAAsUxoQ9ChryvqRVn?=
 =?us-ascii?Q?8yRqLVA45wqlrpc9IAF0AsWmbYS+JpEaYz1eX1xDCDzywBr8vxBTrA6j9STL?=
 =?us-ascii?Q?Y7AtcMXsrZX9GdBK+NPSXk8YmjIQ77+WKLnDnXs1SN2gLpCGNp6kdmSSPNvb?=
 =?us-ascii?Q?avCjt3xWNWBePtsPCMWd1llyBpbKwqzr8pA34UE7jLfc8dCLSQnspR/JSWiR?=
 =?us-ascii?Q?3yh+p/8zPL/5aMaO04Xx8QeW9WmSA/jkB4zWwIolasrTlgIeStqFXuzVCrmz?=
 =?us-ascii?Q?DZSUxklO56YNppQItvNPVj5SYViu0e4YWoIhcRAInyrfl3qvjjKOpEbowm2J?=
 =?us-ascii?Q?1iyK8wrzYE588ZrBtyrbpD9KiwBaMjdbywDtgvkxsQ9W7q3QW9izfgmxWQEn?=
 =?us-ascii?Q?/HtI1JITWED3TkutothvcYv5QbzQYVgQNeIHHXl7C5gZZepfCNYmr2u+J+2f?=
 =?us-ascii?Q?VEC8gXVCJGaOCHnSnvf79ErwWXTctqGofH3vjj9vpRv7wTqpKCcyXTjo69nX?=
 =?us-ascii?Q?c6BCFxoD2rBjTNoH2dgg/AvfqtTj8oTJ5bTQcN2CchX6W5OU3KfrOa/gAc6m?=
 =?us-ascii?Q?pXGSl7pt9HZ3tXnL0tyZzhaxwD8/450eyt3ch3yPR1w7CDR6sEc6ZuInNbkD?=
 =?us-ascii?Q?VoIwBN4+kxKWq0smOH+TkoKCsndYSuLoKRYVKeYV6DF3olUUKfJMzchVJCB/?=
 =?us-ascii?Q?Nz7mizfb6WChtk0n1q9T70imjWM0uMi8USOeR6F19Dn7Cl1zX6jhEAjy9Lzh?=
 =?us-ascii?Q?6cWmgO3DQrr4p5rM1oZZFu5JVx7zROx6/g98cj69a/wADjWG5fuENQMHIjnl?=
 =?us-ascii?Q?ODsLrA/IyRTqg1axszzVWPPotOncq5wXaRJm6mF9RY0nbuq3sYhsEoFogOAv?=
 =?us-ascii?Q?r7KiAgL5fNj7WLaGge8MuDvKz7XNMIG1XNi9QqCJwZbQPOncvUnV8xtON51v?=
 =?us-ascii?Q?E0Bbc9epxUbgz7PzIvWBV08VA8PrJJnn5HV0SKVCPilYc3IewK+VtMyNaBKw?=
 =?us-ascii?Q?Ch3WEDKvt7S14BH7KF6t0lBFkyaAaym+lKPPDcDl3uaZZVb6PwwaLGYoNgdk?=
 =?us-ascii?Q?ZAvIdWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vhj2jRlCFHYzYk0RtEJk3BTYtH6KyPmjGT1UN9WpKsgvWcxczMDIeAUxwWMy?=
 =?us-ascii?Q?JC5wcmBAXh4ghxuZh4+3RzzChRxkXptPqMHTVwH8R1N3pljnop5GB3yVBEWi?=
 =?us-ascii?Q?frfW6NJVU5+iJ5BOBV8YFZ/gCKDHMNDDespYdkWyUAPpEoh78Q33w8fFGI4h?=
 =?us-ascii?Q?/1aIcHrIhgZoZuOHwBrDkPeqCjGxukRnaD4ZrfrOwYNdgp6X7kqLY5YJwB90?=
 =?us-ascii?Q?OeSj0K4qlQMC4VerUiUnaWXm/de/PQzrQwGV6qMoelL5wo4svBPqdVncFKdT?=
 =?us-ascii?Q?nyK4zW2fPFVTgJOerYhI/jOSqQOrIkg5KGGhx2wty2RNIIPQl0HqCab0gpGN?=
 =?us-ascii?Q?P/v8GSLmVSz7vT34JKvwjBtkn6v4SZlsWPDEdk0/jBFvFgzo2sCiGBOQp1zZ?=
 =?us-ascii?Q?Z76mzeCxKISXVI4GtklJqfz7wmyCl/Pdlg8qRJgmxUmjGiOrIpR63p70AMMX?=
 =?us-ascii?Q?XPLcesoV23iYyBnJYQjPjeGKCLzzaWjARB8xVqR457e85XV5GtzEoe0mFjmq?=
 =?us-ascii?Q?/dDUdqQKXkqPXioXhHruCYNY5KiXQ9mmhFI7y4E6u1ona9n8WQ7sIO27yzF/?=
 =?us-ascii?Q?959imnQUJtFxTWyrlqKaEHkepOVnJlHclwdpUXWLJvivj59vY8kJmct2/50l?=
 =?us-ascii?Q?f3MZSuNSrlMY02iHd4eSTkmPy/WrS8XZ1WK+hx4xSHX4dP4z8JuEJNUeBn4b?=
 =?us-ascii?Q?OHSMCOhcTLxR1FMU3X/BTnISXA0ydft7kdKbYf8wDmqf7N4J1ClhiXvK/ulo?=
 =?us-ascii?Q?voxHkmbLMALJIGxBq099EWMdXBSzl05+aVHCk6VZ69yFDR3cd95hmBIqCoPf?=
 =?us-ascii?Q?AxIMTIxXFv2TaapfoYHBOLBxQ7NYkz/Ry8SzaqdMnncqX8WzhNI6qE0+W244?=
 =?us-ascii?Q?Cro0Pd5yKSBzr6mCakwnEQDTooBDG9OFD/b8yaaEbSZ+E13pwawPXOiArHSs?=
 =?us-ascii?Q?1UGh6vZRUS/Pult/g66xACj4OiYnxnua2KuZxw+f+H1zQ5q+FNSvJOp+hHpL?=
 =?us-ascii?Q?69hY1uo8qScVrdDAgmle6ULXqbD71ExVheTV0WPWMrmvzdcfpK5YOFX4eHm9?=
 =?us-ascii?Q?qGYzS7dAmIlpOuXkySIhZl62TsfRpna+4gpu1iuoheLp1l/YA/jC6J6PPGPr?=
 =?us-ascii?Q?gaG8RHNYHmWQEtmf3j1YLf9UNeClW4h9RUn/8LjujAUPpSTCIZTuzNUjKRHU?=
 =?us-ascii?Q?EpW2kab/kEs0Zy3dquBUURCBgUC/qV5EuQ4/j5V8CuUYvxVYf0BGDX0F6L3x?=
 =?us-ascii?Q?WP4g+OB/D40TME1nRavDEQjVnBTm9wk9uDQ9rvmPJl+pv6PM280JE9n4v4cv?=
 =?us-ascii?Q?drdsOk7NyUWYI5nnm2hrvfXYAl9eV3NeRTR7rBJRrF86pkaIWO4MBNLfYo9z?=
 =?us-ascii?Q?ayDsdMCJxmrUC+J1KZ/zej1v/qlkazhCM6R4lZBBbgLm1TTfxUpq12oZHzvq?=
 =?us-ascii?Q?J67Azz1TNqPIOWpOC8BL13d95w4pjx2Jhnl4G8m31U0vl867enKhzupC+Hvz?=
 =?us-ascii?Q?dQcGM25pq5ytCkhfMB7KLDCet3QKNe8hNETrsArxTxJPL3BjfeXCmk8/xPP7?=
 =?us-ascii?Q?RroIhMbgAKvFw7qZDSGDcLn9jrCH6J84kKKF7aa9SgImiTDG5lq01nAZGBNo?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd19dc81-2d93-41f6-f66f-08ddcb82673c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:51:49.7700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuuTbVlBgAEPfH3Zy5BtnV0Nona9hZ0LVfTsGuMNqcWVRHfMa/l073Lh3wpfjK91O1zcKL+0yN0H5NcJYQ+eKVe2oFYT87wXYJTDc6DXa9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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

On Tue, Jul 22, 2025 at 04:10:53PM +0200, Michal Wajdeczko wrote:
>v1: https://patchwork.freedesktop.org/series/151773/#rev1
>v2: https://patchwork.freedesktop.org/series/151773/#rev2
>    keep using %x for function scanf (Lucas)
>v3: check if device matches driver device ID list
>    more checks when trying to configure future VF
>    print debug message if configfs was found
>
>Michal Wajdeczko (6):
>  drm/xe/configfs: Fix pci_dev reference leak
>  drm/xe/configfs: Enforce canonical device names
>  drm/xe/configfs: Use pci_name() for lookup

applied the first 3 patches to drm-xe-next.

thanks
Lucas De Marchi
