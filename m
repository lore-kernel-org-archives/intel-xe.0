Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE17C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E173112C3B;
	Mon, 11 Mar 2024 19:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdtqrxxC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB779112C3A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185362; x=1741721362;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=pvh51CM4dvm8/ILZyE+gMzntt2UD51B1oleZs7ZcJaM=;
 b=PdtqrxxChTWerpAxXq3jKNPGJiwrolENZ6mP5hor8AXBD0LzbGmjNj2N
 LVyKavYgjByrqeH0OnbZPX3iJDgcI0P4vH0WA0mRiX23zAqin4RHGpe+o
 TKjvpJMyucqgnDQYFE9l5hCruDCisvZXNs7rEmFIvqx6UnOvE6Pfczk4D
 dvvTw1JNvgEcUAhs2ZL3xL2/lkgRtKsdCemtquupIs49hGeWevLfjMi6P
 M0xR6f+E05W7JZVpQ+KEz7LLQejJOW4t1DhHfX1ntCvk9ZOdW54yTRUd8
 +84Tnnz6wHIhm40HUo2akK5IQ2LXXze9qiacebGaLmhoCL3gxHwMypgvu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8627926"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8627926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11346148"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaU1W3RorSDKfblWkMBA/eVcZIixqO9E/AJkfcZDwGwKF+9NNYbF1TXtWQ9xheae7v7wjlz27T1nNTBwKx8CHQF4MDD80xNmBDRMq2vYtdgcRj6AygNbcgnrJyQnBkv+Io6/a4+eO4s1DA5/2gKz/Z7H9V3eh5GLOBUU+QKZizfCoBoDOxacv5DiwsM0apfZJEDlpBOOIFin7b0ATVFxcDpOomNYJoGACGN9AW/puigD02M2LZ3TPkBL0ofQUluW8n9IE78LbohdkeYiomeVQWvtnJ4gB0r946csTt1T0Jo+GYH5BvYbBR8xQjLX+8WoiDK41sB79S8P8cSeH9FQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkU9iIsX1CFiehJF2VD0WynPvCJD7NNWHLUhH6KsJw0=;
 b=WukY2WeiCM0xbDCS1ZWIj1rBPnMycVOfvrbGG9xx/ww1mO8tOSv3P9JCw6y5Xzzv2laHCvaNkSNV4JA0BP0B9RCLO2IeVuqyHleMCbwF3A5BQvDi6ZLY4pgLTZhBhZQ7UaQ9RQtFehUNZPJKyCoHeLqqHsGwtCTrQx6HILCHThshDAtAdoYaTsNXFtJsmklnetBMgMgWE2ryGES3iSFpBu1xCwjJR4FD3fBZ8x894Iqt42k6l7jydTgisBfl6tm4vDYpulfFhmN9Akh8FnL2OsM60CflF9EWkgQ3u/KAYVLIP54vlv1zOBgIERy3vh1cel7ZuPJ3BD1leUaF9+XIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:29:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:17 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:14 -0400
Resent-Message-ID: <Ze9biqyGFeSSc90K@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, "Imre
 Deak" <imre.deak@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 03/11] drm/i915/display: convert inner wakeref get towards
 get_if_in_use
