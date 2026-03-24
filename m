Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2760EFEC0FC
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 20:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80C210E063;
	Tue, 24 Mar 2026 20:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRCRjv93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5809610E063
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 20:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774385942; x=1805921942;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Idj9VSvDwRsrKP/4vcyiIE8B+93qS9wfplKRdHpZt3I=;
 b=ZRCRjv93cNn4EQmrl2/XejBm5TvuKAYX5AMT0a9FLxtwcBaJX/mhEuUp
 U0DaesWCnFhaF9p2BiLLSTFxCs+Pq/pl9D4y1siD6xYqM0CXhdJE/t3xR
 AVz56ORrHQSP4i5o1XlWRkmcfOHztHLCMeVouE1lGJrUkIZkJatRLNWRu
 ODy2CtHAUgYB7kLw0RQuIJ2UV7l9+E3hZ2d+99reuXtpiTwf44yeA3fug
 hRK+l2JVsbn9qs85jWqquD+k6oqxbGW4Mj2V+DCXnK/PX0Eb3X496Ceig
 /olTZ+5XAbjFAnzNzn0x8lb++pGBXa96S8KZ/8EjS7zE+VmgNhuiBc8WP g==;
X-CSE-ConnectionGUID: OInfTKk/Q/SSgbV1XJ/HeQ==
X-CSE-MsgGUID: NwWPqCo3TDi2VmAxbw//6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98038208"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="98038208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 13:59:01 -0700
X-CSE-ConnectionGUID: vs9EvNmYTieYWXUp1H13rQ==
X-CSE-MsgGUID: gS5AE0aWSv2SlNT3w4ptfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223531594"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 13:59:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:59:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 13:59:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgH6xkD1gB9C4NXh8BmCKUyk5IBtPZQbNZBME2caQAR5N8jQ64lNssuhrBAh0yfMaluIr3ApD08G6SYzrmntQ6uTdoduSr9SvxTY9WK80UCgZ+OPoV6u6asOh05OPIgBdhE5xYeYIW9CRBImEOUqw54JdRgRKXWbFAERZG1ktFDlKNk631/LyT497GwjDYubNwjFYChdpHj+ceOIIjzW6tRkZ+G1D0b5VUx7/dkw35mNSjrsqMa/K9yY9oCnGr6qGg4bjZQ55lzArp6CcEVBITXKq7S7ie0MdSwpeqcg9Tt+sAKHvhg/mqI+2AHB86oYHy5jAMSMy8xxjbWpARBDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgeI0gvplq73KTFslyKv8yAAw2LLNWjMjtnVuqydhXQ=;
 b=Xwp90tTL6/kZh0hveJYOlA+OPmbH/SYh/574soPpXXNTB4i9DKFaaqyQIrsjKGgrRdLpHOL9IMZvHqmqwRcUKzMcsylWvPRatYErCnBCGFTuWLO7cfFa7d4mbyIyrHe8TMvkRJHK6Ne59GLn3wk5D9mO7j2vg74/hayNK6Pia2XYzQHOVhGHyCNEyrQspfqHmvNDfwn9WiqzwvcSz/H+m0f6hEcB2VeYy+WLn36r3yxCaXX52ZjXGu/Gau5WF93fSoVqAYG1EI3zMp8re8O8zsAtxQJdv0S4xKJjGlpQRXr433Rxi+iuWeTuNhG0YK17bLREV2elivqJwFtN6mOPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 20:58:58 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 20:58:58 +0000
