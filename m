Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC70CA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 18:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EB410EAC2;
	Fri,  9 Oct 2026 18:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3b6CGqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D8010EAC2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791570156; x=1823106156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MIAp2Eba9J4mtxgS6AQPobFaPi4lQVv4uYc3fv9anRM=;
 b=H3b6CGqkmSho5LnGV11YUP4b1YcBZuRVeDIHzk1/nSIw4I07d+FiP3Ns
 wfnSFbWhBKQ0DbOVm/uX7vLkI0XEp0RJeyj2NcjEDbenuk1gSKJPpDmc4
 Im0JuCjErPyiQwhLhThzSSENaY3VBrDywXk9+WkbG+ssQhOKLID5nqfKR
 45/ylxJBa23qBC9sCELmA4Z00vHNHeW46yKYiJG2oH2c4tgpdHAwymN6r
 vUvpgkwaaTYVnbW8Zww6mVeiSzVXhvqyuHaklSjV7ntYt3KvO5vUD7/b3
 flEhux8wcLKqEoLYVdBGJU9C2zog2NEjiebdBlYHlYENQ+0lk3pV3a/IH A==;
X-CSE-ConnectionGUID: 0SC+PyadTjuuhxHNEBVbYw==
X-CSE-MsgGUID: H4dsyUiQTVi1Axbe8Qkcxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="389011"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="389011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 11:22:36 -0700
X-CSE-ConnectionGUID: u7CQsP8XSQqfFTyWHzfuDA==
X-CSE-MsgGUID: ZrCb0hgyS32GA6TkE7OdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="300841"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 11:22:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 11:22:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 11:22:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 11:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZLhruNOF+yerEsFpvlrykIWxi0W1Vvd/X2e0lPv1ALDs5t5ASDIq96fwEiSNq1p0+U8QfL6QImmmEPVbtICAHItyRurjoBRKc19I0830YKdfxDa2RLBlF0AHl3K8UW1FCVwH6icHVsmgqPMikWyXjj57KvuRv1xov1hCBftdheL0sCsRCnnWhLIVyNf5cUbITCy18fBx9JDx94w1enFn65itwSyXlsmT1h8ZA3VvfUEX+8FeF5cpLtS7bCt/y95c3V2ODN5y2xJ1lS6aZlU6ixP+cA3sKPIMMNl3fuGrzdlX56CXRxtRwuDa/CDcHe+8950EE5XLxcoiiMXiazH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QMTGVWPA9uyv0jOSSPkjeTigwyo7H9twcj1uuyhqSI=;
 b=wYK5AJuhFk7qi7H6BEX+1uyutNmh06SNTrcwRFovIxwDsae2N6nsfPa/nY9qS3Xf3FBNm0ZG0npGIF0rAQTde3FLlZCkXQrl266MnLOw6RRCvc2VlC38vPs7OkMpglEwzxE3YEzUseHA0PCYUbuLZ4F0p8bO8jg9F2IpQPuHLyRck2Ea1lHaneyfYVdwwYV0XhoLmfjDoPCXea6dhHTFChCcNh6qAuEECgwea1ENuktzk01V2uxzmI4H3IJqUvRbMMMGMy31q4hL2zOxFw1KewazcHxqW4g+IPtX1eguH+C+vNayk+BDO72iDjtHhebVKhth5py6GxuLKzmKPH3gSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 18:22:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Fri, 9 Oct 2026
 18:22:26 +0000
Date: Fri, 9 Oct 2026 11:22:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2] drm/xe/sysctrl: Add mailbox control state to error
 messages
