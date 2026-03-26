Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA17F10A88EC
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7919E10E9AC;
	Thu, 26 Mar 2026 17:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hkk7VIj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C841B10E034
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774546650; x=1806082650;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c/71VjEUnaC92RFNwgDe7L4Pu1o5s8WHL4nZji06we4=;
 b=Hkk7VIj0oM89wzbJqH98rDlxpwWuvTIpGprUYW7uaAvQXLiNOPPVGOj/
 mD++y8Sr5Bb8SvX65ilimpX+Lc5TvK6YI3FYYBP4BewQcUYeqRp60ZP7F
 iQ4KrCn3JwRWm4WJWom720HIlpDY4fWz5EzeD01drz3ol2dVb05F/sW8W
 tru32kUDXrSO+9E0GKToOuP4z8pFHWS+E2GoTHxYkG3nKAsUtNlUf4ke0
 vYYA6wiR52wBQJVi5kcYHasXg6RO3ROaoCQ2WhuPNWQEvJQ9iBNXbaupT
 cuqIljx6zZfGeLQczHOb5mGLIuk3KQqiRj52U8zHxYKnpBCHWtlr22ZGM Q==;
X-CSE-ConnectionGUID: QdJqEPu1TSa8DW6+/OSTIw==
X-CSE-MsgGUID: v6FEF4fXRoaha3un3IRGog==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74644354"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="74644354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:37:29 -0700
X-CSE-ConnectionGUID: vGny5/iETKKdJHdrO62CbQ==
X-CSE-MsgGUID: NyVPp/hxRCCZYlaqbU7V7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="218470659"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:37:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:37:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 10:37:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:37:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLf4QKmXukcsNPs9o7lvEmYo4OhyV6plBDDqX0c7BzDd5CLAngwDnLCHc7XBXpaScwv+EXFciGtNOOKR/E4bLDdSVM3VhJViYCed7j3TOp+WhZJZAPuIUGCElOtmZ3tgJXY19MgyIDRJiDqhchDLTkrdRSZ+d3y/qQUmZHWu3xo18zSdppBpSb7DWtAfXTti05pPjzt1WTs6ZNImv62AI0bg1Pk6nrpgVrkOd+2GvMkj1DT5BPP9+cm+RHRqVPM3bhCGlQZPlq5z2v4yEV/83YQHZurt320t39E1jpXKTIseqd380pBV3cxZdUu9BBSAJ+lG+Lb3k3FJEOhXzt24ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdxnG2T2H+JuMkraXytqqr+qarIrAS3o1HsGI3EO+fE=;
 b=M1ToxrbiSxQbi1Oe2ha4Bm6v0Y+NZV3T93ucYdWHrhryfZXsxcBWm8VsDyf7CPneDBgdQALcyDYUYWoPrC6mtV5H/ub5rvu8PHVr03k0WUZLYwTn4leYwKGiRXvNzCpIrfsvG84XRbXe1D//aGpa/oTvq8rXO3r541XxgRqncAN+ZaUwCI+h0JThkmmKi9RUgP4LI4TNaey4wHxTz94OAlZWXtgz6welfZ84XrfdQxHZUK07iRdAaGAzMg7hrYQWiVdvre68bnFqXj6jDMY4ma5PHKEjEk0C9BdMj/iedHrc6r6UvnCgo9r582su8Eq7/+v5JK2m++6OibW4jJuu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 26 Mar
 2026 17:37:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 17:37:21 +0000
Date: Thu, 26 Mar 2026 10:37:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v12 5/7] drm/xe/xe_sysctrl: Add System Controller mailbox
 communication support
