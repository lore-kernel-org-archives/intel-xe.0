Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFF3C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 15:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBAE10E09D;
	Mon,  3 Jun 2024 15:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXQQgMYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD9F10E09D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717429747; x=1748965747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4vnx7zShGZL/51Lk101yYqnF+XNTQ4RagiNV6T7jXlg=;
 b=QXQQgMYsZLXEVmKH3FKYgMA8O3hg44NZR6phiEGkOE6vd+PxmsgnMtVL
 J8YGitWpUIMF2an65M2/cMgTF25cN/Xt/YGfnp05nqJ12cBOAx3xmseqQ
 27J6yAXRw6XivOJpruJ22Ukz+bukjO5mCZER009zjEmJP3yQER8nlkXhD
 prjGtD6GBGZRIyilEdc116T2gDTgpos1jP+KJcSigIBWwFRVfi8hFO51O
 CDy+cFQVY030MuIeE7p4HmVleoTxH6hk9GYfcLP2zft5tQtqieP9ZLnZK
 zq56lhs7aTtzFiE6zKTozeJ0ewNh5YFMhTMg3IBlFl3kRudjf2CbNhLll w==;
X-CSE-ConnectionGUID: 2/81TcB2Reuw+K/HxkxlTA==
X-CSE-MsgGUID: WGnPU6uESpSSm4LX1xpc5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14055727"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14055727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 08:49:07 -0700
X-CSE-ConnectionGUID: ENdnVcjQQrSjnbWU0OK35Q==
X-CSE-MsgGUID: hn9lt2E+R9mbnHDzWu8c1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37548916"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 08:49:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 08:49:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 08:49:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 08:49:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 08:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvJi+70aSOTSx9wQdO/H++Zo3/Vw1ikYPYTlqb0WIBDCZP9oA2QLtAv3cKqMKbmA/4U6rU7jdEPy4kUWUa7LsowdgI398MzIVKsYrvTzRVxkQ3G2G9YbdTqiLjXn51PBxcJXA+BAZ0YyXZXF5rsAa0Mb0Gmn1EJ/QoLikxGty1u1Ak5Rc3OuhVuWtcU20KAkNYQJHbd6K2W5/UKNstoCS4oyX3ZPaqhVAMH0l2MDPcprL62TrrQVQzS2XJQ1Yy5vHKrHwP+w0nJfgE9TTXF46OKj8gpcv29Z5R7HgFhSzFKOKnXQVxdslAy/uwbNjh4TQHXvGgvvOVNfpbe+++Hsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vnx7zShGZL/51Lk101yYqnF+XNTQ4RagiNV6T7jXlg=;
 b=lENUP7XLBTSKdL0xzR8JlxOMQp9XH4/tOcoV+aDp14WpTwVxh+JXk93nQz3PZqaaT/Y+rrWyW2SR5m9ICyX46WzqiwYxAfv8cSJ0GZ37BbenkEptOxqnDx2aybb7Tvubjjhkf2KfjxJdwrl2NDBokeHvKGqssfxImdosxIXyckEZ63yqaCJbH6fpQwXmCrH42zWzHXPccQOA6MTDIH4+QwH312dc8ZRqVar5ZYsdmcnBiMwDkaaYf+gIhGjcGkvH2u+QqnvZuZqH28HfUCgEP+PRn/dX2kVjGn4tBiSsjUmVs8UOcmRgWX2XjuLUS08oRguktqYGYy5ppAwRcgrXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Mon, 3 Jun 2024 15:49:02 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::b7af:93f:f33c:20e0]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::b7af:93f:f33c:20e0%7]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 15:49:02 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v3 6/6] drm/xe: Add reg read/write trace
Thread-Topic: [PATCH v3 6/6] drm/xe: Add reg read/write trace
Thread-Index: AQHasqQeYQL8V9O3JUaRdr1UaGS5E7G2NK4AgAAA1AA=
Date: Mon, 3 Jun 2024 15:49:02 +0000
Message-ID: <DM4PR11MB5971BD6DCCB9A4D8373D5A4F87FF2@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
 <20240530151313.2284182-7-radhakrishna.sripada@intel.com>
 <171742949605.5170.15045658504264674665@gjsousa-mobl2>
