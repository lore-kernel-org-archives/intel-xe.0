Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B3CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 15:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8210EC48;
	Fri, 10 Oct 2025 15:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISUzNCBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485E010EC48
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760108756; x=1791644756;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xap4xMejYaLzn1U2+jUbPq0qhBZgLey2acVlmsajzAw=;
 b=ISUzNCBQ2uQ30ErHZlxGlk8Ufbvcjflnxcoa/ykUAE+Aa+poAKQ87SqX
 lVzpTEvEqAUYk5WxUh8vvqZNhRqDvuQuzJXYiPxDQiqrNlR2R47qVnscX
 iaNOzPvitgeCuFmup/chhdShLCaVKvpvLOxwhTNbxjEnozxSbWij4lwVX
 0GEsxv4A4pKwj21dI4nGNvVy7nsc8Dd+yHOakiiEeS7+a0VlheTNcMu14
 P8ovo1diuJsa5y5bVxuRjlpkFgZhBmCElWNHHM/XdcgStV40a6LQ1KchR
 RmsCWw3GXc/6Z623iYGQ+l6q+n5Ja+XzAMk2KOIxjH9zaBZrx+/+2s9j1 g==;
X-CSE-ConnectionGUID: b5aWmB5aQVO7oWPWUOgF0w==
X-CSE-MsgGUID: I3zgyqm3Q5mPuwmOg59n+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="87789493"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="87789493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:05:56 -0700
X-CSE-ConnectionGUID: oCI5F5fmQdGttmjePxvoWw==
X-CSE-MsgGUID: Ha25wJtTSz6eKxUvYQRWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="211943625"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:05:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 08:05:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 08:05:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 08:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdZeP/ikUNh6EKFG/wovYFbIa6VmX7dhT0bpKDiWTxoD5oitU1oe69OPooaXfNT6aXhFRy40VXoB8lIYd7Iw7fD/1NbWVaRFfq5R/+ln3HbdjddI0k5YpD2GbFmSxF49Hzudy/E/txT5xy8yTKd3BLAoriMXcC2yjexm5mL67FxcBN66MCYOsq4kA+ztT5dsRfKXjEdzd34ZLA0qpeN+Sz45xV9EKMOEZc0mathWMe3Igxj/0L+7NiEK2d+qJ+oWZvuJlKcpY3InUlny0nRJ+QJYC/sHamRqAkBjK0uZcMszdZ7GoaNiDQmbh46L7FSC6gwf3JCPuY2E05yF6z58KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDpgHryMnAH/Y34DUZSjmohM4amk8fPnWSOSQ1tSwi8=;
 b=eIsF9slXtIrLvDFw9gHbe1kJhT9KoTX8GE3/7vF+LQiDpXHj0n2NquTRtTPc1khbY2PEu2Uj8Kej6FSfbi7b542GoqmHf2L+nQYgfVEmGdsYvvczB5YU12M6of9M+02hBG3EKR7SJ81oN7Vi7KDQdsdff2kCxQuhwOZMaT12+Tl8K8dhw7ka4UQ/EnBtNqspwBBJlXcEQYZ1tx99OyJK8pEz64LOU4zPx3FPp1PW9k6MC3ft0EKZ3PS0SsSr4SvjaMC5kHHzw0fFzoTv3MFsswD19GiFORDU8RyorI1AVS1Fem+Fg5sRpIooXaY0FOg7uGEmt7ecrn/r8M3FvydKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 15:05:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 15:05:27 +0000
