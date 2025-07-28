Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E6BC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 08:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD2210E49A;
	Mon, 28 Jul 2025 08:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChpsK2u+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A1810E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753689892; x=1785225892;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r4SLZCQQDN2u8fuHAoYnjE5XsyDR5V9nyMQnNhpqVdM=;
 b=ChpsK2u+7O8Nb5ey8MBILOhzm/TRjZwYvqgtNRYiBL3czS6bG3ShQTam
 Q05htPc8U6yAZoXl7ANIVq0N+GZvln0CvUPli7jTK7ItoLX1ApWG0MMY7
 o2NLB38fmtrJDjmDF6z/uOrX5vWY0R2Lb5hKMxhtpEHdqBXRiCC0HMjsg
 UyrlOkCit75qB3BZoBcnSZaflbZVXXva7my+MSm/zgi8tn4aBepte2azM
 r9+eFXqqi8ftL3PyCMJfLiddsU9ab71wggwFRqic5duZYRq+8StJW3TXe
 KwgZbu2tHch80L66fi5z3Z9Aj8KC7zQfZN8zAjbACv/S6wWkj2lpsG1gS w==;
X-CSE-ConnectionGUID: LNBxX7w/T6ux5/sRBUPFiQ==
X-CSE-MsgGUID: JS0OSSBoR1iKemn3+s7Jpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59581225"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59581225"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:04:23 -0700
X-CSE-ConnectionGUID: kltIbARhSWGhrsUE7TIEvg==
X-CSE-MsgGUID: 8YFJed1gTzqT6Zk11awHug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161935801"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:04:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 01:04:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 01:04:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 01:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlXtKQa+Jq621YVBCJgjrvChV78p2j+0zC/oDFiyXipdqFOL6DbYRhE+GrkU2REmX7CC+XLnOpHbkvXv9NxXXO45KvqukmE4wyCVJkMzmcCM568lXP9QbIrdzAXNJFDK0K6BAcFOplAaArr71mJ1/WheLV4hIfmeDFa2nsamWmL2gE69AkLqbKGL3unwgPLa/FDuYWwHHTd0tbifZP36LLjCXSMy884m6MgKthbrjUwOGM17YuVob8xR8hJKvR5f1n0kiIgmz3jaOdVaWCraUYAUnyzXxlptY+l2msBCj64vDGt+l+tcxT13PK6T3DWFBkYo+0ij7/aMcqw4GPO4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv/bVBML51qMkn/K+vnMx9g3abvEvE5hcnNFgGofntk=;
 b=B38xbhWy0WKvxmJnYqiys090po8NtzUKc/PUe5H5hCSjwh3WWeyW9C4EvBlDTEgwt/HAzApoXoEgictbIc7kQAKROpgwwWaWLScJGvLCt5tmF9oItEpLrx8OpoVslPupoqaTRH0CPDivEx++esT6kP0wKqYObC4QrgL3xY58ABkPNcgvhte6gtXNo7LbXoVg9OqdD6uCMCObbq2yFzuJ9wczNiiQ3DRUPjDP+tJt86FzELg+yWvQxmFkLX848f5WQOGxzwsVWddEMSQ6I0DWY4n7H1CRf1LgaDcvR70DsNMNQH9jgTOpCOVJDLhmAckq+lnjX4ih+cflB4YtjdGjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 08:04:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.8964.024; Mon, 28 Jul 2025
 08:04:14 +0000