In-Reply-To: <171742949605.5170.15045658504264674665@gjsousa-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SA3PR11MB7626:EE_
x-ms-office365-filtering-correlation-id: 26e8f5c1-4363-42bf-a548-08dc83e4b107
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?OHVpN3RDNGM1Tnd6aDdjOHFGLzVpeHhSQ0FPUTcyVm9obU9od0kyMG1YWkNk?=
 =?utf-8?B?WS9OSFFOWEp6bVZ3WFZ1eksrQ3lnbi81QmlxeTd4UExQQTlYc09DbGU4aVNa?=
 =?utf-8?B?T0tNY3lzR2xacUVRVFVNMFJhK2FCK0QyMVY3MXpvbWVjM0pRbXJYcGIyT0o3?=
 =?utf-8?B?VWtYWldYaDlGRElURWJkdGxxeDhYOWV5V295dk9hT2xXOERXQnRZZ2wyMGdy?=
 =?utf-8?B?TndRUkhYei9ZYWZOZkV6SWpoRWt2V29zZkJ3V1FGZXM3V2Z5VUxwMmdsTFEy?=
 =?utf-8?B?bVkySjA3b3RTd0JOMEJldk1rY2Y0UmgyS1VYUzFvUHpBZWJJOGFqT04ydTEy?=
 =?utf-8?B?dWdiTE1GbzlTM1BITks1anJ4MzBLck5ZeHdSQ2EyZGZnV0pqZzNLUFBiTVgv?=
 =?utf-8?B?QkJtMUlkQXU4NjdidlcxOHRkU1Q1MGttRDFjTStvWE5sMzNoZXZrRW9aNEZk?=
 =?utf-8?B?cmFRR2gyTzF4blpIdTdVWUJmU2RPQTE3ZCtVbG0yQy9rSE56RGd0Unp1anFJ?=
 =?utf-8?B?cTFyeDRwTGZRdEsxcUlsTTZDTUpkOGQrdTlVUEVUb29oNS96UU81MGI1Z0NG?=
 =?utf-8?B?WXRodkQ5cjAxdVVBeURhanNtNndaaG1naEM2NzNYbmgyM0JIQ3U5NUVoT0sy?=
 =?utf-8?B?MzlIVDc4L3NjaUJPUFBGcWJHcUdxZ3FOcW1aQS92ZXgwSk1vcG5NZnJrSmVB?=
 =?utf-8?B?Zno4dGhHaGlvWDdFMXZ4WUx1YzlSSWdJd2dwbUlyVWU2T0ZPYitOLzR0blJR?=
 =?utf-8?B?RWhJeDZXd3hZZ3NNVExQVU5CTVJBeXFWMzA2WU1xdXdZQ2FoYmdhVWdpSlBv?=
 =?utf-8?B?ZnBWWGZrNE8vVU5DOEFPQi9LVi9RZnZTWTZmSUJ5Wm1wL1lvbmVnNVdWNDM0?=
 =?utf-8?B?dGxpWCtuWklxb241bVBSSExTc2dIMk1uVVBWeUpQMFhFdFBmRFZBZFU5UlV3?=
 =?utf-8?B?bk56ZDBpeFdhZ3lyY1JCS08rdjd2ZU1yODNaNklpbmpoYmVlM3R4UHZHQi9l?=
 =?utf-8?B?V2JIblNrWkJBdUJNVmVLcWFvQi9KdDZ0VUR0ZnF6NytnN0V2S1NWZjFuVlBM?=
 =?utf-8?B?K2pILzQ4ckk3NEhMbkxQWjhNR0Z6UVVZOTlPdGtOd2hVeDJJdlBHcHh5M20r?=
 =?utf-8?B?ZVZNZHhEb1pKM2E3bDI5Y3hpRWgva3Exb0s1MFpYcmw1R0FLdGU3NWNzSkpX?=
 =?utf-8?B?U2crSG80M2xLOHRuMFVZaEpLVFZmdnFWdVMxTXRmR0JNUVl0YytDU0lNbUlT?=
 =?utf-8?B?Um9JQ1RHeEwzUTk3T0dEUFBpMlFyYmFucno4SzlnMU9aaG1qTzM4UE9nNnYx?=
 =?utf-8?B?WUNzN2RVSnNqWC9BdGtYSUdTKzFML3FRSFk4YUpiL1IzbnNMR3BMeHVUd1ls?=
 =?utf-8?B?L0ExRXFjVE0wZGxweTZrY0xyZS9xdmRXZFV1VHh4TU5jVE1WQkdlNkY0OG96?=
 =?utf-8?B?czI4KysvamVSMHVncG9hTlg3S1NGRlRLcC9sWXJEVkQ5dXQ0cXdwZkdRbGNY?=
 =?utf-8?B?N0h5M3R0QXQ2RWttazN0SjFmRWVhNEJlNm91bkovdytSZXdUUkZvaEZRRFdY?=
 =?utf-8?B?Ym1LRXJscVROSTV4aCtlelNJOHB5N081c3MwdlRjdjdqUmFRaCtJbnlabVNG?=
 =?utf-8?B?YjlmdWN2MkU3bmdrNU1zL3hPT1FTcld6NG10bEpaK2pqWGhiMFdscHBDRjVS?=
 =?utf-8?B?VHBDTHlMY3R5QWwxVXA5MXk2YXhDTm5FdVYzdFluNkl0Njl5Q0NIRmRTUkZm?=
 =?utf-8?B?SFlQankwR2g4U3BtYStzczVWc2FZOGtOd1lPYUEzclIraHE2K2ZlN0VzNmFJ?=
 =?utf-8?B?SGhXcTg2MXA1b2tBcHo0QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkFXQTdhR2hUV1JYQUpWZEd0anptUlpaaHo1Vys1Nk13dGQwMkZEUW9kRjli?=
 =?utf-8?B?WWNjdUlibm5mcCs4a29iQTQ1QnVvZHlpd3BkKzV3RFhHZ0YyTytOckdiZlNN?=
 =?utf-8?B?UjNUcWJrRmNXTlJKZ1JWN1V6SThtYjJrdFZTWFZNQUtWTVh4YVRXS3pRR0M4?=
 =?utf-8?B?SkZIZ0VjVk1WYnNxQ2RIMDIyL0FNYUxKTUxQaE54UFIrNG9yZU9PM1g3WVdH?=
 =?utf-8?B?VlNBS29acldUV0lNbTRkZ2dpR1lFSmdJTElDbHNxa0llWW1ERDJaLzdLL292?=
 =?utf-8?B?aUhJRGc4c1NXOTJ5MWhOY0g5SnNuTTkzOVE1TXBKcUl3MG9aeXVjNUIxSTRV?=
 =?utf-8?B?TmJNU3RGWjJXVVZ3Z2JDT0hpTTFvVVdyQjBUa3hrazJrY1BEb1BXdXhIVS9C?=
 =?utf-8?B?UWZ0WlYxcllKRUJ3RGM0OW5HajJzN3VFZzY3dU5IdWlwSFk1V21uclIwbGlP?=
 =?utf-8?B?d0Q5WG5GdXJhNHdjYXVUbzNRN0NvWjl3RHN0RWU0c2RRNTcyZXFTbTVkenFT?=
 =?utf-8?B?d2g2UjVkc09URUZ0dUk1elVpNTNiUlUyL0lRWDZHeWhGVjZDcHdPQm5YSThT?=
 =?utf-8?B?N01oR0FEdW5uaDZIMXdKUnhHQnlBcFRHV0JOU0o3QUJVbDAxT0dBZVFlNGRy?=
 =?utf-8?B?TDBUc29heDZNcTk0MkRJVHI3NnBWVkhMekU4d0tTVkk3T0hzRG5YU0xvNG5q?=
 =?utf-8?B?QU1hdXRkZENIM3l5K0xjUWRLQjRtM0V6clpNN2o4N3oyZ05aZWczQlFkVW9U?=
 =?utf-8?B?MjVvck5kT3dlMnFQaVNBYUZKRG1kNEhiT2NpZFRxRllrVldXMUU0Wk4yclRr?=
 =?utf-8?B?WFpjWWNWalZKUVdwN1NicTVZRzg2bGlpS2ZGbHQ5YzExMkVYbTdydzd1THVP?=
 =?utf-8?B?R2FpNzh2dnpCUjlOT1M2bWJBTHhHODdEbUdERkszRDVKNWV3QW9UelgxYzNN?=
 =?utf-8?B?d1E0YjFqdHdZVG4yVTJWN3lGNHhtWm1vdDBYS3hvbjRlQlMvNVFSY3NiYjU3?=
 =?utf-8?B?ZW9uU1JYMC92emk4bG1uNjZqbE5uZGJUaEoyZWl2ejlOUU0zcnE5WUJCZ29O?=
 =?utf-8?B?NDc0cDVzL0paSFM0SzJPdGwvODdZRnBNTGRCR2IvWjg3dkZhN3hwSTNDckdw?=
 =?utf-8?B?ZU5ZM1U1M25DTEYrek9mVUhjU3dLMnRWU3FVcE11QzRJM1RrVmFXQ29zTXBh?=
 =?utf-8?B?dHNudWhKY1c4QTk0T2JUbkhBWFZKN3JEZXllTUhrUzJhZDZBcUxFN0NidGhv?=
 =?utf-8?B?QnZ5TVV4MkY0citWeTNaeTNIaWVNeFJ3KzEyeDVvdjRuUE5NQTRWS2ZNOU11?=
 =?utf-8?B?U0F2YVBiWVovVGhpSFcxaGU1UFhyY05tUW52RlJRYWY3SWJkVGsydm1rMjFm?=
 =?utf-8?B?c0dMOVJYdFh4UzVRdW9aOU5TSGkwVFF5blhkV0RQTStGNU5henB4K01obStD?=
 =?utf-8?B?eDM0VS9EZS9CVlNBYjNyL29FUFZKU3RJcysvTHlFbW9yUWxzOWZjYjgzb040?=
 =?utf-8?B?L2EwZmdEc0I3OXVJbTA0dWpPb1d3eHRXRWFDeVRWRDhEWmZMYjdXQy9rLzcr?=
 =?utf-8?B?ck1QZFAyaDloeDdWUE9Ibm0vVnVSSUJpeFNydG5YekhEdi93SDlIdWk3WFhN?=
 =?utf-8?B?NW9mYi83WExwNVhrRGZUY1ZsOGtHTGhmS1hoSlhGb3V2dmVQVGY4MHdnQnBR?=
 =?utf-8?B?YUh2dCtxS0NudnBuM3hHa0pEYUp5bjdVaVpDYVVycnpKaldaZmV2aGN1cE12?=
 =?utf-8?B?U3VpWFNtQlpPMUhFVmFJTDdVdFg3a0l4K2J0WXFOMXV6eDQ4amxJbGN1Rmpo?=
 =?utf-8?B?ZkhLZytjR1B6UkJYWjZiZFpvOExpcHdlazJPci9sV1ZsVlZ2SnNtSGtMN1Vt?=
 =?utf-8?B?Wm5zd2JIVlVXbUdUeU91R0YxcVJFTnRlRTl0cHJEM1IyWXdaVnZ2MW9OL0xW?=
 =?utf-8?B?dUhLelU4cmJxbUlIQ3hVdHhiSUFwRXU2ZWpicGhlai9peUlFUHNpOHVWTGRu?=
 =?utf-8?B?MndYSlFsN0F3RGNFYjNZNjlRcTVZMXJXWGxOV0ZXS3dUWDBub1owOXEvYlA4?=
 =?utf-8?B?RWYwMjRRcFNMQUtaYkRrSGZHZnkwVzJ0dy92c0REdHJySnFubGhob28rbjU2?=
 =?utf-8?B?azVGSjRmN0tHVEdPQkVvVW5mM0V0NlRxYWpiU0E2NHBUTUFjeVdZTmpZVXJY?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e8f5c1-4363-42bf-a548-08dc83e4b107
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 15:49:02.5397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zt4XUgXIOxN78wv/bLcDDMgDGH31KcOr7+l14ncBsdH+pd8J8cqrEo56jzKtNo+Xsk4ujcUAqtk++0rhrN1D5E45KO80xQPDzoPZVUI9Kjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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