Message-ID: <effaed91-6b8a-4445-8a13-63ff3b9bff8d@intel.com>
Date: Fri, 10 Oct 2025 17:05:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/xe: Move struct xe_ggtt to xe_ggtt.c
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-14-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251010120655.1046007-14-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:802:2::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6377fae8-7c4b-450b-64a6-08de080e71f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHFZSkhKNDNPQjR5czkwaUNwekFQbjRLSVN2QnBNZkcvTUhIWFdJeGFZU2pw?=
 =?utf-8?B?aytYblpkSnlyaFhDckZWd3NNUytKRGpXRElKWEZ0Yms5RzB6a2FMV0dGUWJu?=
 =?utf-8?B?eHM0WmZYWlFGZk9JOHU0VUt6NzZUdjdlSjdFUG9IVU5WN1loUk1rMnV1aHpR?=
 =?utf-8?B?LzV3WEVZUHdRWGNMTCtxWThRQlpRWHlUS29sQXFTNjhvTWV5RjUrSkdBQ3Jw?=
 =?utf-8?B?b2FhcmxDcllkM3JKNVRsS2hmVHk3MWVnRVRXUCs3eVNGSlZaNXhHWGE1UUhS?=
 =?utf-8?B?cTY3cHc1UEhsR2dDa1QvWlpvYVpPcE1rc2daaWt0NnNnUWwvNGhjSVU5cWZw?=
 =?utf-8?B?RlNOWmg2eFZTWWVCSzkwTE4wOXN6TUdyQ0cybWllYXF5VkVZbGFXUUZza1Nm?=
 =?utf-8?B?Z2J0anlnVUhURERncnZIUDZwQVo5aUpwbkhWT2VJMUtDWVJqUmExVGlvSzI1?=
 =?utf-8?B?VldnZXlNWlF6RU9iSkxhd1RSNkUxakYxZ3lKdjY3aTVGeE1wdm5ORWdHd1Nl?=
 =?utf-8?B?K3k1azJtT3NtdDYzWjFDVTh0cnp0WVhDS3pibStmRExHbktweFVSRFlGdGU4?=
 =?utf-8?B?WEI4bkNGaU80Y014STVnNFc0V0dUejdLc2M1WmtRdW5MVHhVTE5YemdYQllr?=
 =?utf-8?B?bGI4NDgxdVFjMzRLcU9GYzlQWkd3VGZtOSsxbCt4RFNHZnVPZkFHc3dQQ2RM?=
 =?utf-8?B?Mmx1cmZxeFg5Vlord3c2cVlVL0RtNFNKVSs2cWxpQWRsQ2NIaWxmSkxTK2RZ?=
 =?utf-8?B?Si9HSjRiUC9YUlMrTE9WYkgreVVXOWpGeHhOcFJ5U3hIR0xPeU9IWGxkbEpX?=
 =?utf-8?B?ZzhwY2o5NWhLRXYvSlgxYkRNTlZXSU4zMS80SGV2cWhTcGlGTld1YVpXODBq?=
 =?utf-8?B?N0ZubWtsZHJPQlg1UXQvaHhqMm4vbEhPSnFwUmJoSG9vcGJrUjZlUnU2MXlN?=
 =?utf-8?B?NDFHd1FjakFFdndxL3lyU1ZJeXc1TjBJMDJHUGY4RE5aV0thWkdjdUw3elpP?=
 =?utf-8?B?czF0aFZudktLcVV6QWNqVHhaK1NHTnpseEE3Tys5RzRzaGRvL0syRWtCMVR4?=
 =?utf-8?B?OEZDV0xCMHAvYlNIYTRoZkQ5Q0t6NEFDS29BQ2JYdmNBVHVJNEluak5NTXo1?=
 =?utf-8?B?VVY0V0cyakY5QW1hYVcvZjZqY1M0TStCaFdMYkhjOXExVnFFUWFHTWF3Tklu?=
 =?utf-8?B?enRsN1luVHo1OW9hQkVlbFRsQkU1TVJIaWM4dDg4L291UFV4OUNRR3Y3ZnBa?=
 =?utf-8?B?T2o3Z3h5RjJRL0o5KzFNdmFUeU1lbDRQdkNaYUREeWx3Z09VcXBISEdQa1FS?=
 =?utf-8?B?MjNRaWo3UHNnclIrZ1drQWpMamRsK01LUlhpVU5XbjQzRExjNGZMZkhGVU41?=
 =?utf-8?B?KzdrY1F1QzUrWUMrMEg3K0VaOXV0dVFLdWU2OEkrUi9rZ01Fc0MyMllvNEVz?=
 =?utf-8?B?YzN1cDRwRUEyQkZnTit1ZWpUYzk1czgvdll6aDJkazE0cFZlSUVnUk9Ebis5?=
 =?utf-8?B?RlBmK3VrcThTNDBhcVJFMFp6aElDakwzQmlSSkJwVWMvb0pUZWRobXJlVXFZ?=
 =?utf-8?B?UXdKay82R3BCMlRHMFVvd1dDckdxbkJnVTlxMU9LRmxrRjhHY1p1TTdUZlF3?=
 =?utf-8?B?cmhtcG9UMm5qN3VSOHZ2MnpRQlptR1hGOWhhT2lXSXFEb3BodXVVS01DVkJr?=
 =?utf-8?B?eEJic25IWG80ZmYvTjJ1cFFVdm9EaTdYSktnOXo2WmkvYjNtMk4zdTZESVQw?=
 =?utf-8?B?cStCOTU0M0FvUkVkb0hRWkV6NmJHaVgxZWE0aWJRek1oNmtONnd6cG1maXVI?=
 =?utf-8?B?YUtxODJMOFVRbnVPa3JFMzMrdnkvVGRqQksxMWlyRlNQSWZJb3YzekVhUVRG?=
 =?utf-8?B?Vm93SkZ3V3BBRmJRb1dpeTdxNlQvSThkdjZ4Zjg2OWhEbUhqeDFSa2ZIVUFp?=
 =?utf-8?Q?zhO4bkpwq76AlMyfIpK1Al4C7vZ2b+zZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpybEJRSGtDdjkrQjB5QTF1QlZoVURteFhoVjdhVzA2UXA5RExkQlRtbUk2?=
 =?utf-8?B?QVgzZHd4WDNOTmF3UGhlUjluL0J6czVCUzZlSFUyVStaVE9ocmxzbit1NFk3?=
 =?utf-8?B?bkVWckI2RXJ4WHdmL3FWRDk0RW9zWHRJajdVcXdBbmhudTFlMTNWYmlvUXpt?=
 =?utf-8?B?STNQY2xvZXVEVjlrTzJ5aWZOd2l5dSt1L3dTTVdEbFdnKzZlbjZFZGNnWTAr?=
 =?utf-8?B?TUF4aVpSc3B4aDZhdm1QNnNpc0ZLVnBTSDY4MDFNSFE1SlhQRkdGUFlveWJ2?=
 =?utf-8?B?UkdZbU5OejZLUU1qeGNhVFpac3NQRjVhSzVKNGorWVhqY2VRajRCc2w0ejhR?=
 =?utf-8?B?enVyQ1ZiQXI5REZFUUY4OTdieW1MVVVVMzVXTEtoZko2WjZjM0NyVFEzV1ZD?=
 =?utf-8?B?bittaytDYjJvbjkyMjZUYTdoZU1QeitCK0lPUTZDRXg1UUlDV05pSC9rMlpu?=
 =?utf-8?B?bS8wYTNCOGZQaC9pNFNHTWNtMjVIc2R5SnQ5OUQzUWNiQjdBWkFpV2xjYVZU?=
 =?utf-8?B?aDdlY2tVUzlPbzk4Tyt1aFhzYUREcWxhczhibld5ZXZEK3UzOVJsQUwvRUds?=
 =?utf-8?B?b09xdDFLbmxaaXlzWXdxN1pwNW5YMnBuNkVuSHUwNmRERkxwUlJmc3BOejdr?=
 =?utf-8?B?aXRpODF0ampOVWVjS2REbWhQZHhRbmpwNURtMVU3Mm9pV3VHNjI3a3pVK0JP?=
 =?utf-8?B?dEV5djFzdWh5RXBzdkZFd0RiTWV6RStONGFFamxqdGRKbStreGRsTDNITjh3?=
 =?utf-8?B?NWh4cnRHVzlPc3RhVkRFRC9JcmNmL2U5NFpKdzRYci8zM3lEa3E1TXRlWHN6?=
 =?utf-8?B?TUFiVjZlNjZLTVVBMWs0cGlHcEwxQXhndjVEd01CN1p3eDkxaE8rNG85bjFZ?=
 =?utf-8?B?MUhnV1BLaE9pN3MvUEpRVFBQeW9ETTY2ZFZQeGhmSUM1dWNQZU0vTGFLMWFt?=
 =?utf-8?B?YU5ZRG1XWWxwL3NDVjJaZUI4cE8wWjVpOXI3WFVMSFlOS2xzaVo2VDNMdFFB?=
 =?utf-8?B?b3ptV2x2TEc0bEpEZitqMWx4K1FubytlWVZrbGZuUVZHNHFRRy9rTVJEcFdv?=
 =?utf-8?B?VW56NnNCSzN1QzIwNXZSUnJURFBKbXNMaWFJMkFSRi9qWTRTeDhRbC9uTHdu?=
 =?utf-8?B?aUI3cFM0dzFBdGl6M2xFUjEzbVlOR1dHN0VGeVFnY0dIZDFvcXpWRy9YRmlv?=
 =?utf-8?B?T3lQeDRUbDFyMXVVRk9WZnhhelR2SEhtSk43VGhiUWdVUXVNYlJMbTlqbFJ3?=
 =?utf-8?B?UHI2MnBVUVlLYVRpWHR4VXFhQU1aQ1dTTWtSMHMySnNxdTBzN1MrRmhtZkpJ?=
 =?utf-8?B?ZDkzTFF6dWVqNEdMVkRvU2ZLT01ldkFPY1JqNVU5N1ppblhCUTYzMS82NFpt?=
 =?utf-8?B?TjBTbmJKcmdUaklHQVdpczhOTUd6VFdLWGM2L3YyREIxQTVHbVdjQ0RGTXhj?=
 =?utf-8?B?eGlwSzFwVzM5ZldjWDVBaDhlcVk0NWFSRkRHa2ZVaTZ4b0FNTEp0TlRadHJB?=
 =?utf-8?B?ZU9RSmZkeTlyRXp5OTNzanR1anZjL2dOdXhTU2NMZ3lvQVR0SmdKVklnRWNv?=
 =?utf-8?B?N1FzeHBwSDNDSUY0Vnc3K3dFemtwMzhFNE16dVZoTStWTXFRcE9kK1ovWElp?=
 =?utf-8?B?K3lPTHF3aTRVUHl3VktlS1RlTGs5SzBoU29oQktveDlOWTZ0Qk5rTEFmWUo5?=
 =?utf-8?B?MWpmaEl6YVVzeDQ2WmIxZlFQVSs4ODJySklrenRDVXlLUGZIdkFDVDRjQzFR?=
 =?utf-8?B?NlI4S1BBRkRaazJGa1M4MmNvcVl0MDRCbXhvRzNNUDgyUE1nTmVrMXE2dTVC?=
 =?utf-8?B?Y0p2UnorM0dKcDh5d1lRdlRqZ2tLcGMzTHF1dG1lbGNXQlFhVStsSk5jZkxP?=
 =?utf-8?B?QjB5VXBtbzlYSmV2YUdlL2NxdTkxSk9IRmpxd0pweU13S2xPYzlGSXNhT2lz?=
 =?utf-8?B?dmVQZzUreWRuUjlmb3RxMi9SWElxalA5a0pBaW9NeGdOZ1cvODkwb2pHN2lY?=
 =?utf-8?B?WXd0MXgrRzNFVTVaTm5DZ2pyR1JZWGcwRXZGNDJxY21qUHp2aVZ2L1Zoa1Qy?=
 =?utf-8?B?UC9xYUxCREpYOW9rYmdpV3c3ODdxTG9sV0N0UnNBZnd1MWlkTVZ0Y2VBTjJS?=
 =?utf-8?B?Ny9HN3Y1MEtoZnd4THNsL2NSa3ZxQmF3MGRjZ3RZUXROUzJXR3ppWVFRYTZN?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6377fae8-7c4b-450b-64a6-08de080e71f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:05:26.9504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrQZMnnyWoj+d0ktPhGHYL9+QxsGx4qOktofuXHYVALwlgS2kgtZgdEOpoF8RUd5pQAkeQ0SqncgD6FQZ7J+Qb/RyrAqisBy0XVR+z7StXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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