Message-ID: <acVuzoTF77ZUtmPg@soc-5CG1426VCC.clients.intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-14-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325120030.510480-14-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d552da-7619-49d6-a5b6-08de8b5e5575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3NcRkE440xt7QL5mBP3DeiAZ+sj/6EO3Uy9UduwkKP6qPAvMWranWiP1IrLKIW2fFaOK99lieL28cl7L1He2Kc1GQASQIxW0s30o2wmVGZgG6e80K98xPaB5Gjg7MlKrPd/wGtn3Na1ZnMit8cSk5O5AkN7W3ahCgOeLACbyVwkpZtbPtoABIUrvhe+OJ+jAdyS+qvUDGgzgi1nzSLo1DYHg5eNrZUu1n8l9KW/G4efkhKhQKSeqhOtdMx2D3HUeExgA46J+KK9jm08fhyRlBDTJGM1+KFdEndAeVbbj6qtdjP9i2JJ2xv8fBIKKff6NS5C0wVOBUI5EEo71jzlYaTIICOchi3s5BpFK/xYP2hzh4ZjDPryZfFd0mNRIBbgKBRFx1tpB8PXgIV9RP7o96nAgRsLHXP4otZH4SFO59/W8Ibzp+Hd3PwQrLZTomEzx9oci+JQD6/KVQklCWbq7EYRqEttyA/eG9yhG7+82PghrUCposUjmByhvdQ1g4cEGcIMT5cl5Zh9XxgZjd2YiVQ6F25MN4VsmmQkwTJUsJVQWzJ5kVcdwP28D8lfLsWZ9amG9CWQr7xbcOHTOfTP/TbI0Fza5j3El8hnAan2qYaS+X5Qi/cY3t47KxxZ3ngowcpG8ThJAP4qsg5Rw1AvW8jng38DIoLqXAYEUUBZ8NmIa9m+704j0039MkRgAdmbzG6wXY4CcNogLDeMGMp6B/D6DdqrlmIuGiqqotQJyWHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFB4SStvbFZIQW9QSU9ZYjZjc2p3ckREWTEveklNdTBCNjJSRzFQMkNURThL?=
 =?utf-8?B?MUVsMFVoN3pJMHVINVZFL1IyQkMvdThZams3RHZuK2pwcXhXamZmcWJDSm5M?=
 =?utf-8?B?a1lBaWhZc25ObHlTRkw2djRUVVNmbVVXaWtlK1VwRGdjZkdKMlNienhKTlh6?=
 =?utf-8?B?QzVUM1VnVVAzOEFvbDdXLzJ6eXVYTWFzT2pUbmZPYnkra0E2VXYyakFGVWxm?=
 =?utf-8?B?OTE5L0JtSmtsSGxIQlZ2N05jQkRjYUcrb1huMnRMTk1RcDcySlVrR1ZoVW5O?=
 =?utf-8?B?UElxVUh0T09rU3dPZUVqamcrMXZMUS9tOTY1bUpTWkQveFJEaHpnMVBmNWJP?=
 =?utf-8?B?cnZOK2lJZzRPSk1uK255NmZLeWJCU1hqMW51Z3BSNVZ3QTExYTRvZzFQbzMw?=
 =?utf-8?B?cFFSY2JPeXJoUzFyVVVzYkRGMkdqM3FNVWNMZnEyRWtGQVdiQk44WmZ3MEE3?=
 =?utf-8?B?bWMxc3hHVXM3cGRsQmdWZjBZc1dmbWdzUWJkZjRwTmJUaVZucGx3UlFnYjBh?=
 =?utf-8?B?NitaRjUvc2h1TVZhN2l0SHJpUGdJdnNmUkFnYnpBNm9NWXJTek44ZjFVL292?=
 =?utf-8?B?L0ExOGFUZW03QzhsWldQVW1lNEdaaFVsdVkzYnFaRE5lVnZ4Yk53aUpJS0hU?=
 =?utf-8?B?UHovQ0FkMEdsL1BZdmNIaWpZdncyRGRYdG9KRlc3MndpM2JTVmZmNjlKR3V6?=
 =?utf-8?B?bjJqbzJrYmVHL21Yb1JmcjdUVENkUE4rNEhsTVQyUjhOSVlaR2hxWEJFRHE3?=
 =?utf-8?B?SFBDTWlwdURzZ2oxL0NXUWZWd1ZtM2p6NDRjYjg5b2tBenFpMVNBODJ3YTNC?=
 =?utf-8?B?aGhNWmRRNmdyZDdRd05jR01JOE9TUktqWjBMU1NlS2laTVlhZ0JSTUphS0Ni?=
 =?utf-8?B?dm5DNEg1VkZpcW5hRU55RWZ1TlVFd2NvS0Jwb0xESnE5aEYrclU5d2RUKzFM?=
 =?utf-8?B?RGp3SVQranMrVnJpT2JtSXlJcVBIcXdJL1lYSzJhbE8rRmNYQW1RWFkvVCs3?=
 =?utf-8?B?NlVKV3oyK0FZckhpYlhNTjNsNE16SDdjVTJlOE55TGhJY1NocG9yeXpVZzh1?=
 =?utf-8?B?SDVCOVFUazdJWHRsRzJEYW1VNG9NN3pjTWFJMzhwdmdCSDNJWWt3QUxUZmw2?=
 =?utf-8?B?aXV4eWhmTGZaWHZ3NXkyRFdQZWNRcGowODV2NzY5Q0d6NUVIVk4yOXN2aTg4?=
 =?utf-8?B?VzFuUzlIZzVuNmFaeXJFVXdGSVhTYUpqTU9pbUZGTDBlYS9CUFZhSE1BSlli?=
 =?utf-8?B?dXNmL2s5bHZlQUlzRGpnNlYvS0dJUHppN1FDcENNSXVhZ2xjcGdCUm9iRVcv?=
 =?utf-8?B?TjhKM3NpTEF3bkd0WHBkdHJjeDJ5RnFHbkN4UEE3cEJpQkZ1aWtZa2luUC8x?=
 =?utf-8?B?RWJoVXcwM3FHbjdtR2Fsc3p4NWxYMi9yN3AvdHQySU8xZHF1L2lrZWhYKzRQ?=
 =?utf-8?B?ZWdQK1NEVzhSMzlwRVdWMzlLZDhpTjhWbnVYZDdBa016c090OVd0U0pMczJZ?=
 =?utf-8?B?QW9QeXdLTXpudDYzZ0tQZHFCbW5CSnZiYUFGYlBqb3djV0tOZy9hWEh3T2N0?=
 =?utf-8?B?VW5IaDBYNTNpZVBpWEdacTZjMXRFbUhPTlRzS0N5Ny9meTcyT0RRZlpFVkRs?=
 =?utf-8?B?RGtUS1lhcW5Ca3gwUzVLc29qYkc3b3NtV0I4ZG43SkxFSkhBaHZnQURqcVJF?=
 =?utf-8?B?bEZ1Y2ozdjljeVB2azRiaGh3YmlJc0I5VExvM1QyeVd4OFBnd3M5K24rTGZ0?=
 =?utf-8?B?NVFQdy9WOTRjdlgxMG1jdDI5M3Z4aUpHVFV5RmU0bDdrQUdVOGxkM3VUckZt?=
 =?utf-8?B?Wll0TEZadkpPVGVzK0laTmdRN1p4Vmt3eUMrSnVOaUZvdzljc1dGQlNjbHc4?=
 =?utf-8?B?am1CUXJjeXloSTdLalljVkVPVzJyOUI3L2lMbUR2UUF5UU5xSzE3WXhrNEN4?=
 =?utf-8?B?MDYvWGdDbXM3S3d4emlJN3RxZnJIcDQybEo3WFlDeGNub0RpY0QzNHc5Mk81?=
 =?utf-8?B?cmppNXBEUktMMkc0WkdZNnJ5VjRIVDRmS1Y3S1grVGVyeWowS0xWR3UzcHpk?=
 =?utf-8?B?TWgxTnIyQlJaOUZYM1pPeVo5ZU9wWGZJKzdWVlJ0NWlYcVJUQWplV1RYZHQx?=
 =?utf-8?B?Um9oZEl6dTZHK3pvclRVSUs3S3ljT1NCMVFGeVRrdEd5MkdrbHBRWXlMa2RE?=
 =?utf-8?B?aDNSYjBkVFBTdmViS1NlcGdRM0hIdU8ySjV2bjNkcXZTSjArd0lDZHFYeEw0?=
 =?utf-8?B?NE1ZOURmWDIzdVUwWVBmYjQralpiTURpMVM1Z21zVkxQSDJlTWkrWGg0QWI0?=
 =?utf-8?B?aGdKNlk0QjF0TlYzaVdoYTlzd3Z0NWJaSms1L3BrbzZFcGtySnZ4c2p1L1lr?=
 =?utf-8?Q?jrJoCUkoq6/Cok3Brbv//EQY037Btf3qnzlhp?=