Date: Mon, 28 Jul 2025 01:06:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Message-ID: <aIcvagn7O+XA7BFX@lstrano-desk.jf.intel.com>
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
 <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
 <20250728075154.7wbin3ed5gtqctmm@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728075154.7wbin3ed5gtqctmm@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 28faa8f2-4ebe-48ff-ec63-08ddcdad579d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVVyNXNRdlVUOTBnUFV6aVVrdkNjSm5qWnM5clg3YW9KTGdZVVVEbkJ6MEtN?=
 =?utf-8?B?MUwwcnBqQkxyWEJXNHR3ak53U0JpTlhzSmhXM21nWWNEbGxkUm5xaVRWOGVK?=
 =?utf-8?B?L0NWRzBsTmhWNXMwVDExdEwxNnhKSTJSWW1oZFdWWXRHV21zOXRtWHQ5NjVB?=
 =?utf-8?B?amFBSWxrelNkM0xaeUM1MWl1R0JKbmNkUnkzeENwOG9rWEVkMGx1bEcyalBr?=
 =?utf-8?B?OVpHRFlmOWxzZ05ReGVqMUV3VjRjaW41dVNkaHE5dU1PTGxFZndTK244RjFF?=
 =?utf-8?B?OGFGSVhBb2t6NzdZanRLQVdndVkxUkZ0VUtIaHRwVTJMa3V6dzZQVE9nd0Vl?=
 =?utf-8?B?a1hOeXBJK1FiSDFVeFdNYnI1UFRQY1RjYTNRY0ZGTytOQXhYYkhOWE5SZm5t?=
 =?utf-8?B?b1lWQ3pFdFNsWm5FT3Q1UUhIOXhIK2tCQ0FpMDJnWU1CZEE2YmhUUEk0K2xH?=
 =?utf-8?B?TDZaOVN3ZituZmJWUzV6YVNkSzZDZXYwR09DQUtseWJPeTZCOGRMbFVCVEto?=
 =?utf-8?B?ZHpsa3dJd1doQXZnOFFJSWlYaFlXUEQyZ2x2YnN6dGZFZm9aK0RISnl2UE1P?=
 =?utf-8?B?M2hrR3JGVHJEdk0zSnJLRGZVZ0x1UnZnY3pUZjEzN0FHNWZScngzMmVmb3Fu?=
 =?utf-8?B?YXA4ek5tSVlOQloyYkxGSmFhUXZtMzdzU0dnU1Z1MFJlQ1VlQXYwb1Fmc2RB?=
 =?utf-8?B?d290cnZ0a1ZzMGIralI1Q3FlMjJnenNUWS9IL3ZMMnkzWGY2VFBWMlJpU3ZI?=
 =?utf-8?B?VDFvNnJ4Z2dSUHRVNHBvRVpLclhxV0ljSnJZdjJVYUxLU0ljcjVQd2RuZWgz?=
 =?utf-8?B?T0FkaWpaUURJYlo2alJSeXA4ZllTQmZTQzlxaDhQYWhRc1lLZWp1VE9zZWF4?=
 =?utf-8?B?ZlV1VEx3YzNwakZFMzE4ZjJ0WnhlODhxU2g1UTNiSkVFQWJLVEtSTitYKzhH?=
 =?utf-8?B?LzBZSkIvTFZaTTA1ZUx0c0VBbXkxanNmWjUzZlhpTzhveko1cFVYdVVYRmxD?=
 =?utf-8?B?cjNXb3czbU1UemFaN1pxWjc2M2RNbDRudDhmcUJlTFF1YVIzcDFwcFRzWWRI?=
 =?utf-8?B?Qnl4aEpZTjJrcjM1UzcxQjNrbTduQVFZU3o5NVlZYzk1eFhneFpWWWo4SkxO?=
 =?utf-8?B?WVg0dklJci9pb2VrMmVxZEV1Z0NVOC8wdDZpR0VEbkU4WmN6a2hXRGQ4OFdx?=
 =?utf-8?B?VTMxckw1TjllbzhReEVVRzVuY2NIU2lWeHI3N04vdnZuVnAxZXRiek5WQzZS?=
 =?utf-8?B?S0ZyN3FLZnRpYUQyU0prSEJyTDJTRXppZzBpa0NtN2NVU1kyeEJycUtWOEt2?=
 =?utf-8?B?N0NyaUxWU0VBUDh6RThLZHlFd3FKWU9RRFRKeWJPYklsdkRxUnYxTk5ML3NK?=
 =?utf-8?B?NGxOMllPRnk4b0JsaExPZkhIT05UYWc4eUNvUHJqMStCanJUMG1DTG5tdFJK?=
 =?utf-8?B?aEJCTENQTnpRNEZFaEtPdmRINzdsem9iMGV3QzFzc3RYQzl3SXFiMkpiczNC?=
 =?utf-8?B?ZTlyQ0hYRzBESWIwN05Sc1VRdzQ0VXpjSEJSM04zVHNqVStBT21jejVMM3hD?=
 =?utf-8?B?bDNxUk1pRGJiNVFYMFhuaUhJRS9SWUFlWGxjSi85MGJHcXJnSHlKa3lDS1ZD?=
 =?utf-8?B?ejhHZWVUaUFGMjUxN2VveVl5VStsY1loMjFxdGVvc0NyUENIN3oyemlrYjJI?=
 =?utf-8?B?c2FOU1BDdCtFY1crZUdTTWlYWExQZWNwMFRSQndMc2tWZE9UVVBWRkhGUEs1?=
 =?utf-8?B?UWxKZnlsbTlBeDdXbFdLNEJrcmhJbzRTZjVldUJwN1VubFBDMzk2ZkhXZGp2?=
 =?utf-8?B?RmhDWWREblBMNEdwWDNwNXN6QUlUR0RBeXVDRlRrckRERVNLRVBtVFNiM0NL?=
 =?utf-8?B?R2E4L3RyTm5GUzloUk4xOW5lNmdTLzVaWGdpKzBJQnB6UWtZekJTSDlxeVJn?=
 =?utf-8?Q?gwB3ETJCIms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZFa04zK0NVbndVZ1hCUzBxVG83L3B4dTV6bDdNK1VuNjYyS05QbDRNVEkw?=
 =?utf-8?B?cXc3NTF4SE5CN2ZBZ2lZbk5Ca3ozQ1lIeXQ0MEVnQlc5WThUVDl6Wml4dTdC?=
 =?utf-8?B?aDdaL0dIb1RMTVcySGhIb0NQM3Iwd2NCYmdkU0pyUWowYTkrWVZYVXZZeEVn?=
 =?utf-8?B?dGdrdFNTTGUxYlB5Y1VSZS9wa1FGODhveWM3dzVWdmhWS0dIaXp3QlljZmdT?=
 =?utf-8?B?S1dYaDNEUFgvOEpnNnR6R3FpbDY1aDRYRmlrdXduNFZuRjVsNFQvcmxTNGNH?=
 =?utf-8?B?UnRNR1VQRjNGR3I0WStQdDlCbFZCdVdsNUlMMWtxNTJMVDJLWUZFQzJpMlVT?=
 =?utf-8?B?Q0JLYW9UaDVCajQ5VGNvWU9OYVR1OVYzQ2w0TmhhZUtjNHlUR1hwTC9ab3ds?=
 =?utf-8?B?cjJBam1KM0RvR2xGc3pzY1N1bGsxcUQ0VHlYaGlwMWFmZkVvQ1JNakh4TGl3?=
 =?utf-8?B?RmJNeG4yeDI2ZUsxc1Juemcydk4vSkIzVXlUUjFsNXowUnR3aUF4RENDRWVy?=
 =?utf-8?B?Rlpvb2kzazhEWWpiYTZzQXFNT3R3cGU1eURBeEJXU0xScVZUZGtXaitHL2pa?=
 =?utf-8?B?LzBZNVQ2andsZjBZNDBabFFyVzhTZmFmbzhtWE1yTzZPYm9PYkdvakZkM0dH?=
 =?utf-8?B?YWRXYlhqWktYV2JTQTNwQ1hhWHdPYm9MeUpNcEo5U1RKNGJRdDRHaTdId3Q2?=
 =?utf-8?B?OHBBVzZvVWRHdmJGY082MkFsWHIrWUJ2UG51U3MybXUwSXJoOUI1K0pUb0My?=
 =?utf-8?B?bUtxV09BRFU0QkhzOGZxd3VXbC9GaGNGV2ZxRC9mUmc1dU45eGxvTXNscXhT?=
 =?utf-8?B?N3VrUnhzK2twajNPaVV4M05jcG8wTW9JcHBqOFpTN2UwN3d5cXdNUHJzTEtF?=
 =?utf-8?B?eEJ3VkVoTlVmc1NEKzgwbXNUc1VzR1lEY1M1NVVmb2Zud0dPanZlN1JhVkhT?=
 =?utf-8?B?QXdtSC82OGtjeTZKOGZjeXVvT09Uczl5RTBMK0cwMmdVN2gxUlFoY2orT0FL?=
 =?utf-8?B?M1BzZVN6VGFITy9JcWZEbWlHSWhUcCtQTnNDZ1Q5Rjl0SzJxMndWU2dCTTVO?=
 =?utf-8?B?OHlhYlFEbnZGUVJrdzczZmF4YnMxK0xEZWRaeEVTdkRqNS9iandZbktXYzBK?=
 =?utf-8?B?UVN1WWJJcGpDTVp3cFRaM1Rhb3Zhd2Rhb25CckV4dS8zQStMNHZYbmZRNXRz?=
 =?utf-8?B?ZkNMTm9weGtCQ1JjaGZ4QlFRSUFCZU94QkE2YW4zRVRpRk5ISnl4NmFtL25X?=
 =?utf-8?B?NTBCcU12ZmZQZXpYVGc4TW12WGRQU1BLamVlWFhnWGdjdWZ5SUUrT3Vmek5i?=
 =?utf-8?B?emVZbDNLc05OcmZ4NldaS2ZGcldVU0tndVFheWExZGlLdkt3N1g0ZmxNb3Q2?=
 =?utf-8?B?RW8vZm9MTmJLZ202dGJnTTA3UEZYUXhNYjJjd1daQkRqSWd2N0h6TThLTUU5?=
 =?utf-8?B?RkFMaUduVWVRK29WK3BuZk04VU9VYlFXUkhjT1JDZlUySUZoTHYzNUJKYk4y?=
 =?utf-8?B?bW1SSFp2dWtNMFhIVGcvNHZYcHZUUm01N2g0bDJSNTJ5amtoeFliZ2h4aml0?=
 =?utf-8?B?M2Q4UlptSFNtVlhjK3hmQTl3VzlKR0ZWNk5TdExWQnJwSHkrK1VkUHI3RmRi?=
 =?utf-8?B?SERPN3Q0K3dKemRFL2pRTGlJNzVaY1MwMFd5OGVnb052UUNyNlBmVUV1c3Nv?=
 =?utf-8?B?WWRSbXJISDNMOGcxZTlOSmlIN2pEczNrVVFtMndLZEwzSy9FSjBKalpBUjJ4?=
 =?utf-8?B?elJYRDlaR1pZQWIxRGFjaE9sNE81Y0QzMzcrRVV5c2dpeXJWL2QxZy9VNVFr?=
 =?utf-8?B?ZjVZTG9PczR4SGdNMEg5Y1JEdDUwci9XV2VPTzBrZEJZR1Q0blNqdERkdWdX?=
 =?utf-8?B?NkNJMlo4d0pPTmJmNGVJcE92Z05GVVNBa3B2cnZBbzdRdmNUREVVOTkzcnJu?=
 =?utf-8?B?d3VpZldLZGVZMGtRL2hEaXBjVWZoT0F3czVXVk8rTEwxREk0dEZleEZGdjgr?=
 =?utf-8?B?aWZqTlZyRW1XNWtlUDNteEpYMDZRWVVyaVFLL0RRbFVhQ2lCRFZNV0U0dFlz?=
 =?utf-8?B?Um9ZYWorOHNNbytsZ0dXSW1GWGdDSEJoQm8xUzVGQlZPQzNXT3IyR29ieWRS?=
 =?utf-8?B?cUs5Rmk0dVdiWFQxVEVKcGw2anoyUTdjVk9IL1dMQkRWQjRkeVVIenlkMmpX?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28faa8f2-4ebe-48ff-ec63-08ddcdad579d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 08:04:14.1135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXw4pn/GkOr/dOoo0X/A7MQduRfc1Lxf5+vssoTVTD9tOgqbgKj7ZF3nxkUGDbBqDq7ruo2nXKZjrf0ZJWb+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
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