SGkgR3VzdGF2bywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTb3Vz
YSwgR3VzdGF2byA8Z3VzdGF2by5zb3VzYUBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVu
ZSAzLCAyMDI0IDg6NDUgQU0NCj4gVG86IFNyaXBhZGEsIFJhZGhha3Jpc2huYSA8cmFkaGFrcmlz
aG5hLnNyaXBhZGFAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgU3Jp
cGFkYSwgUmFkaGFrcmlzaG5hDQo+IDxyYWRoYWtyaXNobmEuc3JpcGFkYUBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNi82XSBkcm0veGU6IEFkZCByZWcgcmVhZC93cml0ZSB0
cmFjZQ0KPiANCj4gUXVvdGluZyBSYWRoYWtyaXNobmEgU3JpcGFkYSAoMjAyNC0wNS0zMCAxMjox
MzoxMy0wMzowMCkNCj4gPlRoaXMgd2lsbCBoZWxwIGRlYnVnIHJlZ2lzdGVyIHJlYWQvd3JpdGVz
IGFuZCBwcm92aWRlcw0KPiA+YSB3YXkgdG8gdHJhY2UgYWxsIHRoZSBtbWlvIHRyYW5zYWN0aW9u
cy4NCj4gPg0KPiA+djI6IEZpeCBrdW5pdCBlcnJvcg0KPiA+djM6IFByaW50IGRldmlkIHRvIGhl
bHAgaW4gbXVsdGktZ3B1IHNldHVwDQo+ID4NCj4gPlNpZ25lZC1vZmYtYnk6IFJhZGhha3Jpc2hu
YSBTcmlwYWRhIDxyYWRoYWtyaXNobmEuc3JpcGFkYUBpbnRlbC5jb20+DQo+ID4tLS0NCj4gPiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jICB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0N
Cj4gPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaCB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+IDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
bWlvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+ID5pbmRleCAyNDhlOTNlYzZk
ZjcuLmE0NGJhYTM0OTEwOSAxMDA2NDQNCj4gPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
bWlvLmMNCj4gPisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4gPkBAIC0yNyw2
ICsyNyw3IEBADQo+ID4gI2luY2x1ZGUgInhlX21vZHVsZS5oIg0KPiA+ICNpbmNsdWRlICJ4ZV9z
cmlvdi5oIg0KPiA+ICNpbmNsdWRlICJ4ZV90aWxlLmgiDQo+ID4rI2luY2x1ZGUgInhlX3RyYWNl
LmgiDQo+ID4NCj4gPiAjZGVmaW5lIFhFSFBfTVRDRkdfQUREUiAgICAgICAgICAgICAgICBYRV9S
RUcoMHgxMDE4MDApDQo+ID4gI2RlZmluZSBUSUxFX0NPVU5UICAgICAgICAgICAgICAgIFJFR19H
RU5NQVNLKDE1LCA4KQ0KPiA+QEAgLTQ1NSwxNiArNDU2LDI0IEBAIHU4IHhlX21taW9fcmVhZDgo
c3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX3JlZw0KPiByZWcpDQo+ID4gew0KPiA+ICAgICAg
ICAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBndF90b190aWxlKGd0KTsNCj4gPiAgICAgICAgIHUz
MiBhZGRyID0geGVfbW1pb19hZGp1c3RlZF9hZGRyKGd0LCByZWcuYWRkcik7DQo+ID4rICAgICAg
ICB1OCB2YWw7DQo+ID4NCj4gPi0gICAgICAgIHJldHVybiByZWFkYigocmVnLmV4dCA/IHRpbGUt
Pm1taW9fZXh0LnJlZ3MgOiB0aWxlLT5tbWlvLnJlZ3MpICsgYWRkcik7DQo+ID4rICAgICAgICB2
YWwgPSByZWFkYigocmVnLmV4dCA/IHRpbGUtPm1taW9fZXh0LnJlZ3MgOiB0aWxlLT5tbWlvLnJl
Z3MpICsgYWRkcik7DQo+ID4rICAgICAgICB0cmFjZV94ZV9yZWdfcncoZGV2X25hbWUoZ3RfdG9f
eGUoZ3QpLT5kcm0uZGV2KSwgZmFsc2UsIGFkZHIsIHZhbCwNCj4gc2l6ZW9mKHZhbCksIHRydWUp
Ow0KPiA+Kw0KPiA+KyAgICAgICAgcmV0dXJuIHZhbDsNCj4gPiB9DQo+ID4NCj4gPiB1MTYgeGVf
bW1pb19yZWFkMTYoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX3JlZyByZWcpDQo+ID4gew0K
PiA+ICAgICAgICAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBndF90b190aWxlKGd0KTsNCj4gPiAg
ICAgICAgIHUzMiBhZGRyID0geGVfbW1pb19hZGp1c3RlZF9hZGRyKGd0LCByZWcuYWRkcik7DQo+
ID4rICAgICAgICB1MTYgdmFsOw0KPiA+Kw0KPiA+KyAgICAgICAgdmFsID0gcmVhZHcoKHJlZy5l
eHQgPyB0aWxlLT5tbWlvX2V4dC5yZWdzIDogdGlsZS0+bW1pby5yZWdzKSArIGFkZHIpOw0KPiA+
KyAgICAgICAgdHJhY2VfeGVfcmVnX3J3KGRldl9uYW1lKGd0X3RvX3hlKGd0KS0+ZHJtLmRldiks
IGZhbHNlLCBhZGRyLCB2YWwsDQo+IHNpemVvZih2YWwpLCB0cnVlKTsNCj4gPg0KPiA+LSAgICAg
ICAgcmV0dXJuIHJlYWR3KChyZWcuZXh0ID8gdGlsZS0+bW1pb19leHQucmVncyA6IHRpbGUtPm1t
aW8ucmVncykgKyBhZGRyKTsNCj4gPisgICAgICAgIHJldHVybiB2YWw7DQo+ID4gfQ0KPiA+DQo+
ID4gdm9pZCB4ZV9tbWlvX3dyaXRlMzIoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX3JlZyBy
ZWcsIHUzMiB2YWwpDQo+ID5AQCAtNDcyLDYgKzQ4MSw3IEBAIHZvaWQgeGVfbW1pb193cml0ZTMy
KHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCB4ZV9yZWcNCj4gcmVnLCB1MzIgdmFsKQ0KPiA+ICAg
ICAgICAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBndF90b190aWxlKGd0KTsNCj4gPiAgICAgICAg
IHUzMiBhZGRyID0geGVfbW1pb19hZGp1c3RlZF9hZGRyKGd0LCByZWcuYWRkcik7DQo+ID4NCj4g
PisgICAgICAgIHRyYWNlX3hlX3JlZ19ydyhkZXZfbmFtZShndF90b194ZShndCktPmRybS5kZXYp
LCB0cnVlLCBhZGRyLCB2YWwsDQo+IHNpemVvZih2YWwpLCB0cnVlKTsNCj4gPiAgICAgICAgIHdy
aXRlbCh2YWwsIChyZWcuZXh0ID8gdGlsZS0+bW1pb19leHQucmVncyA6IHRpbGUtPm1taW8ucmVn
cykgKyBhZGRyKTsNCj4gPiB9DQo+ID4NCj4gPkBAIC00NzksMTEgKzQ4OSwxNSBAQCB1MzIgeGVf
bW1pb19yZWFkMzIoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX3JlZw0KPiByZWcpDQo+ID4g
ew0KPiA+ICAgICAgICAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBndF90b190aWxlKGd0KTsNCj4g
PiAgICAgICAgIHUzMiBhZGRyID0geGVfbW1pb19hZGp1c3RlZF9hZGRyKGd0LCByZWcuYWRkcik7
DQo+ID4rICAgICAgICB1MzIgdmFsOw0KPiA+DQo+ID4gICAgICAgICBpZiAoIXJlZy52ZiAmJiBJ
U19TUklPVl9WRihndF90b194ZShndCkpKQ0KPiA+LSAgICAgICAgICAgICAgICByZXR1cm4geGVf
Z3Rfc3Jpb3ZfdmZfcmVhZDMyKGd0LCByZWcpOw0KPiA+KyAgICAgICAgICAgICAgICB2YWwgPSB4
ZV9ndF9zcmlvdl92Zl9yZWFkMzIoZ3QsIHJlZyk7DQo+ID4rDQo+ID4rICAgICAgICB2YWwgPSBy
ZWFkbCgocmVnLmV4dCA/IHRpbGUtPm1taW9fZXh0LnJlZ3MgOiB0aWxlLT5tbWlvLnJlZ3MpICsg
YWRkcik7DQo+IA0KPiBUaGlzIHJlYWRsKCkgY2FsbCBuZWVkcyB0byBiZSBpbnNpZGUgYW4gImVs
c2UiIHN0YXRlbWVudCwgcmlnaHQ/DQpBaCBuaWNlIGNhdGNoLiBXaWxsIGZpeCB0aGF0Lg0KPiAN
Cj4gPisgICAgICAgIHRyYWNlX3hlX3JlZ19ydyhkZXZfbmFtZShndF90b194ZShndCktPmRybS5k
ZXYpLCBmYWxzZSwgYWRkciwgdmFsLA0KPiBzaXplb2YodmFsKSwgdHJ1ZSk7DQo+ID4NCj4gPi0g
ICAgICAgIHJldHVybiByZWFkbCgocmVnLmV4dCA/IHRpbGUtPm1taW9fZXh0LnJlZ3MgOiB0aWxl
LT5tbWlvLnJlZ3MpICsgYWRkcik7DQo+ID4rICAgICAgICByZXR1cm4gdmFsOw0KPiA+IH0NCj4g
Pg0KPiA+IHUzMiB4ZV9tbWlvX3JtdzMyKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCB4ZV9yZWcg
cmVnLCB1MzIgY2xyLCB1MzIgc2V0KQ0KPiA+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgNCj4gPmluZGV4IDQx
ZTBiMzM2NTg3Ni4uZDU2ZTA3MzU2MGVlIDEwMDY0NA0KPiA+LS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3RyYWNlLmgNCj4gPisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+
ID5AQCAtMzQyLDYgKzM0MiwzNiBAQCBERUZJTkVfRVZFTlQoeGVfaHdfZmVuY2UsIHhlX2h3X2Zl
bmNlX2ZyZWUsDQo+ID4gICAgICAgICAgICAgIFRQX0FSR1MoZmVuY2UpDQo+ID4gKTsNCj4gPg0K
PiA+K1RSQUNFX0VWRU5UX0NPTkRJVElPTih4ZV9yZWdfcncsDQo+ID4rICAgICAgICBUUF9QUk9U
Tyhjb25zdCBjaGFyICpkZXZpZCwgYm9vbCB3cml0ZSwgdTMyIHJlZywgdTY0IHZhbCwgaW50IGxl
biwgYm9vbA0KPiB0cmFjZSksDQo+ID4rDQo+ID4rICAgICAgICBUUF9BUkdTKGRldmlkLCB3cml0
ZSwgcmVnLCB2YWwsIGxlbiwgdHJhY2UpLA0KPiA+Kw0KPiA+KyAgICAgICAgVFBfQ09ORElUSU9O
KHRyYWNlKSwNCj4gDQo+IExvb2tzIGxpa2UgdHJhY2UgaXMgYWx3YXlzIHRydWUuIEFyZSB0aGVy
ZSBwbGFucyB0byBoYXZlIGEgZmFsc2UgdmFsdWU/DQpJIGRvbuKAmXQgdGhpbmsgd2UgaGF2ZSBh
IG5vIHRyYWNlIHZhcmlhbnQgZm9yIGFueSBjYWxscy4gU28gSSB3aWxsIHNpbXBseSBvbWl0IHRo
aXMgYXJndW1lbnQuDQoNCi0tIFJhZGhha3Jpc2huYSBTcmlwYWRhDQo+IA0KPiAtLQ0KPiBHdXN0
YXZvIFNvdXNhDQo+IA0KPiA+Kw0KPiA+KyAgICAgICAgVFBfU1RSVUNUX19lbnRyeSgNCj4gPisg
ICAgICAgICAgICAgICAgX19hcnJheShjaGFyLCBkZXZpZCwgMTIpDQo+ID4rICAgICAgICAgICAg
ICAgIF9fZmllbGQodTY0LCB2YWwpDQo+ID4rICAgICAgICAgICAgICAgIF9fZmllbGQodTMyLCBy
ZWcpDQo+ID4rICAgICAgICAgICAgICAgIF9fZmllbGQodTE2LCB3cml0ZSkNCj4gPisgICAgICAg
ICAgICAgICAgX19maWVsZCh1MTYsIGxlbikNCj4gPisgICAgICAgICAgICAgICAgKSwNCj4gPisN
Cj4gPisgICAgICAgIFRQX2Zhc3RfYXNzaWduKA0KPiA+KyAgICAgICAgICAgICAgICBtZW1jcHko
X19lbnRyeS0+ZGV2aWQsIGRldmlkLCAxMik7DQo+ID4rICAgICAgICAgICAgICAgIF9fZW50cnkt
PnZhbCA9ICh1NjQpdmFsOw0KPiA+KyAgICAgICAgICAgICAgICBfX2VudHJ5LT5yZWcgPSByZWc7
DQo+ID4rICAgICAgICAgICAgICAgIF9fZW50cnktPndyaXRlID0gd3JpdGU7DQo+ID4rICAgICAg
ICAgICAgICAgIF9fZW50cnktPmxlbiA9IGxlbjsNCj4gPisgICAgICAgICAgICAgICAgKSwNCj4g
PisNCj4gPisgICAgICAgIFRQX3ByaW50aygiZGV2OiAlczogJXMgcmVnPTB4JXgsIGxlbj0lZCwg
dmFsPSgweCV4LCAweCV4KSIsDQo+ID4rICAgICAgICAgICAgICAgICAgX19lbnRyeS0+ZGV2aWQs
IF9fZW50cnktPndyaXRlID8gIndyaXRlIiA6ICJyZWFkIiwNCj4gPisgICAgICAgICAgICAgICAg
ICBfX2VudHJ5LT5yZWcsIF9fZW50cnktPmxlbiwNCj4gPisgICAgICAgICAgICAgICAgICAodTMy
KShfX2VudHJ5LT52YWwgJiAweGZmZmZmZmZmKSwNCj4gPisgICAgICAgICAgICAgICAgICAodTMy
KShfX2VudHJ5LT52YWwgPj4gMzIpKQ0KPiA+Kyk7DQo+ID4rDQo+ID4gI2VuZGlmDQo+ID4NCj4g
PiAvKiBUaGlzIHBhcnQgbXVzdCBiZSBvdXRzaWRlIHByb3RlY3Rpb24gKi8NCj4gPi0tDQo+ID4y
LjM0LjENCj4gPg0K
