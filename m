Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C4C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFED10E677;
	Wed, 28 May 2025 16:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awdiQRxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4D610E670
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748449103; x=1779985103;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rtRjtND1mYhwKx3XYJFeh8fmWJJReE20rF9j2fjx8+0=;
 b=awdiQRxchZOSy4hFTpDFIrp8QY7EPwiuc71TbsFrB25zEARUNBxcySnp
 giIUEXDVdjulFx6kfRZlqz6xuP/E59GhUmNisaTY0IZ5IKSfpp8if5EsN
 QtBqznoMYwNxRd/fbMMNUe+0BZMjzQNKq+OzXxGtpJkNR2yJVQCW8LSww
 ACpO88n2vGDxGemR1dJXtgqy5hb8KkAOqj437v0xqZznVOZ7YF7Hgny81
 ck56c1HiTQA+MnANB9TWoW8+r1QMumsvF+2bnkZdcZLvKLcaaaMBWC9bv
 qA4ro7hzbHQUGmGu/MEAaP4zHJTTU0JTaSxXhzZmnO/duGwK454h89u5w A==;
X-CSE-ConnectionGUID: oD0240keT5+I1azN/KJ3ZQ==
X-CSE-MsgGUID: FUBwrPXVQL++VsbS+OQnKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54290994"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="54290994"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:18:22 -0700
X-CSE-ConnectionGUID: Rr/7aVb9Qee8iBCROP9fYA==
X-CSE-MsgGUID: JkXU/5VSSW+UG0p8F5jegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143203426"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:18:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 09:18:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 09:18:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.59)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 09:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGT8hd41+tf6Mv6QiRKaaOBUzLJW2CwRPUk0phM2cQx4+DLrJzIFplb2xMwC59l3vwudaSFMHNW6ttCbpcchdVvMt2n61zDbKC9Om7op6Yz3FqvuZlV9AYuMte6dCtdoOwBKF8ntM7ZlygVWkq4EStGE0O5YdQESYywWEkiQBM2mNe1GhJJYmSb85yUp1hQe0jG+xrI86dqBeGq+RmWjMnKP5NWfKGWFEu3kjLv8Xm4mCKUbTTuwB2LQBokpCcKTfxHNGxv+tF6SXU0rDC4HHXwdxkHg/sEsqQCSh/WQ7r56c1MQCOnJMorinFNhByNr7jpC+II2oieTDMOl5VFfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsCGXzOCoahfU9lp57dXxXZ+Sbg5TKx4dSbc666mReU=;
 b=LFY/CYW/b2PxQic8S2JMW4fgztmxuPHNvDtB9TlRVPJtHh8kodnEKnqmM1wR7Ydh22S6wfjtOpvQHSuOfUWySV19tU/7DA5D7ftFCyBL0koPudVD5Z21T1DvA0bmCI4x26zfj4XcHEoG2N4fDIdrqsCpL3wI5Obr+2sqHLU3qS6VKhWaRI0hwTiIYLWNa93Kv0dMcpyfAABelS1z608FquOzBHBExAkZrz1EYaeYLeHk28hFCytm0YH5pvJuiK7jIlUI031Gbss1yvGFoeVJchGMNQRJ2IkjUHpAZKtKYM4uVMICQ0n3jEsHhkNlC4budY8hXwqmzILxRIMgcL53VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 16:18:19 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 16:18:18 +0000
Message-ID: <09292faa-4e24-4a1d-82ff-363aef33f051@intel.com>
Date: Wed, 28 May 2025 21:48:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/32] drm/xe/uapi: Add uapi for vma count and mem
 attributes
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-31-himal.prasad.ghimiray@intel.com>
 <aCUGXIya4wohGME5@lstrano-desk.jf.intel.com>
 <2d3beecb-2323-4174-9898-2f15ed700248@intel.com>