On Mon, Jul 28, 2025 at 09:51:54AM +0200, Piotr Piórkowski wrote:
> Matthew Brost <matthew.brost@intel.com> wrote on pon [2025-lip-28 00:33:55 -0700]:
> > On Mon, Jul 28, 2025 at 12:10:02PM +0530, Satyanarayana K V P wrote:
> > > The VF CCS save/restore series (patchwork #149108) has a dependency
> > > on the migration framework. A recent migration update in commit
> > > d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> > > caused a VM crash during XE driver release for iGPU devices.
> > > 
> > 
> > My strong view a revert, restructure to use single xe_migrate object
> > that initialized on driver load, but provides queues for the VF
> > migration needs.
> > 
> > Matt
> 
> In my opinion, the changes suggested in this series for xe_migrate_alloc and xe_migrate_init
> are necessary — my recent changes related to separating xe_migrate_alloc left a little mess here.
> 

I'm not suggesting reverting xe_migrate_alloc or xe_migrate_init—rather,
we should have a single place where xe_migrate is allocatedi /
initialized, with VF queues allocated as needed - revert this series,
buils in per VF queues in xe_migrate, resubmit.

For context more, we have upcoming changes (built on your series that
splits alloc/init) where we may allocate one of these per tile or per
device. If we start allocating them in various parts of the driver,
that's a bad idea.

> I think also that Michal rightly pointed out the problem with xe_vm_close_and_put
> inside xe_migrate_init.
> 
> I think that's missing too for:
> 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
> 	if (err)
> 		return ERR_PTR(err);

Is there a problem with having a single xe_migrate per tile or device?
If not, that further supports my point—it should be allocated and
initialized in one place.

Matt 

> 
> 
> As for using migrate for VF, I have no opinion.
> 
> Thanks,
> Piotr
> 
> > 
> > > Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> > > xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel enabled
> > > CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W           6.16.0-xe+ #4 PREEMPT(voluntary)
> > > xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1 negotiated ABI version 1.0
> > > Tainted: [U]=USER, [W]=WARN
> > > Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
> > > RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> > > xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF ABI 1.0
> > > Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
> > > RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
> > > RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX: ffff88811a028c40
> > > RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
> > > RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
> > > xe 0000:00:02.1: [drm] GT0: reset done
> > > R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811a029c40
> > > R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
> > > FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00005af31328c000 CR3: 0000000114534004 CR4: 0000000000f72ef0
> > > PKRU: 55555554
> > > Call Trace:
> > >  <TASK>
> > >  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
> > >  devm_action_release+0x12/0x30
> > >  release_nodes+0x3a/0x120
> > >  devres_release_all+0x96/0xd0
> > >  device_unbind_cleanup+0x12/0x80
> > >  device_release_driver_internal+0x23a/0x280
> > >  device_release_driver+0x12/0x20
> > >  pci_stop_bus_device+0x69/0x90
> > >  pci_stop_and_remove_bus_device+0x12/0x30
> > >  pci_iov_remove_virtfn+0xbd/0x130
> > >  sriov_disable+0x42/0x100
> > >  pci_disable_sriov+0x34/0x50
> > >  xe_pci_sriov_configure+0xf71/0x1020 [xe]
> > >  ? sriov_numvfs_store+0x78/0x160
> > >  ? _parse_integer+0xe/0x20
> > >  ? _kstrtoull+0x3a/0xa0
> > >  sriov_numvfs_store+0x10c/0x160
> > >  dev_attr_store+0x14/0x40
> > >  sysfs_kf_write+0x4a/0x80
> > >  kernfs_fop_write_iter+0x166/0x220
> > >  vfs_write+0x284/0x550
> > >  ksys_write+0x6f/0xf0
> > >  __x64_sys_write+0x19/0x30
> > >  x64_sys_call+0x2bf/0x2660
> > >  do_syscall_64+0x93/0x1320
> > >  ? ksys_dup3+0xba/0x170
> > >  ? __x64_sys_dup2+0x2e/0x1f0
> > >  ? do_syscall_64+0x1a2/0x1320
> > >  ? __rseq_handle_notify_resume+0x447/0x5e0
> > >  ? trace_hardirqs_off+0x5a/0xd0
> > >  ? irqentry_exit_to_user_mode+0xdf/0x2f0
> > >  ? irqentry_exit+0x77/0xb0
> > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > RIP: 0033:0x7e030351c574
> > > Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> > > RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> > > RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
> > > RDX: 0000000000000002 RSI: 00005af318d7da30 RDI: 0000000000000001
> > > RBP: 00007ffd34a107c0 R08: 0000000000000073 R09: 0000000000000000
> > > R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
> > > R13: 00005af318d7da30 R14: 00007e03036045c0 R15: 00007e0303601ee0
> > >  </TASK>
> > > 
> > > Update the VF CCS migration initialization sequence to align with the new
> > > migration framework changes, resolving the release-time crash.
> > > 
> > > Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > 
> > > ---
> > > V1 -> V2:
> > > - Updated xe_migrate_init() input arguments and return type (Michal Wajdeczko)
> > > - Fixed review comments.
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
> > >  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
> > >  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
> > >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
> > >  4 files changed, 20 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index c8eda36546d3..5a79c6e3208b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> > >  	if (xe_gt_is_main_type(gt)) {
> > >  		struct xe_tile *tile = gt_to_tile(gt);
> > >  
> > > -		tile->migrate = xe_migrate_init(tile);
> > > -		if (IS_ERR(tile->migrate)) {
> > > -			err = PTR_ERR(tile->migrate);
> > > +		err = xe_migrate_init(tile->migrate);
> > > +		if (err)
> > >  			goto err_force_wake;
> > > -		}
> > >  	}
> > >  
> > >  	err = xe_uc_load_hw(&gt->uc);
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 90065d7d29ff..7e295ca00763 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
> > >  
> > >  /**
> > >   * xe_migrate_init() - Initialize a migrate context
> > > - * @tile: Back-pointer to the tile we're initializing for.
> > > + * @m: The migration context
> > >   *
> > > - * Return: Pointer to a migrate context on success. Error pointer on error.
> > > + * Return: 0 if successful, negative error code on failure
> > >   */
> > > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > > +int xe_migrate_init(struct xe_migrate *m)
> > >  {
> > > -	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_tile *tile = m->tile;
> > >  	struct xe_gt *primary_gt = tile->primary_gt;
> > > -	struct xe_migrate *m = tile->migrate;
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_vm *vm;
> > >  	int err;
> > >  
> > > @@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
> > >  			  XE_VM_FLAG_SET_TILE_ID(tile));
> > >  	if (IS_ERR(vm))
> > > -		return ERR_CAST(vm);
> > > +		return PTR_ERR(vm);
> > >  
> > >  	xe_vm_lock(vm, false);
> > >  	err = xe_migrate_prepare_vm(tile, m, vm);
> > >  	xe_vm_unlock(vm);
> > >  	if (err) {
> > >  		xe_vm_close_and_put(vm);
> > > -		return ERR_PTR(err);
> > > +		return err;
> > >  	}
> > >  
> > >  	if (xe->info.has_usm) {
> > > @@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> > >  
> > >  		if (!hwe || !logical_mask)
> > > -			return ERR_PTR(-EINVAL);
> > > +			return -EINVAL;
> > >  
> > >  		/*
> > >  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> > > @@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >  	}
> > >  	if (IS_ERR(m->q)) {
> > >  		xe_vm_close_and_put(vm);
> > > -		return ERR_CAST(m->q);
> > > +		return PTR_ERR(m->q);
> > >  	}
> > >  
> > >  	mutex_init(&m->job_mutex);
> > > @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >  
> > >  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
> > >  	if (err)
> > > -		return ERR_PTR(err);
> > > +		return err;
> > >  
> > >  	if (IS_DGFX(xe)) {
> > >  		if (xe_migrate_needs_ccs_emit(xe))
> > > @@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >  			(unsigned long long)m->min_chunk_size);
> > >  	}
> > >  
> > > -	return m;
> > > +	return err;
> > >  }
> > >  
> > >  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > > index 3758f9615484..e81ea6b27fb5 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
> > >  };
> > >  
> > >  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> > > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> > > +int xe_migrate_init(struct xe_migrate *m);
> > >  
> > >  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> > >  				     unsigned long npages,
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > index af43e04179aa..bf9fa1238462 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> > >  		ctx = &tile->sriov.vf.ccs[ctx_id];
> > >  		ctx->ctx_id = ctx_id;
> > >  
> > > -		migrate = xe_migrate_init(tile);
> > > +		migrate = xe_migrate_alloc(tile);
> > >  		if (IS_ERR(migrate)) {
> > >  			err = PTR_ERR(migrate);
> > >  			goto err_ret;
> > >  		}
> > > +
> > > +		err = xe_migrate_init(migrate);
> > > +		if (err)
> > > +			goto err_ret;
> > > +
> > >  		ctx->migrate = migrate;
> > >  
> > >  		err = alloc_bb_pool(tile, ctx);
> > > -- 
> > > 2.43.0
> > > 
> 
> -- 
