Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92CFC5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 00:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A4A10E0C5;
	Fri, 14 Aug 2026 00:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGcjQhru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596CE10E0A7
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 00:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786665666; x=1818201666;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JZ+VqG8yWsiixKi8mqKTmRfxbd2o4hbfN4yGE41xB6s=;
 b=gGcjQhruJb32PoiJIFPLXgYMOiHmHzgVPmo0IYDS13b2mM7W+ve6rHyt
 z0+vSnD7+iugr6MBwApxuRZWfz06FJXnByeeWFc6/SrZDG8CSHReVQ0ux
 B+vGKNu7azOQrGdenJHQL+4sJJ5LXjfNPygYr9Bc4gs3CORTQjjW/gX0C
 ZEeOtY+Rp2oKR8QC/aKEqhINfvCURfb1wqD92g3TIY1OFdzxAwpcc54bq
 c2ekO9Fc6mGUEEv99UNF6vVdwmg/6xY0dxDcdSaJ0xd18EaiCqYuTwQe0
 F5b8f2zY4pUglGYv1zJ/NrIDzLQohosTnzIRmcW1QWuwgU/h3JUuRjOk3 Q==;
X-CSE-ConnectionGUID: JMDQB1CMQ4+8kD/ajseAVA==
X-CSE-MsgGUID: SstTopDaTCeLe8b7MZO+IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87466441"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87466441"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 17:01:05 -0700
X-CSE-ConnectionGUID: XBelQW/IQSKnB6PuhHnEiw==
X-CSE-MsgGUID: 1d9SgmNhT4WIO587gw8psA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="260280608"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 17:01:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 17:01:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 17:01:05 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 17:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+1MrGoWXT8OBscSLrbStntoLZxVRVYT9Pke+96iBTOltzxAvyLgyLwR3YZDtOMVLfalOzDZChdKCuQjCIPtUuQIdmQ+9eQ4Ih/SrW/9i5DFHXcWhMHLS2fy9lBCnYvpfuYRfAjHNMCF/uMM3F1YBHD2KoJ2Jtvf6ygQCXCoYIbdZgsodCPsvo/JGT3wMeZRqTgn11vQFT9gFGXMIPfeWgsz7LJPGQuSu0Vn5UCZob2HTL3A9wQdhRWnC0qYZ57V/bmmnh+Xi073vDv7DK7w9rH2WX9OpECDGySJhkWOahc/G+Qf9Z3/aDJz1HGEaEvLJoqN2Rj8A9NQ84Q7pfsKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DueXKjxXXQoqol4OmsA+BNxvHOll8sp8WOyBxLTp14=;
 b=rbN1slKHka350ZjALnattgUs+P1UOrT89M8FYsDc3Jz54bSDpwtjklRMjzXhXateheBzHRAEdEiVH6xsNVgpi2+H9S6Qe31126oQjydva3svUyPZdYTUNPFlC7AzkAY4Hc2qOUERM0qospGbcYBc9RS6FeJx30QNwldORlwjb+Uqvpyqbz4yFuwkpUJfUMHv17KHjbLXtqLqkcCglvmWn2eHSfwMKInfZGjFXIBIxCCBDFCoJTEoZSDMPk3G2L/2lF6HD7T7w4mG78ybIR7m1/Tgapdo7HMU27R+kz5ArpvWP8LfaLT5NZt7eZ4QvGoCm+A/xsWS0/fRSGxEodIzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV4PR11MB9468.namprd11.prod.outlook.com (2603:10b6:408:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 00:01:03 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 00:01:02 +0000
Message-ID: <fbc8d03b-093f-41f3-8396-6d80398c1518@intel.com>
Date: Fri, 14 Aug 2026 05:30:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/32] drm/xe/log: Add component/location decorations
 to dmesg
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::19) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV4PR11MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 4507194b-2bca-4ce5-cb0b-08def9972121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cFH+pNTPRk3b1jBtyeyz37Vs69b/yy4uHrB1xLQeGdJuAaoTQLheGiSk7LTyKXu4r8Ifv5GcmDvNgmy/186mKO4HtjFtqRajzTFOWI/qA1w9lp2HMIKxm1l40ruM3S039ZVofbQ4bm3fuLxbhkouuxasl/gfiIUV1xk9FiGx+w7zUsAwXOQLKvQV2MGMeHYYtETratpkvTg24NccBoa+Snvk/p2zFG/QgNtBg7oP623rTtLbLVthqOQffNOSHQ4ABuM69g+1Fbxn3fvHmdxd5q2R8i5wjAxSl8ovDeXOkc7ky4n1a6cl1h3s5Ph4Nvuxk8m24WPgD6TsmmzMMvUh+3Q7H+RX60yNV0nY8J/VjRO09a2P/uoSrnpynuWMEJ3GKKAHwNxcjRfV5FcBbz7XEM7OEudFf0qt9p/yNetk//AXpbVLsyLk/3VvFgEn+ay53qfQqAVGI50New08dqeBMCr/KoyFlzdPw6syA5YwJoEz4L8npdS1giFJTOb/ON6TS+3pM8XgnN0MMvQ1ZPaPIXJiqykuvlllze7CSqSOw85y8TK+8cTNhrjNe+7ydW87CgX7rIQ+vS70OREjma/uCMk1c1Yn2VOl8IW8kwOEmqJHwdDR2ydoZrubFkiWrScnEYcZZI0GVzOjHjzT+UnSaV8JjcPLd7uAfSzpTLdohFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWFCUjgxck5DL0NVOHRjT0ZOclZJRDd4dlNFYnV1VFpjSUs0T3BTN2x1cGYr?=
 =?utf-8?B?OUl4RFJBWkIzZ09MOWZYMXNUK1lrNWdGWi9pUWxtd3cxMjdqOVBFcWxZdlBa?=
 =?utf-8?B?cXZBSUNqMmFmeU5rVWtJS1d0a3BCRUx5MDM3ZmZ2SHIxSGczK1I0UW1WYy9k?=
 =?utf-8?B?enZrS0VyVzgvVEsxaU1hejhnSXp3NDNWWFc3T3JDbTZVY2lpd0pzNmFmczRt?=
 =?utf-8?B?UnJ6THowUnVMZ0VVaEdnd20vTDdQdXZYa25MV2xCSWlzbU5kYXFiUTR2QTFx?=
 =?utf-8?B?bmp2bExISE9NRW5iRGxqcDhOWXNNTURaYmdERERFRkhXSWI1OUZMdE1DV2Qy?=
 =?utf-8?B?UStFRDltbDlHVm5zZGRpSm13WlBMOTFRdG5ZUXRyZGg3SmNqMHh3M0FyWUQz?=
 =?utf-8?B?VkorZi9LZ0tNVGNxankzdFk4SHJTMnhBOXVXT3d6SERpVHFJNkp4ZVlRcFVu?=
 =?utf-8?B?dDdSbmJwdzBva3o1ZTQxc1pXbXUvWEpSMTQwaHdQVU1Sc0dQSnNUUCsvenpB?=
 =?utf-8?B?QWg5K3NHU1A3WmJVTEdNdnlnVXJBdm9WeXA1eWIrYzlWWDFvN1RIOWoyT25v?=
 =?utf-8?B?cXBLQjRnM2M1TmFEZGtCbk9KWVd1NnVLVGtJc0t0T09FZlBSZGhmWWtYREdn?=
 =?utf-8?B?OHF4dHhNTEFKU2xvYk8waW9DUnJEaTNBNSszM0dSWHI4ZWFCbzg1c1JrTThK?=
 =?utf-8?B?WVhIb1hxWkN6bGdJWExrOFlNbjZ0cGZEcXRpTlJXUE9nVGs3Z0hra25ncHNl?=
 =?utf-8?B?YUQ0d2tYN2xyUDd1aVpOU1hmRlpmRlMyUjZxWVB0OC9jbW9YTWd4TkNMNWF5?=
 =?utf-8?B?SDhXVW9YYTM4bG85VG9tUmE1MW1FcTlISTZOZDk0T1lxaHJjV3JnQ2EyV1Uz?=
 =?utf-8?B?R0x5VW9jWVQ2aWZqL0RDMmNyb09mWVQ5aE5JOStGZGJjeUNzQUcxY1JCWk1M?=
 =?utf-8?B?RnJ1SnRXU0w5RUFML3VnZFI0bEg3Yyt3cm5vOUFxYWhrdG5kTUFOeHN6RWFL?=
 =?utf-8?B?WnNFcGJsWnNEUXhTSkhYakFUMkxIRHZZU0JiVU1iMm12aEo5ZHQ3Slp3V01S?=
 =?utf-8?B?UVZHMmI2Ujg3R0c0TmQ5aHpLMWVPb3NsNmMxZkU4dHUxdXltNTRsWW5UYmRy?=
 =?utf-8?B?ajQvMU5xL0JsMk5zUExELzg3TitiVTZteXJGM28rSWRCY2k4R3VzRytNS1dY?=
 =?utf-8?B?cy9GQnhlV0pxamt6OVAyallTNDJlSjJXbkdyamcwN1BMTG5xUUU2NkFXWVRw?=
 =?utf-8?B?VHhQdzl4U1A4R0drNENYVkk2dGVHRHhKOVlnQzFhMUNmZE5GSzhYR1pXZEtM?=
 =?utf-8?B?YjBFYUVQK1lmOWwwWDEzWlVWTmFMY2JjMVlxOERsNFNYT3pnVmd2Zklyd1lj?=
 =?utf-8?B?dzZlcWtpSUEvRXB6OGlhMFpySnE2OW96SXZGekZJTVk2Y0xWUjh2OVhNYmY5?=
 =?utf-8?B?R1hNeW1nSmtuZVJzSVZCSWExamE1WGNmbGdIdUk1WS9zV3I3ckk5OWxVZWtn?=
 =?utf-8?B?clBwZEw4T2krdmlzcWt6d1FBR3YyWmJoeHV2SlhiczBjSjJyUWw3bUUwSWRO?=
 =?utf-8?B?VjlYTnJpS0k3WTE3NFNadkUvQTcyYzhrVFBCWmJNWlRRM29PZUw0U3VqekN3?=
 =?utf-8?B?dnhIczNXTjZYR1ZWRzB2YlhORGY1S3NhemNkZjRoUW54M3NEc0pTcERRd0RP?=
 =?utf-8?B?MVlhVXRZR3lzZmdwcTd2bitTN0xHZTg5dUNVQnlCYlhKWWZ6Ui9SRzZWNTgy?=
 =?utf-8?B?eUM1T3d5YXN6d2crcUJzUjd4OHphL3hSQWFyUElPbXc1ZDNBY3pkbVNDbHZa?=
 =?utf-8?B?akdhSTJ6eHo4d3JmUWNYTXd5MWxSWk5mcm9TdGZ2OWpmZVdyRFhIcTkxcEo1?=
 =?utf-8?B?akdtWTNYOXBFMnVTU0w1TzROekRvSGxBdlVJeTk4Ui9nYUFsK0xpMExWenBJ?=
 =?utf-8?B?KzBNMnRBZFJQajliZjcxYjZUL0lZc3o2djhES2hVSkNmeUVPVVR3YXRFTThI?=
 =?utf-8?B?OERSNlAvbFo1a3VjSU1HTDRqY3QyQlRWRkVtZUtBdVZzNlg3dWxrT0RRK3RL?=
 =?utf-8?B?N0F6Z1JVUFhwb0o1RjJDZUdqM3N2SWpCeU14VWJRZ1R6MnFrSGlCa2ZRVWU5?=
 =?utf-8?B?OW8wck1DVWkyTXRiS29XUVJyMEthVytQbG5QRm1iUkxyUUIwdHB4eWVrcU4z?=
 =?utf-8?B?VDVJOW5SazJGWm1CZXZQMUdCY2h4R3p3Si9RY3krcHYvZ0t1bStxbHNvQjdU?=
 =?utf-8?B?eTdXK2ovQjNHVmJTMjI1aWl6WmpkQzBPdUhsYmRHZlUrNldLcXVhTkpoZFRK?=
 =?utf-8?B?dVp0dWFPY205RDJXOUZkNFkya3FTYW8wUEJVaThSZFMxTXFtODVSUWk4SEx4?=
 =?utf-8?Q?XYrYUrWkSN4DRXNw=3D?=
