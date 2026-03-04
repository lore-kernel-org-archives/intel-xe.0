Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4EAEFCE47
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 21:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A9810E0FC;
	Wed,  4 Mar 2026 21:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0x7LrWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D6710E0FC
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772661203; x=1804197203;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YqUD3N922ZemFyJL4gEeWWmT1uskzijcyp/hhDUhFxQ=;
 b=Y0x7LrWabDvyJnAQERznjvyx90jOzsusOjxuyL8X2Y9lPyO7PAFEf7oF
 E0QpWAHvJgLNqd15405OFpYB19g0aAOGPWC3j0gnD4jY5cMyuKr3FI3Vy
 3Tt5ZWI6VhMtepW/JD8dwgAxQh2HeugmQppTeXTYh825cpG2ezv3kVDGh
 PK/cA8gdjkrXxe1WWt8LWzh7QfeJX82QlqRE51CXdoyd2VoVdn04uBdxl
 xEiB/royOnCSX2mtJ/FXVl/xMMYlUy4h2THow56vj6GJEVoUNeY0IDhXX
 71CDUWgMTUvMJEtR+mL6NBShfa5TqMbdz2LnoyPQFBUwpQecowAbCQ57o w==;
X-CSE-ConnectionGUID: oSnMBf9mRai88q/TfSMmUw==
X-CSE-MsgGUID: A0c8+G4dQ6CYxAWFl6hMrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77608594"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77608594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 13:53:23 -0800
X-CSE-ConnectionGUID: O5I7rKQOTDu/1eCtWtc2+A==
X-CSE-MsgGUID: yfQa3Y1RTCqSJmzpyi3/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="216773668"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 13:53:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 13:53:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 13:53:21 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 13:53:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp3dWElOgya8b+G+CVnQ8puhb7aBfNvKdgJiNMIl2X4aQG/BueBuJkPmDtXRUW39QlRRKFcjpEhwQXW62aJQFJQaxjNtwHYtNbABTpE7NwQvLc8AJ68leXEek0mGJys2fwKRIzUHwmIt7cLbEhSIO2xckV6f1W19nEr0+blisZmxbXMmruf6GpWtaHw2FlwjexOMa9yHv29BFBGJ2SiQoqcQ0vIp3zdf5JVK5hVfxZ8xo7cXZL6B5BoNazCcrMch6gv3yIC5AcAt6l+8Svdj6TqPkwMrpmtCSZkZDYtZHgvw+JrfxnpSc0QXvccTZa8xSyGhJmmcqrSz5Z6GOPXFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBeNyrFDADNXml6iaGIwf67xi2n8c7hzfTVej9ZoDno=;
 b=ZqZJqWEVNg9hf17jMDpbWtskTBybMnlP14j2D4+2LNVzq9xOcFaJ3nZRLV73VFCK0/0c3WIB81c3YYdS7u3iRyCx31qGTiQjfAoZvyHEvTVUfdbDSEN2ygWGF4II/Cm7gUr+I1oo1i4lGik0qE8/g1Dh+ohuxgMfcjEpHcpsksj+CeVB26q1SCQIgVyTCwrWQiWHg5pBIhG8xR6KdcJxPVNiCvNFdwdVTKFe/+0LRwxthtOF53AXAw5Gmn09F2ZDq6mGT/My1abdpWw11shh75D6ToypweOBcqvcas7CuptW1FX2T8QEk5XJOqxxOX76pTsZ+fwzzEnuSPZds0akdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:53:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 21:53:18 +0000
Date: Wed, 4 Mar 2026 13:53:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 10/25] drm/xe: Update GuC submission backend to run PT
 jobs