Date: Mon, 11 Mar 2024 15:22:55 -0400
Message-ID: <20240311192303.33961-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 1490dad3-af9a-403c-fbba-08dc42018acb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fc28b7-7d05-4f19-5883-08dc4200b2a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:14.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfS2oL8P3vR8A8JKVhPJMbweBHPVh6pfWK8jXBP8589jA91K6fW/9KsxFFZRrdWfp0yhTuABzz9v2aNXXwIOUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.8288983
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: /GWMU2mq0/u+47+R0hSwb25ol+A1F57mJ+W+jBvpEX0tDoK+x21PMd56IJk/9hYuWv+NGHjkGwSZlxQyty2nuzqIWWIjvu4Jr+pS9+XuxfJp/YGfERlcv9/gbFDNy4nl8umU7mNaHs69CxAnq9TkLbwqFbuAHcWDEewK7SGL7uvIlZ2P6nWyptgf1ZCn8yUEV+nB/R6LMx/oJ05EkZ+GjKIdVehOb85N1xa8RncY1h7ICGNBL7Jgsp/naolMBgmAXLtmSQjMTqgiu/MKDlipPcREi6e1jOLsCU+cO4T2Alt1D7uGewa2nSH49ZBGnif5Tb2puwgcSSmt3sV6yBjki9o7B5xZp8VzDpetlwz4k86VboIQISepDTg8si3ZRzr+CHZV9eBZQhdLmt5QAPo5PDMwAQpiWef6gXCd+2+BWexyYCwvEujw+0spGWz8GogO5+6adkjGX321PSqs2eMJOANQa5WV2zNeDzHl2iueqHZ88O6k3wrBSwRb3uLx8mE7xu3QD2rFMv/hyu/lsTpH1wfEkF27sSESjMY5nCecXOYSsBrfBYxhhl4M7QclHUpBCxGqwRd9zBmOw8bniTGB8fxYQ3ouZxPnUCwG8ZRSSGeAc5PpEACyhZtKUW78XaQbnXV53Rkra0bMm0Zv3awZDfzLxgSxlK+ZlgQsdDns4bI=
X-TUID: 2Ex5UEEW6nI3
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 09fc28b7-7d05-4f19-5883-08dc4200b2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xEV0JycFNsZVFBb2hsNWtNRUIxVUI3bHpwR0FzcFAwa3k5VTc2aVMzSUlq?=
 =?utf-8?B?ZzhOQzNtdTh2cklDRmptWU5tVmRzVW80ak1WZEs0OCtuOVc1SG44U3pHZGsy?=
 =?utf-8?B?bnJBdlFka3FjbGZjWEkwYmNYWDZYNkNKdDRSVnFYQkVuS0hhYVQ1ZytURjh0?=
 =?utf-8?B?b1RIZ1EwNHd0bWZLTWNqOVpBZFVVSFB5RElwTThTTm92RHp4ZkU0dm1DZkpM?=
 =?utf-8?B?cFlwZEFjRnVadnNhTXlFYmxyOHcwTVg1eHNlbnptSFJkMkJDYTlBOVVrUUYr?=
 =?utf-8?B?STFtN0tlcEFWMndGRGJKZytBM245cVRqMkZNWTY5c1pRK0lQUXJmbk1QRFpo?=
 =?utf-8?B?VGNNMk14ZWwxVTM2WStwZC9OVm01c2xBdEdjdU50b0JSZTMrMGRDdlNjUHhH?=
 =?utf-8?B?MDlCSGx5LzRMSmpmZksrZXh4L2NBcTduMkRmdndGR1JINUl6b1FGUkkrMWNW?=
 =?utf-8?B?emRERFN4bXF3ekhGcHkzcDRJUlNWMnljM0l2WGtDbXlVSWt3eWp4MEtVSFVL?=
 =?utf-8?B?ZCtUL1Y1QmpncEthZTA4T1RLQll6NzkwRjdtTVE0eVM5VUJlYTYzTUhZa0lL?=
 =?utf-8?B?SzhKaElkWEI0LzIzbzhWdzlGb1UySDhoZi9ZL0pCVy9SR0t4dEY3bFE1dVRC?=
 =?utf-8?B?OE1FQjdSRjZqVjBDK2oyeWtVdGJkODN3N3dXSGtrc0FEWFhTOGRpSHUzUWt2?=
 =?utf-8?B?MHljcGdBRHV3c2VFOW1hZXVvTWZYYTBKMDBFSWdjaytHdFhtdG1teDlSREpt?=
 =?utf-8?B?ZFd3akZyNTlSYlRLYytHWXhGTTFmNzJFNmR1S3FyQXhYc0ttdmxYcmllRVBT?=
 =?utf-8?B?Y2RqVmZaOWdXM3I3OE9kWlZJcnM5Nm1DS1A2MU1USXdsUEVlNTFLZytiSWdj?=
 =?utf-8?B?eERZM3ZGZEYvWkJ5dVFJVmFYYTlsZkhQR1Y0RHYxWkNRbURUd2E4c3hNaGc2?=
 =?utf-8?B?ZC9wTUZ6N3RtQlB2bFVRWEIyZWJoOC8yU0NLZGwvQ2Rvc09xMTNpZTBSd0h4?=
 =?utf-8?B?WGVWOHVxWGNIajZsajE4UUhJVFVMU2hMMVZxTkNiR2kxblhpMXZFYTN4bk5O?=
 =?utf-8?B?WWhyTmx2TElFaWFGRzB2YzE2eFVpVWk0WldZV21xOVhWOGkybWJETWlCdUtM?=
 =?utf-8?B?Y1BqMzRIOHBaZUFSdUJZY1NnaVJVbVZKdDl1Mi84ZDk0bzg3eFBURXU0ejgv?=
 =?utf-8?B?LzI4SkhzUXl2OXhqKzFtazJYSXZHSW9UQUJkUEoxUHh4UC85ay8xV0lhRHJ6?=
 =?utf-8?B?MXlFVTN0R1RvTkh3SGZzc29HSFpWcFhOczJEeGVYU0R1YmN3M1ZnVXI4eUQx?=
 =?utf-8?B?UDdjQUVjZm5FR3MrVWtoU05tOGtBUkYxQ3NNNzZZYjJTa3B0dE0wcUg4ejRy?=
 =?utf-8?B?OVd2N3F1Tkpmd0NTV0ZQN0E2NktiRW5tamFVdW9mbFZiZDlWWEVJWHlENXk1?=
 =?utf-8?B?K3B2NlByTDF1ZFR2ZHEzTTJSOEZHUll5cWlnemlUY1d2bEJLcUlPZFRJSXd5?=
 =?utf-8?B?WTRzeW5zWjU4ZDNNbkpFekErcDNjcSt4OXl0UklhWE1ycjlQVU5DcTF2Ymt1?=
 =?utf-8?B?OFFjZVJWN1VEWGgzRk5OcmJvZHk4ZU1COE0zMDlWOUg4QStlT1VDYWtpMC8z?=
 =?utf-8?B?TUY5WGxXM2d5TFVwNUZac3BON2k2YWNFWW1ZWG1kdnRmek9MdzZMajZjek9P?=
 =?utf-8?B?UmF3aDNsV09xR1M0cTV5K0s0bm1FSzA1KzVyYW9GR1hvSVArTjJHSlorTmJj?=
 =?utf-8?B?UW1Rc3FlOEpBRitVUWdmMWF6WUNJaXoybDU0U201UjhWTEtrdFUvMS9FbXRE?=
 =?utf-8?B?emtqVnZucDlnWmtxTjhIOFRzZWIxUDhnaDdSVDBTYnJINFZZS3hlU0IvKzVR?=
 =?utf-8?B?SWFlSW44WHZ0SHpBZDBFeGlyb2ZYc2RaVU5xZWNBc3lUUjRBN21KamZmaCs2?=
 =?utf-8?B?Z0NEYjJGUWt5MTB3dEtDUWp0bm80ZVFwR2dqUU9BMlZUeGI4OGF5YWhnNmJE?=
 =?utf-8?B?ZVl4Tm1NMXZteFVqMUx0cmpPT011QkpkcXdUek5zWUllVG91blIvbSt6RWV6?=
 =?utf-8?B?ZEVJU3ovZlN2bjVLSS9Vc2NCaVRYVXRPaXFtU0J5SDZzb0V3bE5GRUhHWTds?=
 =?utf-8?B?dDg5cXhLR0tITXVqeTV3bHF6akFKbGZ2b3VyQ3J5RDJYUWpna2dkRzlpc3ZJ?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1490dad3-af9a-403c-fbba-08dc42018acb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:17.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vccHE7Y5F17d0IejRDnKRVlMo02unbw6iDIsNYtUgo8kQkSEyij/TD0hcsRuXSBF21sLhUBUJI6vSirNkQn5bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

This patch brings no functional change. Since at this point of
the code we are already asserting a wakeref was held, it means
that we are with runtime_pm 'in_use' and in practical terms we
are only bumping the pm_runtime usage counter and moving on.

However, xe driver has a lockdep annotation that warned us that
if a sync resume was actually called at this point, we could have
a deadlock because we are inside the power_domains->lock locked
area and the resume would call the irq_reset, which would also
try to get the power_domains->lock.

For this reason, let's convert this call to a safer option and
calm lockdep on.

v2: use _noresume variant instead of get_in_use (Ville, Imre)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Imre Deak <imre.deak@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 6fd4fa52253a..048943d0a881 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -646,7 +646,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	 * power well disabling.
 	 */
 	assert_rpm_raw_wakeref_held(rpm);
-	wakeref = intel_runtime_pm_get(rpm);
+	wakeref = intel_runtime_pm_get_noresume(rpm);
 
 	for_each_power_domain(domain, mask) {
 		/* Clear before put, so put's sanity check is happy. */
-- 
2.44.0