Message-ID: <askw3y5OdyAvYC/Y@soc-5CG1426VCC.clients.intel.com>
References: <20261009064754.3927132-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261009064754.3927132-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: e96f9b1d-8c2d-46f2-e75f-08df26324527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: +3IQVaa6i5SZyQZOssFXJj831gh69KI50zMchrI9jOtpW8GTpQxlKfhz4VA+8zqGQ6pW0u7LHq/JBCTE3inPQUq86s85+dGpdRl92SNaLYzVjgOFw/YP1IBvabKAgds3m9ztkqKGFXOzDGG9n1IaEM6rN94QF1XUw7++EFWgchQsKe7J4XCW3xjPH6sP2YYRdgoAVxtJPG67PPCzEDgZ36Joh2A2tWMKxQ2X2ivAc4249NqGXGkfazxpO7iwCc8vOZvVg3PeR1kTLeQFezc6fLnQGbwVwDopE3gOWMrUKZbyWt2MWTCmHOY2zRjLQ85eHatCTDYoe017vVJvShaAaeqfPpjPd2GoshZaqeVAXn4g9MyMZsaH9RxScxqroTdV1QqDEz2CKQ5HpkoK4ZZKhCWSSPeoH5TSuLbViPL9MzS3G7Aj07Ak0w/WWPqdjLyemzGZJVhNSRZoA3qcUa0VF1b7uzPP/4YQOmt1JhfoJBTxRRM2fsBRmfPHQz8hZLLGdK/v0YgYDsM9X78cCBY73NXhWicsWLO1aSc2kt5SDff59/KckE4+GQmRo6lLMBDxCccsnkLeNx6NaxhxGsatEPFZ+kN6iT6mN6BMxRkLXLztIbxDfpIbhhcjf0WPIQ2k0cogC+FnVc1yrzL2eBWVwCVPqk58Y10797wDPsbl+fE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blE1TmxWT2d0WXNTT3lFMDJiSTl6VTZ1dXVVbWhLZUk1SUcxL1JSQ3RNNEs1?=
 =?utf-8?B?NzgzODFHNnJBT0NCV2FYK2FCMzh5WDRHQjlucGx4dUlqUm9YR0JISUplVENj?=
 =?utf-8?B?eGVCeC95SjN1U2RTaHlKZDBaUFhFS2F4Y3IwZXNXVEJaUlZVRDJXN3U5R3lj?=
 =?utf-8?B?QnhFQmFYYjlhZWEvOVdnKy92dXNMb29WN2hBU0pZYjhvUVFzNnBVdmVWSmxo?=
 =?utf-8?B?ZnJZQ1ZsdU90NXVwNmRZQmlSOE4rUlpzWk9NUXZCalJ1WkVpaUZPcGowKzdO?=
 =?utf-8?B?OE83dmFpNFMwZWNGdEljdUZaOEIyZ1U1bkJSK09WWEN6dE9LQy92R2UzNzNW?=
 =?utf-8?B?bzU2bmEva0czS0k5Q0grSXp2dU1uWm55ZTBxTnVCRlBSSWliaEZ4N0FHempO?=
 =?utf-8?B?eXhralVnYmhQWmpoM1hhb3VzWGdUTzMzNjA5Qk1GVUlLaThUQXhFYnV3K2Uy?=
 =?utf-8?B?bjRaQUJINjFjdFlRNjJ0djRIaDNOZmw3TUdVVUlBSmJDV3Q4UnBra281NFpL?=
 =?utf-8?B?YkpFa3dFemp1L3B6b0t3Z1RteTc0MERtb2hiODlRRG5ROWVRK2ltZ21uRlBW?=
 =?utf-8?B?REpiZ2dGQnVBZERmYlhQLythTUhxVXd1OWJiSXpHM1hmb3pRTU1LNHprRUZW?=
 =?utf-8?B?ZE9ZMC9tWDk3WThwRHI3R2Zka2RhbXVIaHdyWkN0ZTdTRFlsVFZnNlBKTU1o?=
 =?utf-8?B?cmR5bDVJMS9MZk9RTkVYLzd3ZEYzT0NxelFwUFMvMzErY3dOdFdOY1pVNS9X?=
 =?utf-8?B?R3ROMWxoK3UrZEVEdGJ6YVc3d3FwVmJtbGYyVE5vMXBQK2g5VjUrSERBakE1?=
 =?utf-8?B?ekZubllqY1IvaGtnKytKUjZQM2FjbGw2VXF0QmZQaitrS1J6aFJjWVBtdHpN?=
 =?utf-8?B?RGhBTzR6eitwZTlyNHhWMTBDL2ZnQ2VsRjJNZ0lHYWtNNG9iMTRXSmkxZmY4?=
 =?utf-8?B?NHBwRkVHN1c5eFVMc0t4YS9PQVhjOHBrWC9zVXZHVS9JaUlWY0tLWWZsWjRQ?=
 =?utf-8?B?cEhmaldCUzFYZmxSRW9FTHV5Z2lWc1Z0M3p3b1NZTnV0VmtFbUd0OUIxTGZl?=
 =?utf-8?B?ZUw1Y1I0eDVKR3pwTFp3WUxQSk95dVlyWHIxUFhraWJtNGNFdTdiNkVNK0U5?=
 =?utf-8?B?VzFPN2ErMWRDVU11aHFYZU02Q0tkaXI3UHc1THpCaE5sWlRmd3FuQ0FWWkVq?=
 =?utf-8?B?MmlpQUlBS29FM2dwMll3T2lnbmtOR2dRZi9BdGRLNHJGelp3cFhqdk5HVk1Q?=
 =?utf-8?B?SUdPc1EzSmdocVhKWS9WN1E3ZEFTSHZmaWlTdWd2UCtPN0NBbXY1UUhJM014?=
 =?utf-8?B?Nm5zb3hNa01SblpjZ1dpdk5QNmdFRXYxUm5aQVBWWXpTYytWSldKem5nNFhR?=
 =?utf-8?B?dFdBNExLY2E2Y3hINFB4c3ZwWW03WC83aFJPNFNVUkFLUXlVTUJneXpkaXRO?=
 =?utf-8?B?WHJhbnBZQmptSGtUcS8ybmxWTUsxYTV5bzZjaUk2Y1pDN0s0TFhjMmVVOFdF?=
 =?utf-8?B?UjJNc2hjRDZySDd1NFF0QU1QYThXYkdEajJZYStoS0VpUU1MQ21iS0thaUQ4?=
 =?utf-8?B?VlpsTWZLNUlOUUEwVm1Qd241eUs2Q3A3NVA1RWw2WFBuVk9HaDBkcWdUQUpz?=
 =?utf-8?B?dTJJU1AxQ3hGTVc5QTNqN1lRTFlXdDJNbHZFSGhPU0MwdjMrUGdDMFRTc2E1?=
 =?utf-8?B?M3FPT2NOZzVDK0ZqMEptNjZmSzhZd1lIU25PYTN2VHd1LzZlZ2Vubk9IY09P?=
 =?utf-8?B?Ump2a3dWNXZFbElLb1RwbHRCVzIzTHdYR0xxeDVjUU9PTktSYWtVMStnbTJO?=
 =?utf-8?B?NlFjTFY4WFhubW00K0p0cXo2cUlUdHhybEs2VkEvUEM2S0tuZFpzeEhpT3c2?=
 =?utf-8?B?YzJHWVFnY3krYitXR2R5QVlZR0dSSXRYeS9XZTFqT0tTN0FnemNxK3gzNDI4?=
 =?utf-8?B?RXpNdk9HejlwVUdUd04yV0lUTUQ1TjVBMjNmSFdDRmNZUUpwVWh0U1dOR2Jh?=
 =?utf-8?B?Tlo3V1JDVURHVGo4UHpRNW9iK2loYUljS2xOY1QvbkhLUEs4dFhZWHFCU3Mz?=
 =?utf-8?B?dlV2dXFoVldya2k4dmxtdzZYZ0xsYWFDSE9MUGhXeGZTQXJrMmVmNzhwYjFV?=
 =?utf-8?B?YmUzd3BqSnE4Um5LQUhzRUJIUVZmUk5TcmJ0SE9BZHkyOFdKeHJBNnJaMyt6?=
 =?utf-8?B?TWpQbkl3QmR3aW5nOE9YMVNuL2EwTG5DeGUxK3A1QmNTQ2lFMzdiQkRXbjhk?=
 =?utf-8?B?ODZXd0JMOUEwYnZoZ3hnbFBLUThHUUNGLyt0bWNPMEVvZHJiYnZUNStVK1lV?=
 =?utf-8?B?ZVJ2RGZidzFkSmttZVhBZVAwalIzVDNTVERLRjBnWU1nTTZGU1YrUG1WK2dY?=
 =?utf-8?Q?nPTBKYOveikiN7BU=3D?=