Message-ID: <aaipyysCLYkUhmh2@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-11-matthew.brost@intel.com>
 <c044f56096bec2616ebcb6d0247a1238d9ef8209.camel@intel.com>
 <aad8OjQWtbuk5FqN@lstrano-desk.jf.intel.com>
 <934deb296f18f9147db2478f5d645249e3a6013e.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934deb296f18f9147db2478f5d645249e3a6013e.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 3579f878-9c18-4a13-9f2d-08de7a3871bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: cXiwq/pRNkqtTAmqx/LcdGdn2oYe8fR7od1ZQ2yg7H6FYdxJlNm/lwixQxQP/aVmZjg2btbpnlrkzFwP3i2E2WWyRYzdTh/oAiQdgUd+WSALCOYnYcOvDTUKAjKd0hr4CR6LJV6Uv+5bmpuCOlMQPnG9z6qwZDX0LdK69sqJVFQLWbXnwFu8/UV4Bq7/RNTfiuHI3Go6Ax25snwrxZCETcFxFKuVuH3G/riadSBjfaNGnnFMgftdLoS9z5a9tW2i1TGY6Oex36ShPUAsutGWqPs5SOxON5HiLAYaMPyGgyKxo+/JRc5wrsbRn6bK8VOzlhOa7OkCraz3184/fZoQLqi3do6YMgjqn5ulmQ0VFM692Q9M3iH/LZVEjrzP9iThKsqCvHejz59e7tbZl9+UAJ7CLANv5ws6k5vj566KOEUWTTeQ9GvjvkIEdJnqA4xvZjEc9CzE/yG/alWRyybUryPA8VEOcZe/4XHr0FNvKZVAum1wsPlKfy+RD6T3FToF9+z2H6YWo3d9B2N33ptUs4Nl64hTb84iZvE60aVfPN6FGTKiePrUlUWN6kHp7qCcU+wpOhnC6Y0hK2Me+JhJqRMXlAKf4P8nhQUl8QJM6lUJMQjURT653GbbuStrWPKVgw1yCo8v+iRny3SBLPu6QokvffzWKoRsnVY+Lwk2+DxO2Ve+b1+OyQTURiItwmR/Wg5g8q/wrxi9fNRGkJRknvV9FfXm9roG8uy9ro990F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVYwVHZ5dkt6Z2F0RzlOYnA4RHFxT0pVVlpiV3R1YVNnQ0VuUHU2RTVMT3Rk?=
 =?utf-8?B?ZytHazZXYnB3dGxsb1hJNFZmSUtzVnFxbDkxekVTdHFEejEwZi9ENjVGeGhB?=
 =?utf-8?B?anVYQ0srdVZkSi9vQ2syU3kwWlowMUtiU05reWZPK1ZFek9hOTBwS1U2WlBG?=
 =?utf-8?B?MjZQSTVuZE9QWS9iSkxUYktBbzZoK09TVXVzb0d6ekJvcEZCUmd5UGZSL3Iy?=
 =?utf-8?B?Yi9oWDVtSloyYWY2cHRXVGxTZWpnY2p2SjJlNXJsYmI0WThTU2dNU1ViSGY5?=
 =?utf-8?B?STI0TGlzSG5TZmM4L3RvalgvNk1FY2xvK0hZSEVkU20zWS9sTmFISGdLZisv?=
 =?utf-8?B?RU9rRmM5b1NKN3Qza3ZrMHQzSUJDUlBKcTZjZGFLR2lqWHNVNGtBSS9PZ1Bu?=
 =?utf-8?B?NlBwaTk0MFZRb3lHbk9vN0Q4UWlsWHVLaW51czRuN3Q4YUxXYjdQRDZsRll5?=
 =?utf-8?B?bUI4Zi9EamxQRVlQNnhRbGtROWdTYlJQYVBqbTJpc3RNR29TSHczSXJ3c3Ja?=
 =?utf-8?B?dmlxNmFsSUxhSHIwWGFRY0wvL2pPMG0ydWZZWG8yUGF0dHh4SExXZ3BHM1RJ?=
 =?utf-8?B?eTQ1cGZpMzJtTk9NZitmTFlFNWJQSHBJczJ1TENoaWtZRWc2bnRRQ2tKS1FE?=
 =?utf-8?B?NlhxSGtTTExjczIrVVVKTzg0dk5SS3FyMmtMNVVXcjlSdWE0c0xpZEphZ3Z5?=
 =?utf-8?B?aElCVkZVTlZjZGRoL0JrOVhWVmpFRjZmNXhkemdUanpRQUQ2Mk1PaXVpY0Fw?=
 =?utf-8?B?b0VBOU9SbHBJdVpXdHlraVZFU2Y4WXdGS3pvblFjd3R1UkdtVzhXNElySXNz?=
 =?utf-8?B?dkNqOVA2V2ZDd2FFdVljWVVwOFBaTnFGdGlxQnJTamR4VGNCSjI0akVuNWVv?=
 =?utf-8?B?a0hTeHZCeStsc0F5dXNGRmMzRFdhbWZVeFZVNnEwTkwyRUVmWTZOQWIzV1RE?=
 =?utf-8?B?N2JwRUhYa2gxSElCZG9JVklUbmRnN254M3FFbHlVeWljVkRKSlc3ZjdENGFF?=
 =?utf-8?B?UmROYm5MbnJ2dHFIZE82dERxNWZab0NMaURQQi9QNFI2b0RjU2JDS1Y5T0NN?=
 =?utf-8?B?MlhFL3pPelRsdFBPQ2dHUzlJbXp1eWtWQUJ4TEFXblBRdkIxaVFEaHBiZGdD?=
 =?utf-8?B?V2p2aFlZNU1uNWEveGtRNEVyNXNyMXc2YmJFZVVRZEVnVUkzVFRYb0t4UC9w?=
 =?utf-8?B?RkVZbjc0U0NBa1BZZy9wRTZCVnB0WUhTRGtNaHFKNkowTFdSKy8vM1B4ZFFl?=
 =?utf-8?B?dmRuUXRRMTN3WmdLYzV5UExQN0NYRHhhMXJMMVpQY2hmeFczdUJSTXZsWEdY?=
 =?utf-8?B?dXcwcHl0eW9VWVJHTEtJYjBaNi91emlJdTd1MXdLRGpmSXBnWDBuUDFtY0lJ?=
 =?utf-8?B?MDBuN0swNlRCcWZXODIwM1c4dFhEQUc1SzdPWmdVeEloVE1QUVpKdmxETk9X?=
 =?utf-8?B?c3BKRC9LT3hqVFRVVzZkNnVEZW43OVFVajRrRlZGbGhNZWsrcTEzbFVYdlJz?=
 =?utf-8?B?L2xsbmREWWE4cHd5Wm9KYWJNTjVDeS9UTEJYaFozWDlmYXMrWjFRL2VqWTZL?=
 =?utf-8?B?cmpxK0wxL0VFY3E5UXZTS1VTSmJoeDJMbXhDOGZCdVRWR1d2dWtsQmVUd21F?=
 =?utf-8?B?MUdkSHVoLytvVkNPVEVIajcydTJhL3lpRjh5Ujdwcnd5S2FHVzJGeGhKTFJq?=
 =?utf-8?B?NzRabTY5QitDOU16UWgrTGxqa1ZVOUtrZ28rdmFaMXBGczVzTi9KL252a0wv?=
 =?utf-8?B?c2tncEZTS2xsbnE2L1Nsc29MeVluMUx2SFEvMkVtUi9JMjRTSzRqZDdIN25i?=
 =?utf-8?B?UUxVcTN0SXJsendSb09MTm02eGV0VWRkM2IyZEF5Z0l1SmErNGZTSHVsYW9v?=
 =?utf-8?B?VVh6bFNld3plbzI1WXFzUHBNVkp1WWxpR0xuOUdCSzlXTHRvc0hVdms1QndY?=
 =?utf-8?B?TFl1L0VKdkNJUHJrUzI5amwzTDJadExRSVFreHVBRzR1dGNYOVpZaSs4bFBQ?=
 =?utf-8?B?a21KVG5FTWswUVdYbHNZQUFWZkRiZGt2Ym9mbk5JSW5EUDhlOVBjR1k2bTRR?=
 =?utf-8?B?QU1LZXVwOTkrQXJkdU0yay80VWl3M3FYd0U5N0VLdjdMNmVvNnYrK1lZNEt1?=
 =?utf-8?B?L1dSekIyZGlEMkRZK1BJY1h3MTlxZzRzNWhvSDNjMStVUnU3Mm9HcEQyY2hH?=
 =?utf-8?B?R1VKbER4WHhia2VmRHZZbGdiNHdXQzNSTVRtR253WllmUmtpVWN4Z0VDQ21s?=
 =?utf-8?B?cVFGbUNVQWFlV1JJbmpZMWJzaGhySjdXajZ0Nm9qQlFRK2tOMk9DT2lOT2Nn?=
 =?utf-8?B?dEs5TW5GOHhsQ2JXY0I2cnZnOE5TWFY4YzFyTTlMa2VuMVlibjBvVzIwVXdL?=
 =?utf-8?Q?d42+biXaea3pSjZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3579f878-9c18-4a13-9f2d-08de7a3871bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:53:17.9653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WasyS3sqTYKLMZ5j4nAdTO74V+YaNA37fiMEXk3CzH3UxZIU5uUuslXc0aaXCDrokVvdywJtprOvBA2GJd0hyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
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