Date: Tue, 24 Mar 2026 13:58:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <acL7D7MVf5F32C++@lstrano-desk.jf.intel.com>
References: <20260317232133.4106716-1-fei.yang@intel.com>
 <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
 <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
 <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:303:b6::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0404371d-2580-45be-0e71-08de89e82b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: zYrEQCXk5IF2FSj22OaNRttm6JuOM4yUHu+By2UvmZhXVIwlESbdu0c3U4hQbjSN6z/1D0ffZ81+D0IkhM3/HQmBvSS/0u9+k/lGbbCduwW9iAAltEjkDySyu/gAZfjPd+nEISdrPWE52A247oUAJrl2eD5ACRlMpRIQz5dTltttIPPjhX0VrLP21n866LdJ60jfhcqPDH4D8qz3o0jALg4VzTA5ONYvg5ZkQ2rF6tqvFpYYuanItwjAHDUnip4mH+8+oHRYFfvOdES7qt+3tZhVyqZooZM/LL/lxbvWIJXHHxSqgSE7JO0Jwo76QKkU79HD7rUFJzQmrrlK4PRJ8q6VFupyaa3VmZhY4rycNkiQt1Ci+3Jw08vLD4YO/V/OI/NYAxNn4E4bUrcmk2lM648Y/nAHyFACh5B9yHQVKfVAsj2nKe7aEFz6riAv+8BADDym0nPVLjNOMu8pJgFJelLrIHUholhrBY3a3SZZrvwSuTZ0TkOrUhHW9GqgDMZzWocX3Ub/72Z7CYQIwJcPDQpxO5Hh63HYYgf1pEZqa4hyOnsKtfSbB1LLKHS24gj7QAyjmHLYFtgaJ5hHDdhDt34ADTA+VLpmxu0dreZZtPlUoSoi7VWnty78OqzmoSye7/GKYgr0YVcsIc5sT9BwPp6juFvZMSeuJC/OBYdEWNlB332c2W1wf0dFReClIpSRDK6i19JmAHIoDOUMPHBDEh2+FXKxnaN0t1HpIzcVCxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmk3aTZiR0FEYUdtaHZPWERVeStyRy9SUmNzU1pSWTU1eThqMDJ2MDJ3Z2JG?=
 =?utf-8?B?VmhIWTNIUlJGMmtlaVc1YWtzbEc5T2VuWVN0ZEFOeDM0anZpTUFpK3VkR2Jh?=
 =?utf-8?B?NkxYRFlKd09uSGVMc2hEdzFOT0UxeGtVTFMwdVhHaC8yakZHUXl4L1Z0K0xv?=
 =?utf-8?B?Z1MxUmY1VWZOV09LOTd0ZDNxMGFQS3RXMC9Eam1jOHpTOVU3UHNpVDJ2ejRV?=
 =?utf-8?B?VzV4aDMrcnp4b3BvT1FjeFdpSUlHaDlKMGZ5T2sxUG1RTTBFTGdjb2pFdzZ2?=
 =?utf-8?B?SFVBZTNoMVdSSTNvV2tKcGFTeFA0YmFaRHQ5ZURBeDlSNHZwWHQ1Nmh0Y2Fy?=
 =?utf-8?B?V2ZKR3gvVXlNS0JyeS9oS0djalFTakxoUlZzS2Ura3krOUFSdG0ySGg1V29o?=
 =?utf-8?B?SmRtYVl4b1R5b3NqVmRUNGRaNGp3ZmZCTFh4dm0xdHhYRC80WVJTeTNiaGlL?=
 =?utf-8?B?OXVUUDRXcnBRd0Q0cURrenBDbGdvcjJFd2t4VUhzcUhCNzhobmpDNDhKYis0?=
 =?utf-8?B?b2JlTFJVTlM2ejRoRWdtZlpwZGRJNUlxaENTUmV5Ly8wYnF2MjBMc010Q3NG?=
 =?utf-8?B?YzJRbUs4d0F6Mis0YllHQ28yOENEMlBEaklRTEtLVDEyazMyVlV3V0Vtc05j?=
 =?utf-8?B?am9HUnJZTm1VUnA4QXRqR2RYSzN1Wll0WWRwMmVpcUxyMW1Ma00wYUloaGs4?=
 =?utf-8?B?QUNZdFJNSzVZb0tJbmdzcGlkTzNKclRscFFqU0VjVFlzRW1CVWpxRnpURHBE?=
 =?utf-8?B?L2ExOGhvWWRHQmdiRFZaOElOWGdMQVRSQ1JUb0V5aXZzQTNwVjdFMFBLU21H?=
 =?utf-8?B?Y2NEWmx1MTh4U0hrdnZiU0ZKdE9mUWU2bSsyMVNJcGphTTNwdkM3UGRyWTND?=
 =?utf-8?B?SHdlVW5NOXlNWjJCNHZ0dEVPU0NiYzZndjVLcERKU2xvdzBtaExSdmMreksr?=
 =?utf-8?B?OElRYUx0TkE4Z3c4RFBKVWN6UkF4Mi9vekx4dVVMRFRmbWdEdEVpUzV2TU5E?=
 =?utf-8?B?MjR4eXlNUjRjLzNHUnVOM2FFekdIN3k0Nm5qb2dCVU8vLzRaQnhZK3N4ai9k?=
 =?utf-8?B?ZVp6VldiYWI0cmdvYzFhdDhCWXoxYi8zUmJxZER5TkpienJwOFV5czZjUzZ4?=
 =?utf-8?B?NUZ4cE5yVGxJcnlGZnl0M2lzd0hnNUlnVy9zNEp4WDg4UkpHd3JsdHIxZGFr?=
 =?utf-8?B?dmYwU24vd2I4cHMvbnZhUWhOTjhOZzZoL3pCZ2JtLzRzVUI3V1k5bmI1OFM0?=
 =?utf-8?B?R1V4WVdjNEQ3YjY5N3FUQ1Jkb2VsRjJld3VLbzR4bHh2SENUMFdDYnJUbllN?=
 =?utf-8?B?eStCYnVSL3BXVWJGcEs4cmpCVmhFR3VvU1B1K0lwVDA0eUFjS0NSMXgvTWY3?=
 =?utf-8?B?VXhWZHNhajV6SUc5VWY2Q2JYdDFtKy95cDljc3pUcSs0bWRubmFrU21vcmNi?=
 =?utf-8?B?ejA0ZUlsSytoMUNVdWJZdEd0eUVHbTRJUTNjZVJVR3pja2o3Z2E2UnBmUXlN?=
 =?utf-8?B?VkxDME8rY2RoMERHd2VxcFRZT0JuQStRc1JlaDRJQWoxdFdHb0pCNnZseE5o?=
 =?utf-8?B?dXNHSFkybGJKY1NBQktjNjJuMzU3SWpuVnRQaXFiOWdiWDJHMzNmUlFsOXBQ?=
 =?utf-8?B?M29ZMTYwcDQwQTVJWXZ1VTJBaE1KNHB4Z3JzQ1VmNi9nekZ4Mk50NHhHREQ3?=
 =?utf-8?B?YVFqdEZzdHhwVnVOVE9US3N6M2NXdXZRTkhLTXBUYkRGQ2UwbmJvOCtzanVP?=
 =?utf-8?B?UzNlS3ExQmRhSjVsaWZCalRSNWozM2lQWTFHZTlZaDJzVGFEVXA0SUc4YlpV?=
 =?utf-8?B?aHRLaXA2MXJWcFRaS3lRanhHNFZBK3gwNWRueU05UGhLTmlDK0UyQklmVVY1?=
 =?utf-8?B?YnNkc2d0WFZWNlJxYnBiVkhESjl2L1RjZVMxekhIbDZvYitqTG9uMTgwb1Zu?=
 =?utf-8?B?UzlmR0h5enoycHdqWk1XYjNjRTM3SG9YbEVTWFZSdmFvVU44QnJYVWQzR0RE?=
 =?utf-8?B?TFBRUjkrTzZ3M3haalZjVVJGQTh6cVQ1aUJYVWh2YVRQbUlER0RYUDBNOW5C?=
 =?utf-8?B?dWhEcGZyM3hMb3BJTUNKb25YVktIU2lOMzVxTXRGTVRWQ0hzMzd3S1YxSlZs?=
 =?utf-8?B?T0lGc3JBdnB3M1FJM0JqVG5OYzJZWDhyVnBldy90a0JjS2gxSERzYzc4ak55?=
 =?utf-8?B?c2FGdlpjUjVTcDErSHZ0djA1SkFkWmd4UHd4TzhkNWtQdk0xcHB6MWIvTWxw?=
 =?utf-8?B?VHBHT3RVYXlKYXEzbmt1ZzF3aDNxT0tFV0c5YytXWjZCTCs4cjcvSVUrM1R5?=
 =?utf-8?B?SWhYR2o2MmFEcE5mOWg0b2hDdlo5T3NJOHJXTXU3NUxjbnJwL2pDN29QMnd6?=
 =?utf-8?Q?IkXGtWg4XuJqAc7Y=3D?=
