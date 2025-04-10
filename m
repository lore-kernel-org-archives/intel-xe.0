Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2760C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 16:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C9110E9FE;
	Thu, 10 Apr 2025 16:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye0WV1q3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AD810E9FE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744300958; x=1775836958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wkcllKFySV2FuGbRhGl1T6BAYQ2IUGf9WO9Gxvc5kEA=;
 b=Ye0WV1q3z8eFG2RcT2YZ6YtoseDFIvdBaO5DFLBR9aCPlfaqk94Hx8gf
 rpF69kCQchhVats6rIQay1p7oJDsr2By+D7LcuGJgRlgnL2bwKO3JyPqL
 iXYhNEC/Z/oGW/MMtl6j2+hgmeNz1xPhzm4a5Qk41OsqHL/8Jy+fFUgr/
 A0efh1NqvOnmDs0iZ9xm101NMwf9L6Ci3/hQn+NwsCLEebAPTCvJ0mFl/
 S4aNDZYp6frO6Ht7DFjkcCDyk7nylPfRE8xVGhKvwipJ/tl1aE4hJxg7/
 6gcB3EwpxbcaIEuyGrA/IlqIDmtBMEvWhJaVI+VPBVgPCj9Fl+mRsUU1D w==;
X-CSE-ConnectionGUID: NYEEqlHGQ0WYQK4sDtEKNQ==
X-CSE-MsgGUID: 8fxNuc3WTDGKFsemTbClDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56811165"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56811165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:02:24 -0700
X-CSE-ConnectionGUID: 1tOqRLjjRfSjAZYRSyyXZw==
X-CSE-MsgGUID: Jp9rRanHTSq7ObIq0DBJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="166144500"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:02:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 09:02:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 09:02:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 09:02:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVfnxst5IvvZUnV0URtUd3VejAVnop974gqC8EjKPSYVUh+fWhu7mWyUl6yDSQibtPbymbZ3zJXRCQQp2tY7FqWIlOPpDWLSTMNQVdw0MQYPe8NzucxAd9VfR/y/K1X0Xlq/F1388AFFS//xg+quFyxAY1aNyRti8etF2hdRVdxo4XGWGi6bb0u+e3d6cIt/EC734D0wyMNn4sTdHvfH/0cbFAutbTDKJiPaVjLTCbI0WmZ9V6YwARulWfZd77E/0WRB/TgeXv45OfWlUIMyL6w13aGV604qOPZHeh6rwfDB4UopvzoY4mob1cS7lRKSzIHx0+Rwhdo6XzLqGcqPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkcllKFySV2FuGbRhGl1T6BAYQ2IUGf9WO9Gxvc5kEA=;
 b=cg9MUt2LaXIfRwTYpCgwsvAAW2il6MqRfLt4AI8TkKkP+sWwLaEVsOs2GqUIHica/xnPgL2SM40TUkqTtB8Z4z1dK3wq8RwE5HbK89TEgDOnnbVmZdifdr9WnKEPEzSiwJKUCOBUdVLc2LxDlh36vdtZK8YCSqqqPz4+J5e4408ENG8wIVx6y5So9eWARsjcKY7OSgwOQ1TLI7+JUjzQGHzA6NrXdlqyQNUxg3ElP0xywIUuu5t1FS4gsKAuNCCmVa8lpgDTYgbepoo0UiRZ1GPyzoWon+U4W6JUDnFmpUyXB8bjx7uFECh0DuwkKAyUrRbaBWd3QITrolR3L7SoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 16:01:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 16:01:44 +0000
Date: Thu, 10 Apr 2025 11:01:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Chee Yin Wong <chee.yin.wong@intel.com>, 
 John Harrison <john.c.harrison@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Set LRC addresses before guc load