On Wed, Mar 04, 2026 at 01:43:27PM -0700, Summers, Stuart wrote:
> On Tue, 2026-03-03 at 16:26 -0800, Matthew Brost wrote:
> > On Tue, Mar 03, 2026 at 04:28:50PM -0700, Summers, Stuart wrote:
> > > On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > > > PT jobs bypass GPU execution for the final step of a bind job,
> > > > using
> > > > the
> > > > CPU to program the required page tables. Teach the GuC submission
> > > > backend
> > > > how to execute these jobs.
> > > > 
> > > > PT job submission is implemented in the GuC backend for
> > > > simplicity. A
> > > > follow-up patch could introduce a dedicated backend for PT jobs.
> > > 
> > > Still looking through the whole series, but standing alone, this
> > > patch
> > > doesn't feel right to me. I don't see why we'd want to hook
> > > together
> > > the PT update flow with the GuC backend...
> > > 
> > 
> > I don't think it is either, which is why I called out a follow-up to
> > implement the PT backend. It’s likely a bigger refactor than one
> > would
> > expect, though...
> > 
> > - Build the backend on top of xe_dep_scheduler
> > - Introduce xe_pt_job that inherits from xe_dep_job
> > - Ripple these changes through CPU bind, the PT layer, etc.
> > 
> > A lot of that is just shuffling code around across those three steps,
> > but it’s not too bad and will likely give us some nice layering
> > cleanups
> > along the way.
> > 
> > The real tricky part is handling all the flows that stop/start the
> > backends while various global events occur (e.g., PM enter/exit, GT
> > resets, VF migration, FLR (WIP), etc.). All of those flows are
> > currently
> > GT → UC → GuC layered (or, for VF migration, direct to GuC). So we’d
> > need a refactor there as well. It’s doable, but it will end up
> > touching
> > quite a few files. Again, once we do this, I suspect we’ll get
> > additional layering cleanups along the way.
> > 
> > So for now, given the already large size of the series, I’d like to
> > get
> > the functionality in first and then tackle the layering refactors.
> 
> I get what you're saying here. Other than complexity, is there a reason
> we can't do that work first though? Is there some critical reason we