X-Exchange-RoutingPolicyChecked: QV6jvhqU3+y+7EouOhzAtXLfPSm/7dz3mnm/oJhJKoRxxcHGQ7pHd/JyYKby0t42YK8QswRkCEa8kfl8LJ+94jGcEocPYBWGRoNX06TYfjMcs4JFDZUwUyfReunIawJDo8YmUfcfY9EwhH/q3ODJ0t5TBgN8moHarpUxlm/Es2a5HwJqFUFC/QmjeBR6qiR1Y5Mf5Y89uvvmn62wDNN04o8efCslBjQKgYhuF4xnSiSjwu0y8lLyZb4zmtETQ65cD6J+shJUhvLsbFfjumKu7fnzHOp81etDnedZVCVy0fme7uvzbmeByyIOBbmad2eAgSIn2nb8gV+gqYfHh6Hc0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e96f9b1d-8c2d-46f2-e75f-08df26324527
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:22:26.3624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtFK0DhnsdmiViLcITinC3bHOJXWOohP6Q1GRrYnYkvTvLyVz8rIxEidOS+r6RZtHQ8pWD/oqKDXNkG+A5EtneKUKxiwMKpkyju/qVfdDVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
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

On Thu, Oct 08, 2026 at 11:47:55PM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Include decoded mailbox control register information in mailbox
>busy, timeout and firmware error paths to provide additional
>context for failure debugging
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
>v2 (Umesh):
> - Remove redundant casts
> - Align log/format string style
> - Drop duplicate frame number in frame-ack timeout message
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 56 ++++++++++++++++++-------
> 1 file changed, 41 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index 25425e8bb533..f1a231dfec1e 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -7,6 +7,7 @@
> #include <linux/cleanup.h>
> #include <linux/minmax.h>
> #include <linux/slab.h>
>+#include <linux/sprintf.h>
> #include <linux/string.h>
>
> #include "regs/xe_sysctrl_regs.h"
>@@ -36,17 +37,27 @@ struct xe_sysctrl_mailbox_msg_hdr {
> 	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>
> static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>-				  unsigned int timeout_ms)
>+				  unsigned int timeout_ms, u32 *out_val)
> {
> 	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>-				  timeout_ms * 1000, NULL, false);
>+				  timeout_ms * 1000, out_val, false);
> }
>
> static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>-				unsigned int timeout_ms)
>+				unsigned int timeout_ms, u32 *out_val)
> {
> 	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>-			      timeout_ms * 1000, NULL, false);
>+			      timeout_ms * 1000, out_val, false);
>+}
>+
>+static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
>+{
>+	scnprintf(buf, size, "frame=%u/%u busy=%d resp=%d ctrl=%#010x",
>+		  REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
>+		  REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
>+		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
>+		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
>+		  ctrl_reg);
> }
>
> static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>@@ -128,17 +139,23 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 			       const u8 *mbox_cmd,
> 			       size_t cmd_size, unsigned int timeout_ms)
> {
>+	const struct xe_sysctrl_mailbox_msg_hdr *hdr =
>+		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
> 	struct xe_device *xe = sc_to_xe(sc);
> 	u32 ctrl_reg, total_frames, frame;
> 	size_t bytes_sent, frame_size;
>+	char ctrl_desc[48];
> 	bool phase;
> 	int ret;
>
> 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>
>-	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>+	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
> 	if (ret) {
>-		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>+		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy %#x.%#x %s\n",
>+			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
>+			   ctrl_desc);
> 		return ret;
> 	}
>
>@@ -159,9 +176,12 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>
> 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>
>-		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>+		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
> 		if (ret) {
>-			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>+			sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>+			xe_log_err(xe, SYSCTRL, ret, "Frame acknowledgment timeout %#x.%#x %s\n",
>+				   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
>+				   ctrl_desc);
> 			return ret;
> 		}
>
>@@ -171,17 +191,22 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 	return 0;
> }
>
>-static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>-				 size_t frame_size, unsigned int timeout_ms,
>+static int sysctrl_process_frame(struct xe_sysctrl *sc,
>+				 const struct xe_sysctrl_mailbox_msg_hdr *req,
>+				 void *out, size_t frame_size, unsigned int timeout_ms,
> 				 bool *done)
> {
> 	u32 curr_frame, total_frames, ctrl_reg;
> 	struct xe_device *xe = sc_to_xe(sc);
>+	char ctrl_desc[48];
> 	int ret;
>
>-	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
>+	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms, &ctrl_reg);
> 	if (ret) {
>-		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");
>+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>+		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout %#x.%#x %s\n",
>+			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req),
>+			   ctrl_desc);
> 		return ret;
> 	}
>
>@@ -219,7 +244,7 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> 	while (!done && remain) {
> 		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
>
>-		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
>+		ret = sysctrl_process_frame(sc, req, out, frame_size, timeout_ms,
> 					    &done);
> 		if (ret)
> 			return ret;
>@@ -240,8 +265,9 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> 	}
>
> 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>-		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
>-			   XE_SYSCTRL_HDR_RESULT(hdr));
>+		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
>+			   XE_SYSCTRL_HDR_RESULT(hdr),
>+			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
> 		return -EIO;
> 	}
>
>-- 
>2.43.0
>