Content-Language: en-US
In-Reply-To: <2d3beecb-2323-4174-9898-2f15ed700248@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf388a5-927b-45fc-c627-08dd9e0341f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUtNai9iNjhhN21UK1ZJaHRxVDlCN0dxbXV6eTJ5Q3VOQVRlVHd2RlJjSHYv?=
 =?utf-8?B?MllGS2ZiRURyR01tRHRoWUhqc3RvQjlaUGFJbDZPZGFVenZlRjFFUW90QjBZ?=
 =?utf-8?B?OEhqUVNMWU1nZHRjTFFBZlRPQ0dGK25XcUJkVDk1bHpZYm0rQm54MWYvNlV2?=
 =?utf-8?B?Rzk5Mk8vUncrQUI3c2d3cWhiWmk3cU85bDNML3BoTkEyamU5YmxBcGl0MFM2?=
 =?utf-8?B?RjQ5MkNXWk01Q0UrMjRXdzhVUUhVVHh0blk4TkZELzlJVzVBaG1qem4vWXVv?=
 =?utf-8?B?VmJmeGpDQWpSOHdUTDN2d2RFMGtaVHcxdlF4bHZmM2lNbHA4ZVpVbDA3WjYy?=
 =?utf-8?B?MVR2OHZ4MSs2WlBzY3R3UEZOaFJ0V0JmQ0lqblB6MjlKSnFFckdpd2g3WWg4?=
 =?utf-8?B?My9PcW9wMUp3cmZrQ3BEdjlTZml4NjZxajA4aE1QbDdPM2JIMDRFNWd2bHc3?=
 =?utf-8?B?NGJCNUt3Q1k3eG0yeVpnbmVLeldnTFpiMTBBWU1XZXFtOU1ZQmZLNWxraEM1?=
 =?utf-8?B?YVArN21BdXZxKzVidUpORGlCWFFyVkEzOWFGWGFHQWc4QVQ4dzUxbWJVWmVP?=
 =?utf-8?B?VERHbmpjMkM2UEtrR1pTN1Q1eVpSYUo4b2NZbXlRRmk5NFRmWDdDUDJ4b1NT?=
 =?utf-8?B?OEtsSHUyMG5TeDE2SXplU0NtR3EyQTBpMEtrVml6d0p6bFBnL3llNVRsSVR4?=
 =?utf-8?B?OUtQdFNlSkkreTZkTkErbWhpaFJneDIyUUpBT29CWi9OSzZiM29kV2dDMmxx?=
 =?utf-8?B?YnY5bnJ1cDV2bjVEVkIvOXdaQkI0YS9PNWhOaEZsL2dqM25qMFVoVEtuRTVh?=
 =?utf-8?B?M3lwU3dGamlKWXFNanlibHI4ZXJyOERhZkF5UENicTJocmpSMnhmNDZlU2ZT?=
 =?utf-8?B?NGk1M3NvKzBSTUJjcXljU043TEs4WUROS0Q1elo3b3ZrVjRxSlFUNGlDMkg5?=
 =?utf-8?B?RHpSR3VNSjlYS1ZOSGpFOTRITVdDTW9vQXZYb2ZCRHBFT3pNdndHU1lHU3I4?=
 =?utf-8?B?UEc1NmpjYi9HbFJnVnAyMUJoM0xGNjYxWmZsMjkybVpqTUpCVXZlaDdqUEZ5?=
 =?utf-8?B?MG9LcDR4citSRGNTcFZuN29keVh1MWFTaHRHbmo2bzlxYjl5K08rSjI0bk5T?=
 =?utf-8?B?a2gvSDJWRHVHUDl6bExzcm1aeTlKWXlZbmY2bXFzYWRQemlqL2NzUllOZEov?=
 =?utf-8?B?RWJUTWNNRmJqZy94TTJBeDZDelMrY0hZRDhrcUlWczhFVjYyU0U4S3J1QU1m?=
 =?utf-8?B?bXk2V2lNY1VWRmV1MWlXS1dNYWcvYWw4ZjRhbHhEeUVCS0NXSlJjd0NWTE1w?=
 =?utf-8?B?R2hBbmIyTWxsRkxtRHpRMEhxMXVJVnZlWi9LSWNNSmRtK2k2cmpnYnppbkpI?=
 =?utf-8?B?dVlWVE9oNzR5N0Y3MktKaHRwZVBtYjU0L1lGSmZwWXJUYlpEeGgvODM4NVFZ?=
 =?utf-8?B?N3FRcWV1N1R1cFdCNEwrWXFUdzdxOTM5VFl6QTNNRWdZWHhKZ3FaN3g2M3pm?=
 =?utf-8?B?bTlvVC85aEd1alZwaEt1THlBV0huQkNQWEdmVkovS3F3bEdpSUExblJiMUhV?=
 =?utf-8?B?ZllyM0dtZU5yNXMzdzlOMXk4aFpqMmd5VVB6NmhNSzB2MitEY2IzNDR0bUNr?=
 =?utf-8?B?WTVPSUljT2FjUUw5NGw3c2ZmRjJvS0VSdVRPQVRHcHFwN1pURXJiQ1MzQ1Qv?=
 =?utf-8?B?SWU0UndyRWFydnBUQjdSK29xZTlBNjcvRENPbVRZLzN6M2JkbllXK2pZQWpx?=
 =?utf-8?B?ZWU1RGVtZDVKZXlYSTJMNnhDUlR0elZEa2R5cjlpeGFnWDhPR1AzdXJYc1d0?=
 =?utf-8?B?Q3V1Z3Rsb3YrdVhmaVF2MkVFMC9PZi80SWZSdnN2b1dNM1lSWHZtK2xhL2Ra?=
 =?utf-8?B?UUdyMG94WEdaMmtCRFpUSkhIOHBGazhaMGpJRGtLTUl4RXcxZFlIWVpOc3VO?=
 =?utf-8?Q?6b6smrsDcvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlXTTlYVWtEbzVmY0dnZXlJVjlFdGE5TXNkYWRuRENzSHhkZ1JteUhPOWt2?=
 =?utf-8?B?UFh2MGlTcEFoSDVEV1JvaGk1cEpHbVgyV1ZnTnRmRG8vWmlmKzZaSHVmcjFQ?=
 =?utf-8?B?bmI1eEVXNTNFUnRCTnNrVDBtNkpROWN4cjE0T3BORzlpY0hBa3Y4YmdkK0RK?=
 =?utf-8?B?Z3RVV0c3dTRtRnhaazQvZ3hGM3R3ZmdidVJPSnZXZlovSDlaZ3NBc2NJWnJM?=
 =?utf-8?B?VkVyQzFreFd4WUE5ZGQyZmpnYWMyQW9XNkJtanEyS3YrUFBtU1FqTUxzMXht?=
 =?utf-8?B?amlDNFQzd1RraXQxdmtuTG9iNmlqNFdCUUN0eGFXQWUycnJRYTQwYnRqMDJ1?=
 =?utf-8?B?S2I4cnJqR1YzK0lMbElBb0F1Z0pJc2J5WjMwMGNKVVQ4amMzVCtRQ0d3K0dD?=
 =?utf-8?B?WDJ1RGh1L3lyb0V5VnNBWHd6cVZGcC8yTjRocVQ2UjRhZTBqS2NiUDBHTzZj?=
 =?utf-8?B?RHI1dW9wcFlOR1piWk44N1NPTVF2SU5uc3M0YkM4Z21reGVMajJtVkxMVnFE?=
 =?utf-8?B?WmJJYnhQMThweEdLOW5QRjhwd1cyTjRWMGwrUW1HdjRETG1RalUyK0d1RytZ?=
 =?utf-8?B?KzJqelY2czQzd2pESVBET2UzaElscW1Ha3A5eUZaSUxHVFBrZHFnS0hRdXAz?=
 =?utf-8?B?ZHMzUG54NC9xdWQ2c3d2UnFlZ0RIZEVrekN3d21RL2xaZ1lYZjRFZEYwR09t?=
 =?utf-8?B?QWlxbHBZei9iZnAwNVhiQytVR00xeC93SWlGVE9qeXRZOXJEV25KNVBKZkdU?=
 =?utf-8?B?QkV3VHlNWFo2TGtrU2VOZmF6YW84ZDVwR01PY2V1aTlrMGtwaXNGckJ4M01o?=
 =?utf-8?B?Y3NHRWV6NTFjNzcxRThJaGc4dGREblBOa0RXMG5BR3N6YkJrbDVaMGE3dks5?=
 =?utf-8?B?VThqVXNGVU45K3FaQjIrWmVIb3lnZjhhQVFTayt0T2lxVzlydnBJaE5FWWZX?=
 =?utf-8?B?UnFRei9pL0p0OEtweUxaVUdDcXdNZFRpMDJhNkJJZEw0SStOZjNpV256Z3dH?=
 =?utf-8?B?OFBUSkZxcmJSeXJkdW1kWTlYMk5WdG1EMzFpaHFmSzVCTTFVdS9tS3h1cWVy?=
 =?utf-8?B?QktudzFXTlAxSkg3b294NFp6eHNSOHB0dHVneDhJRUIrcXpocS9LdWdZZ0pF?=
 =?utf-8?B?bzNhWW5MNmgxQ2RVTzJrTTZYQk5mclBEUHhIQzFZWnJSNGc0dzNYS2hQaWxz?=
 =?utf-8?B?ZE5xcGFIOWhlTDREQjNzRzl4QTlramR5Q0szNlFMUlErWVljcjhhRG4rWEp4?=
 =?utf-8?B?UDEzbVg2cU95aTZHNHVRc2VqSGtUa0Y5cXFDTkN1YzNNQzEvYmk1dFFDaXJy?=
 =?utf-8?B?YnpqUXZsdVpaOThJOG1rdE13dmkxWTlCMG02dFRLUk8xOEQ1M3dvaGpRV3Zt?=
 =?utf-8?B?ZEcvOUhzS3cwTTBCUTNBbWtXYkNYM1RuS0lCZWw5b253cCs3dXRMZ0lRWXRI?=
 =?utf-8?B?S3k2dlNkMlBJUlQwZ1BjTW81RUM1WjZYdUVabktFSGkrSXdLMDFNMC9Ydktz?=
 =?utf-8?B?RHI2VWZINmJSWEZGMG1LVGxQekVjeFlPTW1TMEpnZ1BaQ2NVRTc3K0NJM0lR?=
 =?utf-8?B?OVV4UG5UbnR2U3pMVVQ5WE56N2ZJcHU0QVFnSUJaelk2L1FyNW1mdHgzeXpZ?=
 =?utf-8?B?bHRHNkxsMFdpRHVvRk1Ea3B5dGNWdm9xVzg3NTBxeXZRNGRtUmQ3VlJKd2pP?=
 =?utf-8?B?NWxBN3hUSXRRRlh0RS9GeEZtNkxESzJJNGFGdFpwR09IRE53Wm1QRjRzd2pN?=
 =?utf-8?B?ZkJKM29Zc0cxWWtVdzZEUVJ6ZGR6c1hpUXhWbzFEd1ByNW1VUkw0dzFnRkl2?=
 =?utf-8?B?c1pJRGlRcTJYdDJqWFQwQWg1SmZzOGRscUNJbjFMdjZQQVoyQlY2ZWZwTm44?=
 =?utf-8?B?ck94TFM2TElScUdkemFzK1ZPWkovQmg0OWJTSWVKYno3SEJuYUxIaGdnaUpN?=
 =?utf-8?B?UFlGbnBWK2NwRjJNWlg2cFRnV05yOFE3Sm1ycndRUXk3UmlRdGVMeEdWM0VN?=
 =?utf-8?B?cVRPbkhWM0RKWjFBSUdBeW43dFVwSkp5dW5TTlpFd3dHakVCUEV5aFVGWU5K?=
 =?utf-8?B?TnJIb3g5ZWt1VWNxblFXVHc4YXRvVkhpZjJmYUxBdllFeWp6eXRlS0JvVkZS?=
 =?utf-8?B?b3V3K3N2d1lYR1EvNmQyOC85T2N1Z0k4d2sveWdhZUhZTStlYlh4K2lhSm9J?=
 =?utf-8?Q?9a+VB7hwTeKPLELyLLB/mf8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf388a5-927b-45fc-c627-08dd9e0341f3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:18:18.8754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfxuIg+2DD7PdDfI9bN1QrTShTfwPJntapeIucCk5x3+SeECLDnMbBA29ycTfdzzFscMyPMFcjT0CUBHOiL5H02MW3FDRjCk1cyFeb3sVpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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