On 10/10/2025 2:07 PM, Maarten Lankhorst wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> No users left outside of xe_ggtt.c, so we can make the struct private.
> 
> This prevents us from accidentally touching it before init.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 52 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt_types.h | 51 -----------------------------
>  2 files changed, 52 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 25f931e4b73a4..6118278c0b59b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -67,6 +67,58 @@
>   * give us the correct placement for free.
>   */
>  
> +/**
> + * struct xe_ggtt_pt_ops - GGTT Page table operations
> + * Which can vary from platform to platform.
> + */
> +struct xe_ggtt_pt_ops {
> +	/** @pte_encode_flags: Encode PTE flags for a given BO */
> +	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
> +
> +	/** @ggtt_set_pte: Directly write into GGTT's PTE */
> +	xe_ggtt_set_pte_fn ggtt_set_pte;
> +};
> +
> +/**
> + * struct xe_ggtt - Main GGTT struct
> + *
> + * In general, each tile can contains its own Global Graphics Translation Table
> + * (GGTT) instance.
> + */
> +struct xe_ggtt {
> +	/** @tile: Back pointer to tile where this GGTT belongs */
> +	struct xe_tile *tile;
> +        /** @start: Start offset of GGTT */
> +	u64 start;
> +	/** @size: Total usable size of this GGTT */
> +	u64 size;
> +
> +#define XE_GGTT_FLAGS_64K BIT(0)
> +	/**
> +	 * @flags: Flags for this GGTT
> +	 * Acceptable flags:
> +	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
> +	 */
> +	unsigned int flags;
> +	/** @scratch: Internal object allocation used as a scratch page */
> +	struct xe_bo *scratch;
> +	/** @lock: Mutex lock to protect GGTT data */
> +	struct mutex lock;
> +	/**
> +	 *  @gsm: The iomem pointer to the actual location of the translation
> +	 * table located in the GSM for easy PTE manipulation
> +	 */
> +	u64 __iomem *gsm;
> +	/** @pt_ops: Page Table operations per platform */
> +	const struct xe_ggtt_pt_ops *pt_ops;
> +	/** @mm: The memory manager used to manage individual GGTT allocations */
> +	struct drm_mm mm;
> +	/** @access_count: counts GGTT writes */
> +	unsigned int access_count;
> +	/** @wq: Dedicated unordered work queue to process node removals */
> +	struct workqueue_struct *wq;
> +};
> +
>  static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>  {
>  	u64 pte = XE_PAGE_PRESENT;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index ef26e7ce5064e..715b7cc4cfcdb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -13,46 +13,6 @@
>  struct xe_bo;
>  struct xe_gt;
>  
> -/**
> - * struct xe_ggtt - Main GGTT struct
> - *
> - * In general, each tile can contains its own Global Graphics Translation Table
> - * (GGTT) instance.
> - */
> -struct xe_ggtt {
> -	/** @tile: Back pointer to tile where this GGTT belongs */
> -	struct xe_tile *tile;
> -	/** @start: Start offset of GGTT */
> -	u64 start;
> -	/** @size: Total usable size of this GGTT */
> -	u64 size;
> -
> -#define XE_GGTT_FLAGS_64K BIT(0)
> -	/**
> -	 * @flags: Flags for this GGTT
> -	 * Acceptable flags:
> -	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
> -	 */
> -	unsigned int flags;
> -	/** @scratch: Internal object allocation used as a scratch page */
> -	struct xe_bo *scratch;
> -	/** @lock: Mutex lock to protect GGTT data */
> -	struct mutex lock;
> -	/**
> -	 *  @gsm: The iomem pointer to the actual location of the translation
> -	 * table located in the GSM for easy PTE manipulation
> -	 */
> -	u64 __iomem *gsm;
> -	/** @pt_ops: Page Table operations per platform */
> -	const struct xe_ggtt_pt_ops *pt_ops;
> -	/** @mm: The memory manager used to manage individual GGTT allocations */
> -	struct drm_mm mm;
> -	/** @access_count: counts GGTT writes */
> -	unsigned int access_count;
> -	/** @wq: Dedicated unordered work queue to process node removals */
> -	struct workqueue_struct *wq;
> -};
> -
>  /**
>   * struct xe_ggtt_node - A node in GGTT.

hmm, leaving xe_ggtt_node here is surprising as initial work was about hiding its implementation details

shouldn't we start with finishing the cleanup of any users who are still accessing xe_ggtt_node directly ?

and then we can just make sure that ggtt_types.h in *only* included from ggtt.c 

>   *
> @@ -76,16 +36,5 @@ typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
>  				     struct xe_ggtt_node *node,
>  				     u64 pte_flags,
>  				     xe_ggtt_set_pte_fn set_pte, void *arg);
> -/**
> - * struct xe_ggtt_pt_ops - GGTT Page table operations
> - * Which can vary from platform to platform.
> - */
> -struct xe_ggtt_pt_ops {
> -	/** @pte_encode_flags: Encode PTE flags for a given BO */
> -	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
> -
> -	/** @ggtt_set_pte: Directly write into GGTT's PTE */
> -	xe_ggtt_set_pte_fn ggtt_set_pte;
> -};
>  
>  #endif