X-Exchange-RoutingPolicyChecked: IqmCOs04+vfZrLgIztW+zYbg6R4upJ6izNT4/Jm1OhQ3LVh8Cyy77hnBFL+o9N9LmZQRN8EtSs7G7jb0Orl2uHj4XCavxqoEwrfXikeoMaJaxFzYkno1TVcpl4ZAxlDSRKn1jPP/F5sDaYGSeSYhiCL1s2Q05B90mSMZEPzCtLcLhvcEav86uljL7yTZBAVVS0WuT6RaPZX2O0mBwwIbuU/Y3xv8zpOjeUtksjd97yfqhV9dkDPG9N87ZzCXyP8Jui6b5WkuEdMxYquaGHa7kcrjvGoKtF3dVZlFOq/wwSVtt68zLWWC1pFImgaveU7nL9HHsH6E1HJ+BHHxtuna4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d552da-7619-49d6-a5b6-08de8b5e5575
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:37:21.2864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcVidys0kNKYGQYv4EPTd9BM8pE8y/931sPvsLzEOj1FL0cYnmIwJPs8vSuDPiWsKYt+snkURTcc3h9vZJjZDrc/D37j5INVwSqjbWoZn00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
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

On Wed, Mar 25, 2026 at 05:00:32AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add mailbox communication layer required for interacting with System
>Controller firmware, enabling command submission and response handling.
>
>This patch implements command/response handling logic, including error
>and timeout handling.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v4: (Matt, Mike)
>- Refactor MMIO access to use domain-specific accessor
>- Add input validation and buffer overflow protection
>- Add bounds checking for multi-frame operations
>- Fix potential NULL pointer dereference
>
>v5: (Umesh, Riana)
>- Reset phase bit to 0 on error conditions
>- Refactor mailbox receive path
>- Updated xe_err messages for consistency
>
>v6: (Matt)
>- Use SYSCTRL_MB_CTRL_MKHI_CMD macro instead of FIELD_PREP
>
>v8: (Matt, Michal)
>- Reordered patches for logical flow
>- Static functions renamed with short prefix
>- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
>- Added frame length validation and command overflow protection
>- Use REG_FIELD_PREP for hardware registers
>- Changed error format to %pe
>- Removed unnecessary NULL checks and explicit zeros
>- Fixed kernel-doc syntax
>
>v9: (Umesh, Badal)
>- Renamed MKHI to SCHI (System Controller Host Interface)
>- Fixed kernel-doc syntax
>
>v10: (Riana, Badal)
>- Removed SCHI terminology and aligned to sysctrl mailbox naming
>- Dropped redundant header includes and unused variable initialization
>- Updated runtime PM guarding in xe_sysctrl_send_command() to use
>  guard(xe_pm_runtime_noresume)
>---
> drivers/gpu/drm/xe/Makefile             |   1 +
> drivers/gpu/drm/xe/xe_sysctrl.c         |   2 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 369 ++++++++++++++++++++++++
> 3 files changed, 372 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index b2d44e7169dd..9dacb0579a7d 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -124,6 +124,7 @@ xe-y += xe_bb.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
> 	xe_sysctrl.o \
>+	xe_sysctrl_mailbox.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index fd23f345d8c7..84e3b70043a1 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -78,5 +78,7 @@ int xe_sysctrl_init(struct xe_device *xe)
> 	if (ret)
> 		return ret;
>
>+	xe_sysctrl_mailbox_init(sc);
>+
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..b10c8b7e0c40
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,369 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/cleanup.h>
>+#include <linux/minmax.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
>+
>+struct xe_sysctrl_mailbox_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+#define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_HDR_COMMAND(hdr) \
>+	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>+	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_HDR_RESULT(hdr) \
>+	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+
>+static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>+				   unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>+				 unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>+			       size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+	memcpy(val, frame, len);
>+
>+	for (i = 0; i < dw; i++)
>+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>+
>+	return 0;
>+}
>+
>+static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>+			      size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+	for (i = 0; i < dw; i++)
>+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>+
>+	memcpy(frame, val, len);
>+
>+	return 0;
>+}
>+
>+static void sysctrl_clear_response(struct xe_sysctrl *sc)
>+{
>+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>+}
>+
>+static int sysctrl_prepare_command(struct xe_device *xe,
>+				   u8 group_id, u8 command,
>+				   const void *data_in, size_t data_in_len,
>+				   u8 **mbox_cmd, size_t *cmd_size)
>+{
>+	struct xe_sysctrl_mailbox_msg_hdr *hdr;
>+	size_t size;
>+	u8 *buffer;
>+
>+	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>+
>+	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
>+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>+		return -EINVAL;
>+	}
>+
>+	size = sizeof(*hdr) + data_in_len;
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>+	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>+				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>+
>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
>+
>+	*mbox_cmd = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}
>+
>+static int sysctrl_send_frames(struct xe_sysctrl *sc,
>+			       const u8 *mbox_cmd,
>+			       size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			sc->phase_bit = 0;
>+			return -EIO;
>+		}
>+
>+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>+			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
>+			   REG_FIELD_PREP(SYSCTRL_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   SYSCTRL_MB_CTRL_CMD |
>+			   (sc->phase_bit ? SYSCTRL_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>+
>+		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			sc->phase_bit = 0;
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>+				 size_t frame_size, unsigned int timeout_ms,
>+				 bool *done)
>+{
>+	u32 curr_frame, total_frames, ctrl_reg;
>+	struct xe_device *xe = sc_to_xe(sc);
>+	int ret;
>+
>+	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>+	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>+
>+	ret = sysctrl_read_frame(sc, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	sysctrl_clear_response(sc);
>+
>+	if (curr_frame == total_frames)
>+		*done = true;
>+
>+	return 0;
>+}
>+
>+static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>+				  const struct xe_sysctrl_mailbox_msg_hdr *req,
>+				  void *data_out, size_t data_out_len,
>+				  size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_sysctrl_mailbox_msg_hdr *hdr;
>+	struct xe_device *xe = sc_to_xe(sc);
>+	size_t remain = sizeof(*hdr) + data_out_len;
>+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
>+	size_t frame_size;
>+	bool done = false;
>+	int ret = 0;
>+	u8 *out;
>+
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	out = buffer;
>+	while (!done && remain) {
>+		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
>+					    &done);
>+		if (ret)
>+			return ret;
>+
>+		remain -= frame_size;
>+		out += frame_size;
>+	}
>+
>+	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>+
>+	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>+	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>+	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>+		xe_err(xe, "sysctrl: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>+		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_HDR_RESULT(hdr));
>+		return -EIO;
>+	}
>+
>+	memcpy(data_out, hdr + 1, data_out_len);
>+	*rdata_len = out - buffer - sizeof(*hdr);
>+
>+	return 0;
>+}
>+
>+static int sysctrl_send_command(struct xe_sysctrl *sc,
>+				const u8 *mbox_cmd, size_t cmd_size,
>+				void *data_out, size_t data_out_len,
>+				size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_msg_hdr *hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = sysctrl_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out || !rdata_len)
>+		return 0;
>+
>+	hdr = (const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
>+
>+	ret = sysctrl_receive_frames(sc, hdr, data_out, data_out_len,
>+				     &received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	*rdata_len = received;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>+ * @sc: System controller structure
>+ *
>+ * Initialize system controller mailbox interface for communication.
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
>+}
>+
>+/**
>+ * xe_sysctrl_send_command() - Send mailbox command to System Controller
>+ * @sc: System Controller instance
>+ * @cmd: Command descriptor containing request header and payload buffers
>+ * @rdata_len: Pointer to store actual response data length
>+ *
>+ * Sends a mailbox command to System Controller firmware using
>+ * System Controller mailbox and waits for a response.
>+ *
>+ * Request payload is provided via @cmd->data_in and @cmd->data_in_len.
>+ * If a response is expected, @cmd->data_out must point to a buffer of
>+ * size @cmd->data_out_len supplied by caller.
>+ *
>+ * On success, @rdata_len is updated with number of valid response bytes
>+ * returned by firmware, bounded by @cmd->data_out_len.
>+ *
>+ * Return: 0 on success, or negative errno on failure.
>+ */
>+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u8 group_id, command_code;
>+	u8 *mbox_cmd = NULL;
>+	size_t cmd_size = 0;
>+	int ret;
>+
>+	guard(xe_pm_runtime_noresume)(xe);
>+
>+	xe_assert(xe, xe->info.has_sysctrl);

I would return an error to the caller if has_sysctrl is 0. The assert 
will just issue a warn and continue, but the rest of the code is not 
applicable if you have no sysctrl.

if (!xe->info.has_sysctrl)
	return -ENODEV;

Umesh

>+	xe_assert(xe, cmd->data_in || cmd->data_out);
>+	xe_assert(xe, !cmd->data_in || cmd->data_in_len);
>+	xe_assert(xe, !cmd->data_out || cmd->data_out_len);
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+
>+	might_sleep();
>+
>+	ret = sysctrl_prepare_command(xe, group_id, command_code,
>+				      cmd->data_in, cmd->data_in_len,
>+				      &mbox_cmd, &cmd_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
>+		return ret;
>+	}
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
>+				   cmd->data_out, cmd->data_out_len, rdata_len,
>+				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>+
>+	kfree(mbox_cmd);
>+
>+	return ret;
>+}
>-- 
>2.43.0
>