On 21-05-2025 14:24, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-05-2025 02:38, Matthew Brost wrote:
>> On Mon, Apr 07, 2025 at 03:47:17PM +0530, Himal Prasad Ghimiray wrote:
>>> -DRM_IOCTL_XE_VM_QUERY_VMAS: Return number of VMAs in user-specified 
>>> range.
>>> -DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS: Fill VMA attributes in user-provided
>>>   buffer.
>>>
>>
>> Replied to wrong version eariler...
>>
>>
>> I can't remember if we landed on if this is needed? I thought the answer
>> was - no not needed.
> 
> Will hold on this, till UMD confirms whether they need it or not.

UMD confirmed, they need this. Will add changes to support this via same 
ioctl as suggested.

> 
>>
>> If it is needed could be make this a single IOCTL. e.g. Call in once
>> with num_vmas == 0 + NULL vector, IOCTL returns num_vmas, then called
>> again with num_vmas != 0 + non-NULL vector. Generally we try not burn
>> IOCTL numbers, rather overload functionality.
>>
>> Matt
>>
>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c |   2 +
>>>   drivers/gpu/drm/xe/xe_vm.c     |  94 +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_vm.h     |   3 +-
>>>   include/uapi/drm/xe_drm.h      | 115 +++++++++++++++++++++++++++++++++
>>>   4 files changed, 213 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>> xe_device.c
>>> index 3e57300014bf..968c24c77241 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -198,6 +198,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>>                 DRM_RENDER_ALLOW),
>>>       DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, 
>>> DRM_RENDER_ALLOW),
>>>       DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, 
>>> DRM_RENDER_ALLOW),
>>> +    DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS, xe_vm_query_vmas_ioctl, 
>>> DRM_RENDER_ALLOW),
>>> +    DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, 
>>> xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>>>   };
>>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, 
>>> unsigned long arg)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index e5246c633e62..f1d4daf90efe 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -2165,6 +2165,100 @@ int xe_vm_destroy_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       return err;
>>>   }
>>> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data,
>>> +               struct drm_file *file)
>>> +{
>>> +    struct xe_device *xe = to_xe_device(dev);
>>> +    struct xe_file *xef = to_xe_file(file);
>>> +    struct drm_xe_vm_query_num_vmas *args = data;
>>> +    struct drm_gpuva *gpuva;
>>> +    struct xe_vm *vm;
>>> +
>>> +    vm = xe_vm_lookup(xef, args->vm_id);
>>> +    if (XE_IOCTL_DBG(xe, !vm))
>>> +        return -EINVAL;
>>> +
>>> +    args->num_vmas = 0;
>>> +    down_write(&vm->lock);
>>> +
>>> +    drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, args->start, 
>>> args->start + args->range)
>>> +        args->num_vmas++;
>>> +
>>> +    up_write(&vm->lock);
>>> +    return 0;
>>> +}
>>> +
>>> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
>>> +             u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
>>> +{
>>> +    struct drm_gpuva *gpuva;
>>> +    int i = 0;
>>> +
>>> +    lockdep_assert_held(&vm->lock);
>>> +
>>> +    drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>>> +        struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +        if (i == *num_vmas)
>>> +            return -EINVAL;
>>> +
>>> +        mem_attrs[i].start = xe_vma_start(vma);
>>> +        mem_attrs[i].end = xe_vma_end(vma);
>>> +        mem_attrs[i].atomic.val = vma->attr.atomic_access;
>>> +        mem_attrs[i].pat_index.val = vma->attr.pat_index;
>>> +        mem_attrs[i].preferred_mem_loc.devmem_fd = vma- 
>>> >attr.preferred_loc.devmem_fd;
>>> +        mem_attrs[i].preferred_mem_loc.migration_policy = vma- 
>>> >attr.preferred_loc.migration_policy;
>>> +
>>> +        i++;
>>> +    }
>>> +
>>> +    if (i <  (*num_vmas - 1))
>>> +        *num_vmas = i;
>>> +    return 0;
>>> +}
>>> +
>>> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, 
>>> struct drm_file *file)
>>> +{
>>> +    struct xe_device *xe = to_xe_device(dev);
>>> +    struct xe_file *xef = to_xe_file(file);
>>> +    struct drm_xe_vma_mem_attr *mem_attrs;
>>> +    struct drm_xe_vm_query_vmas_attr *args = data;
>>> +    u64 __user *attrs_user = NULL;
>>> +    struct xe_vm *vm;
>>> +    int err;
>>> +
>>> +    if (XE_IOCTL_DBG(xe, args->num_vmas < 1))
>>> +        return -EINVAL;
>>> +
>>> +    vm = xe_vm_lookup(xef, args->vm_id);
>>> +    if (XE_IOCTL_DBG(xe, !vm))
>>> +        return -EINVAL;
>>> +
>>> +    down_write(&vm->lock);
>>> +
>>> +    attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
>>> +    mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct 
>>> drm_xe_vma_mem_attr),
>>> +                   GFP_KERNEL | __GFP_ACCOUNT |
>>> +                   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>> +    if (!mem_attrs)
>>> +        return args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
>>> +
>>> +    err = get_mem_attrs(vm, &args->num_vmas, args->start,
>>> +                args->start + args->range, mem_attrs);
>>> +    if (err)
>>> +        goto free_mem_attrs;
>>> +
>>> +    err = __copy_to_user(attrs_user, mem_attrs,
>>> +                 sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
>>> +
>>> +free_mem_attrs:
>>> +    kvfree(mem_attrs);
>>> +
>>> +    up_write(&vm->lock);
>>> +
>>> +    return err;
>>> +}
>>> +
>>>   static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>>>   {
>>>       if (page_addr > xe_vma_end(vma) - 1 ||
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index 377f62f859b7..0b2d6e9f77ef 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -193,7 +193,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, 
>>> void *data,
>>>               struct drm_file *file);
>>>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>>>                struct drm_file *file);
>>> -
>>> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data, 
>>> struct drm_file *file);
>>> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, 
>>> struct drm_file *file);
>>>   void xe_vm_close_and_put(struct xe_vm *vm);
>>>   static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index ab96dee25f6c..177ee3a1c20d 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -82,6 +82,8 @@ extern "C" {
>>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>>    *  - &DRM_IOCTL_XE_OBSERVATION
>>>    *  - &DRM_IOCTL_XE_MADVISE
>>> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS
>>> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>>>    */
>>>   /*
>>> @@ -104,6 +106,8 @@ extern "C" {
>>>   #define DRM_XE_WAIT_USER_FENCE        0x0a
>>>   #define DRM_XE_OBSERVATION        0x0b
>>>   #define DRM_XE_MADVISE            0x0c
>>> +#define DRM_XE_VM_QUERY_VMAS        0x0d
>>> +#define DRM_XE_VM_QUERY_VMAS_ATTRS    0x0e
>>>   /* Must be kept compact -- no holes */
>>> @@ -120,6 +124,8 @@ extern "C" {
>>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE        
>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct 
>>> drm_xe_wait_user_fence)
>>>   #define DRM_IOCTL_XE_OBSERVATION        DRM_IOW(DRM_COMMAND_BASE + 
>>> DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>>>   #define DRM_IOCTL_XE_MADVISE            DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_XE_MADVISE, struct drm_xe_madvise)
>>> +#define DRM_IOCTL_XE_VM_QUERY_VMAS        DRM_IOWR(DRM_COMMAND_BASE 
>>> + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)
>>> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS    
>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct 
>>> drm_xe_vm_query_vmas_attr)
>>>   /**
>>>    * DOC: Xe IOCTL Extensions
>>> @@ -2063,6 +2069,115 @@ struct drm_xe_madvise {
>>>   };
>>> +/**
>>> + * struct drm_xe_vm_query_num_vmas - Input of 
>>> &DRM_IOCTL_XE_VM_QUERY_VMAS
>>> + *
>>> + * Get number of vmas in virtual range of vm_id
>>> + */
>>> +struct drm_xe_vm_query_num_vmas {
>>> +     /** @extensions: Pointer to the first extension struct, if any */
>>> +    __u64 extensions;
>>> +
>>> +    /** @vm_id: vm_id of the virtual range */
>>> +    __u32 vm_id;
>>> +
>>> +    /** @num_vmas: number of vmas in range returned in @num_vmas */
>>> +    __u32 num_vmas;
>>> +
>>> +    /** @start: start of the virtual address range */
>>> +    __u64 start;
>>> +
>>> +    /** @size: size of the virtual address range */
>>> +    __u64 range;
>>> +
>>> +     /** @reserved: Reserved */
>>> +    __u64 reserved[2];
>>> +};
>>> +
>>> +struct drm_xe_vma_mem_attr {
>>> +     /** @extensions: Pointer to the first extension struct, if any */
>>> +    __u64 extensions;
>>> +
>>> +    /** @start: start of the vma */
>>> +    __u64 start;
>>> +
>>> +    /** @size: end of the vma */
>>> +    __u64 end;
>>> +
>>> +    struct {
>>> +        struct {
>>> +        /** @val: value of atomic operation*/
>>> +            __u32 val;
>>> +
>>> +        /** @reserved: Reserved */
>>> +            __u32 reserved;
>>> +        } atomic;
>>> +
>>> +        struct {
>>> +        /** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>>> +            __u32 val;
>>> +
>>> +        /** @reserved: Reserved */
>>> +            __u32 reserved;
>>> +        } purge_state_val;
>>> +
>>> +        struct {
>>> +            /** @pat_index */
>>> +            __u32 val;
>>> +
>>> +            /** @reserved: Reserved */
>>> +            __u32 reserved;
>>> +        } pat_index;
>>> +
>>> +        /** @preferred_mem_loc: preferred memory location */
>>> +        struct {
>>> +            __u32 devmem_fd;
>>> +
>>> +            __u32 migration_policy;
>>> +        } preferred_mem_loc;
>>> +    };
>>> +
>>> +     /** @reserved: Reserved */
>>> +    __u64 reserved[2];
>>> +};
>>> +
>>> +/**
>>> + * struct drm_xe_vm_query_vmas_attr - Input of 
>>> &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
>>> + *
>>> + * Get memory attributes to a virtual address range
>>> + */
>>> +struct drm_xe_vm_query_vmas_attr {
>>> +    /** @extensions: Pointer to the first extension struct, if any */
>>> +    __u64 extensions;
>>> +
>>> +    /** @vm_id: vm_id of the virtual range */
>>> +    __u32 vm_id;
>>> +
>>> +    /** @num_vmas: number of vmas in range returned in @num_vmas */
>>> +    __u32 num_vmas;
>>> +
>>> +    /** @start: start of the virtual address range */
>>> +    __u64 start;
>>> +
>>> +    /** @size: size of the virtual address range */
>>> +    __u64 range;
>>> +
>>> +    union {
>>> +        /** @num_vmas: used if num_vmas == 1 */
>>> +        struct drm_xe_vma_mem_attr attr;
>>> +
>>> +        /**
>>> +         * @vector_of_ops: userptr to array of struct
>>> +         * drm_xe_vma_mem_attr if num_vmas > 1
>>> +         */
>>> +        __u64 vector_of_vma_mem_attr;
>>> +    };
>>> +
>>> +    /** @reserved: Reserved */
>>> +    __u64 reserved[2];
>>> +
>>> +};
>>> +
>>>   #if defined(__cplusplus)
>>>   }
>>>   #endif
>>> -- 
>>> 2.34.1
>>>
> 