X-Exchange-RoutingPolicyChecked: bhJ0fvOxlY4PTd6kVZRDNXrwp2ia7MjzkfOWMo7iho+tLJJau565M3vRp+s6VVq1/5W/jj06cMUIUecVp1jZaAEEDYjjrXU5+WDQXEHKFcPzXZQ2o0vuHhIFnZupZ/VREZq5eMVdIhrSvcy3ks9lLpojOixihBqhGKv0WxFz3HcDpe5yxeYG28wwv4DDoqeVb1EAwbTPr9Vl4ItgZnfPv4qwGb2UXNtiCcEQOyUmjy5WQMdoxe5nzaC+QAktlOJ9OFwjCqCKaYpbAhlMkU+gEsfmkbbo5LOxtaUJM2gF90wg6jFUimkGL1F5bt8lQu2nHO2fTPGnGyhoFf519qcjHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0404371d-2580-45be-0e71-08de89e82b44
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:58:58.6723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xu+3QBjOPImriv958f2tv8ZB3Tz/NjJARPp2oNtZDX5vzwGyFH0Y/YqaJqQR4wcxIlWwGtO+w4kJlzxs/+DzDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
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

On Tue, Mar 24, 2026 at 01:53:27PM -0700, Matthew Brost wrote:
> On Tue, Mar 24, 2026 at 02:39:54PM -0600, Yang, Fei wrote:
> > > On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers, Stuart wrote:
> > >> On Tue, 2026-03-17 at 16:21 -0700, fei.yang@intel.com wrote:
> > >>> From: Fei Yang <fei.yang@intel.com>
> > >>>
> > >>> Hardware requires the software to poll the valid bit and make sure
> > >>> it's cleared before issuing a new TLB invalidation request.
> > >>>
> > >>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> > >>> ---
> > >>>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15 +++++++++++++++
> > >>>  1 file changed, 15 insertions(+)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > >>> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > >>> index ced58f46f846..4c2f87db3167 100644
> > >>> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > >>> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > >>> @@ -63,6 +63,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> > >>> *tlb_inval, u32 seqno)
> > >>>         struct xe_guc *guc = tlb_inval->private;
> > >>>         struct xe_gt *gt = guc_to_gt(guc);
> > >>>         struct xe_device *xe = guc_to_xe(guc);
> > >>> +       int ret;
> > >>>
> > >>>         /*
> > >>>          * Returning -ECANCELED in this function is squashed at the
> > >>> caller and @@ -85,11 +86,25 @@ static int send_tlb_inval_ggtt(struct
> > >>> xe_tlb_inval *tlb_inval, u32 seqno)
> > >>>
> > >>>                 CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
> > >>> XE_FW_GT);
> > >>>                 if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe)
> > >>> >= 20) {
> > >>> +                       /* Wait 1-second for the valid bit to be
> > >>> cleared */
> > >>> +                       ret = xe_mmio_wait32(mmio,
> > >>> PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> > >>> +                                            0, 1000 *
> > >>> +USEC_PER_MSEC,
> > >>> NULL, false);
> > >>> +                       if (ret) {
> > >>> +                               pr_info("TLB INVAL cancelled due to
> > >>> uncleared valid bit\n");
> > >>> +                               return -ECANCELED;
> > >>> +                       }
> > >>
> > >> Is there a reason we aren't waiting after the write to make sure the
> > >> invalidation completed? It seems like we should be serializing these
> > >> and at least making sure hardware completes the request rather than
> > >> just sending and hoping for the best.
> > >
> > > Yes, this is correct—we should after wait issue *if* this code is actually needed.
> > 
> > No, the issue is that software cannot issue another TLB invalidation request while the ongoing
> > one has not been completed yet. Otherwise the hardware could potentially lockup.
> > So we need to make sure the valid bit is cleared before issuing another TLB invalidation request.
> > 
> 
> Yes, but we signal the TLB invalidation fence as complete without
> waiting for the hardware to actually finish. The locking here is also
> incorrect for MMIO-based invalidations, now that I think about it. What
> really needs to happen is:
> 

Ah, this actually another weird corner where we take down the CTs but
GuC is still using the GAM port...

> - In send_tlb_inval_ggtt(), if the MMIO path is taken, acquire a per-GT
>   MMIO TLB invalidation lock after obtaining the FW

So maybe 'Wait for the valid bit to clear' here too but this still isn't
fully hardend as the GuC could immediately use the GAM port again...

Or perhaps we go straight to my suggestion below - when reloading the
GuC issue MMIO GT invalidation...

Matt

> - Issue the TLB invalidation
> - Wait for the valid bit to clear
> - Release the GT MMIO TLB invalidation lock
> 
> Without this lock, two threads could both observe the valid bit clearing
> and then both attempt to issue invalidations, clobbering each other.
> 
> > > This is early Xe code from me, and it’s questionable whether it’s even required.
> > 
> > This seems to be required, otherwise modprobe would fail at golden context submission,
> > [  480.237382] xe 0000:01:00.0: [drm] *ERROR* Tile0: GT0: hwe ccs0: nop emit_nop_job failed (-ETIME) guc_id=4
> > 
> 
> I’m somewhat surprised by this. A better solution might be to drop the
> MMIO GT invalidation code in xe_guc_tlb_inval.c and instead issue an
> MMIO GGTT invalidation whenever we reload the GuC.
> 
> We can defer trying this until later, as it is a riskier change.
> 
> Matt
> 
> > > Typically, if the CTs are not live, the GuC isn’t doing anything meaningful in terms of
> > > referencing memory that the KMD is moving around (which would require an invalidation).
> > > So this entire flow of issuing a GAM port TLB invalidation is, again, questionable.
> > >
> > > So I'd suggest move the wait after issue, plus throw in:
> > >
> > > “XXX: Why do we need to invalidate GGTT memory when the CTs are not live? This suggests
> > > the GuC is still in the load phase. Investigate and remove this code once confirmed.'
> > 
> > The issue is a consequence of an earlier failure which caused the CT to be disabled. And the KMD
> > sees a bunch of TLB invalidation timeouts.
> > At this time I would expect a GT reset, but that is not how Xe behaves (the ole i915 driver triggers
> > a GT reset on TLB invalidation timeout if I remember correctly)
> > 
> > -Fei
> > 
> > > Matt
> > >
> > >>
> > >> Thanks,
> > >> Stuart
> > >>
> > >>>                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> > >>>
> > >>> PVC_GUC_TLB_INV_DESC1_INVALID ATE);
> > >>>                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> > >>>
> > >>> PVC_GUC_TLB_INV_DESC0_VALID);
> > >>>                 } else {
> > >>> +                       /* Wait 1-second for the valid bit to be
> > >>> cleared */
> > >>> +                       ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> > >>> GUC_TLB_INV_CR_INVALIDATE,
> > >>> +                                            0, 1000 *
> > >>> +USEC_PER_MSEC,
> > >>> NULL, false);
> > >>> +                       if (ret) {
> > >>> +                               pr_info("TLB INVAL cancelled due to
> > >>> uncleared valid bit\n");
> > >>> +                               return -ECANCELED;
> > >>> +                       }
> > >>>                         xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> > >>>                                         GUC_TLB_INV_CR_INVALIDATE);
> > >>>                 }
> > >> 