X-Exchange-RoutingPolicyChecked: i4fYW5zGNqErRJxzUFkIJZeSHpCTs6p1Ii1KHdOg8i9AITYJZEc4TjAaLOlvdArHkIgXtlPWun4aP99dyminUUpQWKJlFTwdzexXA/OHbN2nw1x3g767ybJHgDTc0N9i44pCPFljijFHzsw9N8svRNC0Q15VdDJYjz6dgjrLRwsK5EWUP5RCXKe/3xEdjh+JrPIWKCyr+SHOFDAl9qGlHhh++mBhnZToI6+EWTDZJCx06S0DjoqvKMM1syNwHvsy1nHhT7MQ1AbJq3GyFVUf5XvYTxaSYpAOdAnewWHF607GFSUUMxPilQVEMzZeTnDhzdNYWl8C9ZtT4qXHcpmceg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4507194b-2bca-4ce5-cb0b-08def9972121
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 00:01:02.6005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D020J+DXvBJVwdLUFjOzOmISmG9CCM9ExHZYZD2TmvhEajtsXFrUhy/seEYqNiVhjAJm3bntItwyMahNl7alZiBFT54GhTAScju3rOjHOvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9468
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> While we can't directly use our xe_tile|gt_err|info helpers to get
> nice Tile/GT decorations, we can still add them manually based on
> the structured location parameter. Similarly, we can add component
> name prefix based on the component identifier.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: check against info->tile_count (Sashiko)
>      more diagnostics on bad usage (Michal)
> ---
>   drivers/gpu/drm/xe/xe_log.c | 102 +++++++++++++++++++++++++++++++++---
>   1 file changed, 94 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index ae4f6e33f5b8..0b423ed121cd 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -3,6 +3,9 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include "abi/xe_log_abi.h"
> +
> +#include "xe_device.h"
>   #include "xe_log.h"
>   #include "xe_printk.h"
>   
> @@ -13,6 +16,85 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
>   	/* TODO */
>   }
>   
> +static const char *log_unknown_component_prefix(u32 component)
> +{
> +	u32 class = FIELD_GET(XE_LOG_COMPONENT_CLASS_MASK, component);
> +	u32 type = FIELD_GET(XE_LOG_COMPONENT_TYPE_MASK, component);
> +
> +	WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unrecognized component %u.%u\n", class, type);
> +	switch (class) {
> +#define MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(_CLASS) \
> +	case XE_LOG_COMPONENT_CLASS_##_CLASS: return #_CLASS "? ";
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(SYSTEM)
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(DRIVER)
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(FEATURE)
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(FIRMWARE)
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(HARDWARE)
> +#undef MAKE_XE_LOG_COMPONENT_CLASS_PREFIX
> +	}
> +	return "COMP? ";
> +}
> +
> +static const char *log_component_prefix(u32 component)
> +{
> +	switch (component) {
> +#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_CASE_PREFIX)
> +#undef MAKE_XE_LOG_COMPONENT_CASE_PREFIX
> +	}
> +
> +	return component ? log_unknown_component_prefix(component) : "";
> +}
> +
> +static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return xe ? xe_device_get_gt(xe, id) : NULL;
> +}
> +
> +static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
> +}
> +
> +static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
> +{
> +	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
> +	u32 id = FIELD_GET(XE_LOG_LOCATION_ID_MASK, location);
> +
> +	if (!location || type == XE_LOG_LOCATION_TYPE_DEVICE) {
> +		if (id)
> +			goto unrecognized;
> +		strscpy(buf, "", size);
> +	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
> +		struct xe_tile *tile = get_tile_safe(pdev, id);
> +
> +		if (!tile)
> +			goto unrecognized;
> +		snprintf(buf, size, "Tile%u: ", id);
> +	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
> +		struct xe_gt *gt = get_gt_safe(pdev, id);
> +
> +		if (!gt)
> +			goto unrecognized;
> +		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
> +	} else {
> +		goto unrecognized;
> +	}
> +
> +	return buf;
> +
> +unrecognized:
> +	pci_WARN(pdev, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +		 "LOG: unrecognized location %u.%u\n", type, id);
> +	snprintf(buf, size, "LOC%u.%u? ", type, id);
> +	return buf;
> +}
> +
>   static bool is_hw_sigid(enum xe_sigid sigid)
>   {
>   	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> @@ -74,20 +156,24 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>   			   u32 component, u32 location, const void *data, size_t len,
>   			   struct va_format *vaf)
>   {
> +	char buf[32];
> +	const char *loc_prefix = log_location_prefix(pdev, location, buf, sizeof(buf));
> +	const char *comp_prefix = log_component_prefix(component);
>   	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
>   	const char *sev_prefix = log_sev_prefix(cper_sev);
>   
> -	/* TODO: add component/location details */
> -
>   	if (IS_ERR(data))
> -		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> -				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%s%s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix,
> +				 loc_prefix, comp_prefix, vaf);
>   	else if (data && len)
> -		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> -				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%s%s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix,
> +				 loc_prefix, comp_prefix, vaf);
>   	else
> -		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> -				 sigid, sev_prefix, hwe_prefix, vaf);
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix,
> +				 loc_prefix, comp_prefix, vaf);
>   }
>   
>   /**