Message-ID: <kewdxij7zovagst4d43xxi4ckckopppslirb4nisccdc7zq5c4@ch7iamwx3yrh>
References: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
 <Z/dYyioDSygp6STJ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z/dYyioDSygp6STJ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7f933c-4e3b-410c-8336-08dd7848fd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZkSqJrEqIN7TyMv3TsE4BV0hwvaty2MKT0iornqrR6eqHcQioGu5vbdu4gjX?=
 =?us-ascii?Q?59DDmYBKbPdolre/8IDQflFFbE/r2nMNFKQcffw+agi8vAr3J9T05WyOKsoo?=
 =?us-ascii?Q?NNntkaCvRktEtJD6qpesdL2jQzhVdP2CXh1o5tUAVoHLHgudHhGIirKDB4Op?=
 =?us-ascii?Q?pHe3aAOgVjLWbids2y43lUC0+r11AnugaZko0XGpVVYybHRs06nZoHO7ORSk?=
 =?us-ascii?Q?NaI2uXrMLW5jwMnY2kSjloJpXoRD3PiLNJn9d84/c16BXyYoqb2XMXcy4y3Z?=
 =?us-ascii?Q?Te0BnVh5fWoFzjbb5fOEZonw03G+kTojjo3C51MrFj49/j4AS7zwObgkPshz?=
 =?us-ascii?Q?GVxosc9bPVeH17gx2mhIvb2dyvpMOqinFbjB1BALRAcOeMKQrKUljQXRjpt7?=
 =?us-ascii?Q?mHS6hpiwXB0ZIf0fs+mnyUADwYRQQC/YpIBjn5Xqmbsr5ib8xskAIPJuvdpz?=
 =?us-ascii?Q?N+SJPb5a2Pb9hh0JpffQaSrEc30P4KxnGw03ZY3Hj3907Rp/ytIDP960Cqsn?=
 =?us-ascii?Q?Qmjyl7JZkmlOPUel5N7VEIMkoMhxSB2PR6rBPtuRjleOis3uFO9FGIcAxo6V?=
 =?us-ascii?Q?pYaBVMPUg8Da4cNJzONRSChF48ayqt5bEdiUAMBSDCgaJJ+Zp5qPTJO14Tbr?=
 =?us-ascii?Q?aR6jbFRV87DgIjNK7FiSH+lzR4k4q2bwd1TtwGig4CHrjvPRMt0SGqVS85F4?=
 =?us-ascii?Q?U9uXYV4pMFS2/G0hbQMZDAjivt1S+Y2KCcaPkhZw0NPaxab02aErZZTuOmkX?=
 =?us-ascii?Q?xzxqZmo70oq+z9VsQ/ZkU2YNoXe9nqcrANNlFV9tKYEk2QncUqpQ1cyi2t3+?=
 =?us-ascii?Q?IQBPKwQG6VCjzl5elVz0p2K3ppW+QZyhsifLRFWZaVjA3Y21KRGyDYkYLi0B?=
 =?us-ascii?Q?b6YVZpZonpBzItsFJ30TbDTxTnADV7M+oCZj/oYLgKFNQINTpuQcmYxjrfnz?=
 =?us-ascii?Q?GWkwP5vMSb5K7mGZ3PKy79FJmcDw/8O8eTqw5gkgT8gLwaA//V7k97bAtbi0?=
 =?us-ascii?Q?eWbRrqlRFSqGftQFsn/K1sYiUQG3WJNbSdxScpVSh+lnWCH0zgJxA93H4OT4?=
 =?us-ascii?Q?pstu+KV76WwJ4v7FC5TPE5mdQRh5BM10nnEEIVpK1eoDaHr2EAOtbU2qN2fg?=
 =?us-ascii?Q?8/2pFNnxlfIeWN07XEk2BQ8VkGR/rpntvmJfIsth8oS3SBNc+ToAWHzY+WCx?=
 =?us-ascii?Q?7vZjyO8BF1BK2dOvkWd1TMT9wlC0Wx6E1jbKZ/7Udx7Sf7forcA74rMB6iUu?=
 =?us-ascii?Q?sq4uMU0Dx321z9w+/06tXatQBHCTGvzVL3MpfeZYEr0ANH/B9S3lnXN6zsA1?=
 =?us-ascii?Q?IuCyjDefPyqb/oRyjrdl3/L1jJsBAcngdYG0VgEhthwEd0dR34h91g3MIn69?=
 =?us-ascii?Q?FYnwV1ndQ2P3liSD0L3VAiiHouN11CPQt57KH6FcxCH7iXsWShIXaU83Wjj9?=
 =?us-ascii?Q?23OX4xXoTA4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+r0qvR0CWKykIQBENSvvYd4J/lXHteC0z+n0oi85x7rOu1ZJVKwyrsY5N8rY?=
 =?us-ascii?Q?8FRgtMXWXsxsmJeUMQH1SBCufhQiihOqhKxig1AgGjKX+Sr8KDrsCeKc/sj+?=
 =?us-ascii?Q?gGJWeeeNN7Qcnez4nbNFhYuDShswCh/cH8T4OJ+7SMolDFs6H4Z49CG/SNxT?=
 =?us-ascii?Q?bCvlIZpftF45BkroMtz4saeH9YJJHLPPA9/eL2Q3dr8twByHzzN38gebKSar?=
 =?us-ascii?Q?r+5CeAcUD+KQm214hK3eJLgJWT9/rLIDz8l5X0UISGwlltH+c3//9ZkKg0qT?=
 =?us-ascii?Q?eKLszk7ChtbX564sA2OJv8rImhfPXkwoNidWUDh/Y5jWZRJi2wQCBdJCQ3hh?=
 =?us-ascii?Q?lO6N1v3qKq2Sq8CcldXfXJuD0VOcTu9/ChZStE1titO2MtVNhJsWBm2r7izE?=
 =?us-ascii?Q?lyUD5MW+QkxwLE3rPEZIeY+k7mGpxpIOV0Zwmc2YQ8dVnpi646HWsGrV3zTq?=
 =?us-ascii?Q?FyzgWbZhWEb/N8tRli2WJuiotq+AMq8y0bvNqpBNcRhcHAlcY6Bnbz2MaZAV?=
 =?us-ascii?Q?W1u9fPVguTt3Bwet3taG58ynfQrwhtObzaKEzL+bwh/+jQ9yU7oNp58gNPHM?=
 =?us-ascii?Q?63ITwmFXm0zUSepG2Nm29LrUTa+y/g3dneRXXo5wKAu64WsXuvaV6GTk8UWm?=
 =?us-ascii?Q?ZtPaBqSUoN7iREsVk2HbZ7nxGoGDnEuq3z/PSSlqwDp0FEs1LBj/UHPLzEWM?=
 =?us-ascii?Q?LANkYQ/T0RRTZw0+WPmt6K+bMCGcDuL2g8p3lIYOG4ZPIPiRAXUFzluasKk9?=
 =?us-ascii?Q?NjiSTs72tHxHeOfNuuXedfY5nAWQ4QA7PQkE91msYiwQxzVWVRNxKGAx/TRM?=
 =?us-ascii?Q?Ks8uEO78bZX9qOaJELZRR94+pTqei2JxlzNsMbhPPk+RpfzsNONoickyesx0?=
 =?us-ascii?Q?qkan/vvcr9qxMpC6G6FbM4+AXyr+R7AVK2V38FFEjZKOKGSJy4z9tS+lBzag?=
 =?us-ascii?Q?X6RqEQG7YHLPZsx/IsVf3T9TBKXwpFFqg4f6r94Fet/6UBwAbf5Za4KMjsFf?=
 =?us-ascii?Q?4EEliqprb7Ahw7w36oUrdBr+IawbrabQCgW9L6ExZPBBvUy/Fc3KHoHBI5Ak?=
 =?us-ascii?Q?sCIzZEwxJWZ9kHx8GVQgNks2tDPYKITHpca69ou7xv2xjYUOszgZVJ+Y5EfW?=
 =?us-ascii?Q?uW9m0DEvOQhEZ1kW3nJlDjFlJelWpouYwXjeVVq8Af8nIR7VZfNF7gFlYZlk?=
 =?us-ascii?Q?29JonYc/U9MM8zJDaKXbzl1lFrQ35JDhXBoZB6T8evfUtpqQACQiNw/rznCP?=
 =?us-ascii?Q?pCGN8vWxCbedzlfokV1F4ropzCx0RJaBRVJHJq66vG9aW4joSt3z7D2GFtkK?=
 =?us-ascii?Q?e9J8MFlHqgxccXdQrfFRdCcSbE2Bxqrjz5ZvBayk9JpB7OxvDoTL5FT13VfY?=
 =?us-ascii?Q?5XzsOh13O7Oc32bBDa4tjm1UAiITEx/oxN6ThOXzbc+El08vVwpbSIlJ3636?=
 =?us-ascii?Q?VgUrg5SRmyh4jH/BzhXUSLLorQ31d38dB3vfysBl3u+QlJ7tc6D+Ie6KxdHu?=
 =?us-ascii?Q?8wvarl0SZmguc458J1WuxCiU45Ic3HMhseWMp4AgqggxDQNQZ3m2tzYDnuQO?=
 =?us-ascii?Q?CLX0lbUeoGD1E57Ug7ZC2jmN2KyOOxcqvlLIo69us8JOMqsytf8CtOr362y0?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7f933c-4e3b-410c-8336-08dd7848fd96
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:01:44.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wP9qxJIumVzlCURxALHtNQeN1yJrXBr5lTgTJnRPoPxHRjD+BCqRr71mkjBuJqOqI5la0mxwWw0PPSPuB8kdh6eT8/q5wX6eaSC7FMWTn78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

On Wed, Apr 09, 2025 at 10:36:10PM -0700, Matthew Brost wrote:
>On Wed, Apr 09, 2025 at 09:59:34PM -0700, Lucas De Marchi wrote:
>> The metadata saved in the ADS is read by GuC when it's initialized.
>> Saving the addresses to the LRCs when they are populated is too late as
>> GuC will keep using the old ones.
>>
>> This was causing GuC to use the RCS LRC for any engine class. It's not a
>> big problem on a Linux-only scenario since the they are used by GuC only
>> on media engines when the watchdog is triggered. However, in a
>> virtualization scenario with Windows as the VF, it causes the wrong LRCs
>> to be loaded as the watchdog is used for all engines.
>>
>> Fix it by letting guc_golden_lrc_init() initialize the metadata, like
>> other *_init() functions, and later guc_golden_lrc_populate() to copy
>> the LRCs to the right places. The former is called before the second GuC
>> load, while the latter is called after LRCs have been recorded.
>>
>> Cc: Chee Yin Wong <chee.yin.wong@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>
>Fixes tag? Anyways patch LGTM.
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.11+

Before 6.11 shouldn't be relevant since we didn't have any supported
platform, let alone SR-IOV working where this reproduces.

thanks
Lucas De Marchi
