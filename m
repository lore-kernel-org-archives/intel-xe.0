Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D7CD73EA9
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 00:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09110E1C8;
	Fri, 30 Jan 2026 00:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdGgpAhz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FE310E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 00:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769732323; x=1801268323;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zWiTR7tQ4dESkapUhvdv2Rrg+RRbcdgz1i5/pR2hoEU=;
 b=UdGgpAhza+Xo9sO/2SfouPjfyHg6MYtxH/7EymZO48+Ky3cV1gnae0MU
 TMJbPDobeTS9Kensi9kEJRpEOWFWr1mue9CAJ8/0sAmwc/J1AXhaW3rGa
 v2I6fxBwuZR9IbdtGGL7UrWMzxIVqX2p0JEDfX0Ng/9t3w8ZKmdR3/mVC
 uiow2RTHthqHFa7e1xUKVM7acjwTEQ6QWWVvdRg8TKzZ58mrwF81vJfBn
 DunChHuD31Mb3A0s8aJCbnNTf0yUtaonsipmeDYNt0p31NpNaB3d74nqj
 ckRfp213WHQMsjUPOUPk88P+ycErTohIwsjTrKMJK4dEKET+AHth5Al5q A==;
X-CSE-ConnectionGUID: PZztxvd3TEOTgqOOWxV7pA==
X-CSE-MsgGUID: 5VN9MC2YQXaV+V3/WQ1elQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82094350"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82094350"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:18:42 -0800
X-CSE-ConnectionGUID: 8dd0N4WeTXan4uZINMVdbA==
X-CSE-MsgGUID: zcI4k7a6TLKQkpXl75NWDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208512267"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:18:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:18:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 16:18:41 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:18:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xORQaMNJZQvFYHPJRtwfbds9Rc5b7hWlTw+WxP4iHM1e24FCp253kIFMmzRFfGntc9GmGm1trjCG9PnqnxaOfpJwRgyLwSJy8BJn2ehORMyqdPYyWnt2cStmLRUgOa7stoju3Va0Xu/DKdfxC55+3BpZKep+szPkGMamMN0+8iq8DiwRRrmOhsvABZwNDJSNz4p83KBnYr/jUcEeqqLsci/4KYRpPWQa61J869WqSyqHw+o5d06bIW2QSclcTU4BSJXrprK3Tgsj7W5nb7ZSMxVTa5USlnN/3s0gF0tntXB3h3YgRweknp9SUoHIfP6ia0g1qDCXkiRUmNn7yKvD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k0erWZ4J50m4bUudGTNbr5fuKEKYTVkKNzN/26acQw=;
 b=RYR/1HTb3Rhp9HtzAduhr+PqxCrcOiStVZmCvC/xkUuuecgqgHEtUvmel+C0Bhl3zxAgMokipcuGTqiLOV/QaYhHdV1Tl73WhEkEf5uvHeKI6iUrAoDqZ5dXekBjwddWNRJdhBeJJNCrUpxfEYJyzXZuDtjLpGif6zKkPYFZlwPAQvoxkrZ5f8HndFfemXJaYJobpZfIKc9hQcoKAPK5eWk6O02LMjN9cSJwNnVHkRIkF/HiDXf+urg5eG9Cgtejm7el51DVPH/lPuncRN/S+eCgHJf6MGLZHLZgxzm/krauq6SBETwPqmHdkUPDOibGgwPRh8wD91PYkuDVefKBJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB7536.namprd11.prod.outlook.com (2603:10b6:806:320::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 00:18:39 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 00:18:38 +0000
Message-ID: <268d4236-3188-4903-9c84-7e3aaa3c8b5c@intel.com>
Date: Fri, 30 Jan 2026 01:18:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] drm/xe: Rewrite GGTT VF initialization
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260128165724.12587-1-dev@lankhorst.se>
 <20260128165724.12587-3-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260128165724.12587-3-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fae95f-c437-409a-3bd2-08de5f951dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0hEbGJKdFdaMmxsZ3oxT216aFVtekQ4aGZzbG1lK2JsZVZldFhCYlViMXhB?=
 =?utf-8?B?VzM4MlM2dzRuRklaK3lUQkUraHlmcWcvQXk1dkZxKzl3UHptMDBsclhPUTkx?=
 =?utf-8?B?dUhjclczZTN2RFFVbTFrNDJuSDI3SG4vdjFJdEhkdWh1THk3WlJHTVJYZFor?=
 =?utf-8?B?MFI0eWwra3BmZksxTjhGME8vQ0NHaEZiSktqSEdZVkRiWk9BSXI4Q3MxOWtm?=
 =?utf-8?B?cjJQMmo4a1d2ZzNnOVdqQnh6Sk1ibFpaUXFlZEJjVnNHYnBIOU50cTdJOGxQ?=
 =?utf-8?B?WElweXY1ZzNUTzBZZVZxUkY1Zmpsd3ljQTZGeHp2QnZUTDQzd1lMQkVPanBC?=
 =?utf-8?B?VVdadHdFUysrNDFVVjhManhkTFVhVHpjWXNJWXZHV1ZBYW5MWmpqMi9vS2Fu?=
 =?utf-8?B?NWl1amUyQS95aWpGN3lOUE9HM1NyeXlZQ0I0UXB2eG5ZY0toTm1tcUJtRXdl?=
 =?utf-8?B?aWMrSG54c1hOLzFyVnhmb1V4VjZ5VWZyZ1lRMkxiN3NnbWJ6bFVZczh2Mk9R?=
 =?utf-8?B?YnZtVjZ6ZDUxckpNL1ZDZlBYRkw2Vldlc0g5QlJxUkNUOTdsS3p5azcrajND?=
 =?utf-8?B?THFRTzc1MWlRZFV1a2UrNjBEVGhacTVUUzFxRE1iUkdIOTE5aDFHNzBiM2dl?=
 =?utf-8?B?N3EycVg2eTI4RUhuamhmeFZlMFBOenBkY0R4T0hoa0ZMUzV0WStHQlk1Vkcr?=
 =?utf-8?B?M0YvZ2I3azFwZ21BVG5MaUFzd29NM2d6UHRzUnI4Q0xvcFY2MW1oSzZWWHVI?=
 =?utf-8?B?QUwxUnEwbTBic3kvT1lEb1Jrd1F2VElyKysrUkpOR0hnemxQVjFpTDVqb0tr?=
 =?utf-8?B?WWxyNGVuT1dzRDlLZ2p5WDA5eUYxTTN2SlAxMElhOGlySklzd3lJUFkzNldE?=
 =?utf-8?B?SjZKRW1NSWhQby90QmNCTlFYNkZwMndvZmdNVUtNTmlXajJZc0toYnRRV3N6?=
 =?utf-8?B?dzZnelpZeHBHZkxCWkhRL2xYQ01sNnVlSzZHenBQL2Z5YWFvcklqWThpK0ZW?=
 =?utf-8?B?cmpObUUzS3JOUGo0a0g2VHFJYVJFbUlvL2JnMlVoOEtSSUl0dUN3MmJaMVVY?=
 =?utf-8?B?OXFDYjFVTnlQakM2a3FzdjdnTjhRaFdLSHBLa2VManVudHVZVHBoa1ZyN3Z2?=
 =?utf-8?B?Wk1ibGU2dk9mSXAwMk9XUUIwZXFLT0NqQU55OWJNSWc4akw4QnFrOFdQNkNm?=
 =?utf-8?B?ZW9xUG8rL0VoRGpkaW8zSjFhakxsT2UwZFJpZnRFTWxmd00vQU1RaVpuOVB1?=
 =?utf-8?B?YkpmR0p1czZITk56TnU0c2VPcHhhWGtJd3RrbDVYd3NvT0RIdEFic1ZsTEV5?=
 =?utf-8?B?MzFuYTBnei80YXFlSW1IQzZRNXZlVlk3ZTV6dnJpRU1aa0E5M0NTSVFvSGZY?=
 =?utf-8?B?d0tLYURnbGdCOFo1RFdhUlJybnVxTnZCU0NaZDQ3MFJLQmczbXo5SDlWNHB1?=
 =?utf-8?B?eE9GdGp3Z2xrYXJwY0RGVitLWnMyS0RVa1o2ODBDVmNzUG9samNCaTdVMlBt?=
 =?utf-8?B?VEYxTUU3dGJOZ1kwZXUwZUs2UnFLaWlyMVBUd1crVlNMN0xPZ2hsWDF0M2hD?=
 =?utf-8?B?UmxaSmx0bjNoci9la0pvemxmdDdkZ3BCcExzMWV2Ym92N1RUV3ZiNlpSa2Z4?=
 =?utf-8?B?WnZEUzZDblJGdG9Gb3lFZ3F1Sk03SENBL0xvVmczYWJmWjFpY2xqZUhXaXZJ?=
 =?utf-8?B?SVJPN1FsSUs4YUp4YkpzV1U2czFWUDRxUnlKb1hHSVFrWjdLM3VUSGlhZkFy?=
 =?utf-8?B?ZnRSOExlUEFpWTdPVm4vTTExcTVBTTdQYVhIVzROUjFyUDZIUXEwZnFWc3BZ?=
 =?utf-8?B?cUMrQ0JxcXF1RThuc2tjektzSEVqV05Qa1VxUjJHL0RuZjE3SmxpTEw0QWk1?=
 =?utf-8?B?UTZJSCsxYVBEdXpaVW9zQnRCclhBTDlXc2drcStLeFdzYnBndEdMQmkvZktF?=
 =?utf-8?B?LzZXcXVWOHcxc0k5anY1U0Z1QjJHMDRydVd2a3o2VDE3NTN2SE8vdFhBMnMw?=
 =?utf-8?B?akRreFc0Y2tNODFLRml0eFRKdFR4WENHdWQ2dlZSNjI5SXZUYWxua2JieVBi?=
 =?utf-8?B?eGtNeXpDend6ZldXVWx2cFhRNXpyTHVjK1ZCQnkvYURFMHY0WW5DYVB1eTFQ?=
 =?utf-8?Q?eG/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnF5Rkp6YVozVk5uNHFFOHBDYkVRYUEvUVl1OEpKeUNMaFBPWTRtTW9Md1RE?=
 =?utf-8?B?VUhzelhJOWlSVjk5RFRuREk0YmpKak9udWJ4Mm5XNzlFNkthb0tNYXlNQ1Iv?=
 =?utf-8?B?SFpKSm1IaU5aOCtyMDNSenNhZ3UxQXV4NGxZSVVhd295K0M2ZC9qcHh3Ylhl?=
 =?utf-8?B?N1JWNThCcWhMMG1oeExPUW05ZGtPUkxxbHdHYmlaTXJGUHQvdzRYb1BmUEtR?=
 =?utf-8?B?ZGd4MHZXNU1SYldhZU01Tk5JQW90NUJXMlBHUUNMdDR3a2Vpb0Y0M2QzK3NX?=
 =?utf-8?B?YXl4aHBoV3RDZ245amNuM0JoQlhTQ3dLOXB5SnZwNmhpVkFMbkw4UFZkdEZE?=
 =?utf-8?B?YXJLZ1VCVTl3VU5VR21YZXU2cC9MZXY5OEZlc2p2YW5oMi9jVndvZ2JxUncr?=
 =?utf-8?B?VjRtdjJwc2FzZlR6ejBJLzJZN0VNTkVTbStrTXIybkl6VW1SSVJTZ2JJWGJx?=
 =?utf-8?B?M016SEJaSFhQYnZUblRKMjd4V0xyOTRtS1p6VVVQSW5taDFISmtIcXJKdEZ5?=
 =?utf-8?B?UE1xV0ZEdzVKTUVIeEJpNEdUVE1IbUhtOENrSjdQUXd6NGwrZXo2TGhHWElU?=
 =?utf-8?B?T21TTFRyWTRmbkFjamxyWHdmNjBueksvWGthVWM1Q2R5ZFptYkNheVJ6SCtH?=
 =?utf-8?B?NEJKdXdQbDNpeG5pWjhpeEtBNnI5TXlaTENsdU80RVVkSThGTzUvSmlYNmFa?=
 =?utf-8?B?MytJWWNZZkR2MUdLTDlTQ3FaYzBDNGkvbGVzYk1yMFgrNU9JNWl5aVc5ZGFE?=
 =?utf-8?B?TVJ1bno3bFpKMmpab2hUZ1VoN0tsUzhHRjQwL3ZQTXRFSzJiUVk5TWZraUFr?=
 =?utf-8?B?TitMMHd0Zys2QkVsc3JFNlBIakxtdEd5Tk04L01Wam56ejIyTEZ6Y0JQaW15?=
 =?utf-8?B?S1UzWGttd2NMRU5YNEQrOGUyWTRQR3V6SEx6NzErcnh4VkxoSnpOWlRIZVRD?=
 =?utf-8?B?NmV0YW4rVGwrVHNQaE5BNkNnK3dXWUs5RHdRTEpGYW1LRmEzYnRiTlVlZkdF?=
 =?utf-8?B?OWpuVjZXZi9PWEwrL2kzSzR4V2VXNy9ud0pVMEZCK1hxNGJHUUQ0cEpZS0xE?=
 =?utf-8?B?Z1ZXbUt4dVV5NGNYVDZFbG5aUEFkWWNSZHJLWjFUU1JwM1l4NWlkbk40aUs2?=
 =?utf-8?B?Wjdma09FU2dvUFlUa3BsQmthVzlRL3hCR1E2ZGUzMWJlYWNaSlk4QUYzSnh1?=
 =?utf-8?B?WUVhc2hDUTluZXo5Q1YvVld5cW5va01UWStZR0ZLQklCRENnRndUNXBDUkpl?=
 =?utf-8?B?K244OUcrN1Z0U1hvc2dyZzVBZnMvcVpHbUdwSEdicjNsaUlqVUlCWnYvSDFm?=
 =?utf-8?B?N1h3eXBSYjArRllBeUU4Z0RrdTlqL3dmYmFHMXZRM01oN1UrRnArQnF0K1oy?=
 =?utf-8?B?VXFjWGl6QURqQkd0SjJiUk5tUTZlbmZVV2lsL3VDczlaNkd0OWdmVzF2K2o4?=
 =?utf-8?B?V1NVSUJxSjk2QlZ2dXl0RElBNFBkeTFCNjdKekFuSldGV2REQ0ZxZ09LTFQv?=
 =?utf-8?B?VGI3cTI1TTFwclR3YWxjQkZ3T1dzZVc0a3VIU0QyQ0FBUkhkTUdWMzUyMC8x?=
 =?utf-8?B?T09aUFBwNmxjRnZqVHRBbitzZjUzMmVBNDdOVUZMUGNtTWRseXgzM2tYRStS?=
 =?utf-8?B?NmFkWlZWMWYzSHZvRUNxc0k2a2pNZlkyRmY3RGZ0U21QL1FiL0dVYXR0SUFL?=
 =?utf-8?B?Y3IwS2ZlNEFBbkNOczFRcmJ6NEQvNUVLdkhJT2x5aG9aVVNwSWpEWW5zZmk4?=
 =?utf-8?B?NXVjRWlxd3BOYlFHSFZNRW83cVphV3RRM3RvWUROVUlhcnZxOXZDMjZNeThL?=
 =?utf-8?B?cU4xUXo5YTg0eGRVbURvYWxiYVFSbmtIa2g3eEpyTlBWaU91dlYrTUVMYkE2?=
 =?utf-8?B?SWc2aURiUjZGTW1nNzROVGlOVkNhdzVrUlJpS2NtSFloZlRBS21YcmMvV3JI?=
 =?utf-8?B?V0hQU2lWbzdrdENIUzVvTjRzOUc5anI1UFlhcnhZRkZPdzh2WXhUdUdUS01P?=
 =?utf-8?B?cDFQU0p2azNjd1A0ZlpNV1hWM2dQS3hqYTFPa3UwNkhnTjhTemJXTkt3alM0?=
 =?utf-8?B?Z1FQbTczQXpjR2NjQ3p1eUJLWU1yREl1UHVRQ09pRnpqL05lellhQ3pjakhk?=
 =?utf-8?B?ejZvNkFiUzgwekE2WThZZkNTSU51NVlOUmtNYUtteUtnRFowaGMvSjVKaFJu?=
 =?utf-8?B?NkpCLzJYMi9zdFpuQ3l4RldsYWVLSE1XRE5ZTE5wWU9JUEd1dFJNSElPSnpv?=
 =?utf-8?B?ZGIweHhXNE91NTR2TTBhUE82RHQrWjBCdnMzNDRaaHBrcUttVVlEQVExL21M?=
 =?utf-8?B?amVCTmdEa3ZsMUlNd3d0V3F0TGpkUUFGSSsrVGZHSDNjcDZDeWx4ZjFpbzNK?=
 =?utf-8?Q?UczV2jFJtrIz82Oo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fae95f-c437-409a-3bd2-08de5f951dc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:18:38.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvi/7dz3kvs4gVwgG4dXYkghxDw4G63HPxNHO2qSiWwVT17ghwTVMg05zT8CqtaPx1wj5eX/z/KbE9ZHsTcPBKw0VxtVxa4ydgWjZ3YEC4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7536
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



On 1/28/2026 5:57 PM, Maarten Lankhorst wrote:
> The previous code was using a complicated system with 2 balloons to
> set GGTT size and adjust GGTT offset. While it works, it's overly
> complicated.
> 
> A better approach is to set the offset and size when initializing GGTT,
> this removes the need for adding balloons. The resize function only
> needs readjust ggtt->start to have GGTT at the new offset.
> 
> This removes the need to manipulate the internals of xe_ggtt outside
> of xe_ggtt, and cleans up a lot of now unneeded code.
> 
> Co-developed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> Changelog:
> - Fix docbook description.
> - Simplify the vf_get_ggtt_info() flow and remove the shift calculation.