No reason I couldn't pile in those changes into this series.

> need to get the CPU binding work in first, basically?
> 

CPU binding is the basis for much of the SVM performance work—ULLS on
the migration queue doesn’t work without it, and parallel
faults/prefetches don’t work all that well either because of ordering
issues on the migration queue between copies, clears, binds, etc.

CPU binds also make some of the multi-tile refactors easier (included in
this series; see patches 12, 15, and 16).

So I’d like to get this in without expanding the scope too much. I will
definitely rework this to use a dedicated backend and wire it up through
all the layers in a follow-up, though.

Matt

> -Stuart
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 37
> > > > ++++++++++++++++++++++++++--
> > > > --
> > > >  drivers/gpu/drm/xe/xe_migrate.c    | 13 ++++++++++-
> > > >  drivers/gpu/drm/xe/xe_migrate.h    |  8 +++++++
> > > >  3 files changed, 52 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 453af51fe87b..1d6ac7a6563b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -36,8 +36,10 @@
> > > >  #include "xe_lrc.h"
> > > >  #include "xe_macros.h"
> > > >  #include "xe_map.h"
> > > > +#include "xe_migrate.h"
> > > >  #include "xe_mocs.h"
> > > >  #include "xe_pm.h"
> > > > +#include "xe_pt.h"
> > > >  #include "xe_ring_ops_types.h"
> > > >  #include "xe_sched_job.h"
> > > >  #include "xe_sleep.h"
> > > > @@ -1183,6 +1185,20 @@ static void submit_exec_queue(struct
> > > > xe_exec_queue *q, struct xe_sched_job *job)
> > > >         }
> > > >  }
> > > >  
> > > > +static bool is_pt_job(struct xe_sched_job *job)
> > > > +{
> > > > +       return job->is_pt_job;
> > > > +}
> > > > +
> > > > +static void run_pt_job(struct xe_sched_job *job)
> > > > +{
> > > > +       xe_migrate_update_pgtables_cpu_execute(job-
> > > > >pt_update[0].vm,
> > > > +                                              job-
> > > > > pt_update[0].tile,
> > > > +                                              job-
> > > > >pt_update[0].ops,
> > > > +                                              job-
> > > > > pt_update[0].pt_job_ops->ops,
> > > > +                                              job-
> > > > > pt_update[0].pt_job_ops->current_op);
> > > > +}
> > > > +
> > > >  static struct dma_fence *
> > > >  guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > > >  {
> > > > @@ -1210,14 +1226,25 @@ guc_exec_queue_run_job(struct
> > > > drm_sched_job
> > > > *drm_job)
> > > >                                 register_exec_queue(primary,
> > > > GUC_CONTEXT_NORMAL);
> > > >                 }
> > > >  
> > > > -               if (!exec_queue_registered(q))
> > > > -                       register_exec_queue(q,
> > > > GUC_CONTEXT_NORMAL);
> > > > -               if (!job->restore_replay)
> > > > -                       q->ring_ops->emit_job(job);
> > > > -               submit_exec_queue(q, job);
> > > > +               if (is_pt_job(job)) {
> > > > +                       xe_gt_assert(guc_to_gt(guc),
> > > > !exec_queue_registered(q));
> > > > +                       run_pt_job(job);
> > > > +               } else {
> > > > +                       if (!exec_queue_registered(q))
> > > > +                               register_exec_queue(q,
> > > > GUC_CONTEXT_NORMAL);
> > > > +                       if (!job->restore_replay)
> > > > +                               q->ring_ops->emit_job(job);
> > > > +                       submit_exec_queue(q, job);
> > > > +               }
> > > >                 job->restore_replay = false;
> > > >         }
> > > >  
> > > > +       if (is_pt_job(job)) {
> > > > +               xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> > > > +               dma_fence_put(job->fence);      /* Drop ref from
> > > > xe_sched_job_arm */
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > >  run_job_out:
> > > >  
> > > >         return job->fence;
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index cd6802642ef3..e9b9dfe19e48 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -1715,7 +1715,18 @@ struct migrate_test_params {
> > > >         container_of(_priv, struct migrate_test_params, base)
> > > >  #endif
> > > >  
> > > > -static void
> > > > +/**
> > > > + * xe_migrate_update_pgtables_cpu_execute() - Update a VM's PTEs
> > > > via
> > > > the CPU
> > > > + * @vm: The VM being updated
> > > > + * @tile: The tile being updated
> > > > + * @ops: The migrate PT update ops
> > > > + * @pt_ops: The VM PT update ops
> > > > + * @num_ops: The number of The VM PT update ops
> > > > + *
> > > > + * Execute the VM PT update ops array which results in a VM's
> > > > PTEs
> > > > being updated
> > > > + * via the CPU.
> > > > + */
> > > > +void
> > > >  xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct
> > > > xe_tile *tile,
> > > >                                        const struct
> > > > xe_migrate_pt_update_ops *ops,
> > > >                                        struct
> > > > xe_vm_pgtable_update_op
> > > > *pt_op,
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > index c3c0740f908d..30c9c990a8b1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > @@ -24,6 +24,7 @@ struct xe_pt;
> > > >  struct xe_tile;
> > > >  struct xe_vm;
> > > >  struct xe_vm_pgtable_update;
> > > > +struct xe_vm_pgtable_update_op;
> > > >  struct xe_vma;
> > > >  
> > > >  enum xe_sriov_vf_ccs_rw_ctxs;
> > > > @@ -157,6 +158,13 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >  
> > > >  struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> > > >  
> > > > +
> > > > +void
> > > > +xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct
> > > > xe_tile *tile,
> > > > +                                      const struct
> > > > xe_migrate_pt_update_ops *ops,
> > > > +                                      struct
> > > > xe_vm_pgtable_update_op
> > > > *pt_op,
> > > > +                                      int num_ops);
> > > > +
> > > >  struct dma_fence *
> > > >  xe_migrate_update_pgtables(struct xe_migrate *m,
> > > >                            struct xe_migrate_pt_update
> > > > *pt_update);
> > > 
> 
