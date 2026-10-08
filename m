Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B428CA6016
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 22:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECCC10E155;
	Thu,  8 Oct 2026 22:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLINEQJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3B10E155
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791497839; x=1823033839;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cq8SuIRjAppVxPzb7jlUTv2TLWopbUNEJ129KyNhpuE=;
 b=lLINEQJT8AvRF72A+zaHC2RlkDxbYa6vPIQN11Hb2A3zbtzWhkmolGR1
 RPLra0l4zlnRMQ6CbvmNyqtcivcylTorEhQxPf3s862hhQl4NN61ddBgw
 1BfBx0FMnaepO/oC7ZxgX1aWdesoQWMeY69HT978wFHdh4Scws27Zgj0Q
 UjBY4qsz7aFrTfpPj0DmZTbIuHUPLQHDf/9779TBPKQlmZZvfutAACKaw
 R6wgNV8UsB8r4dCqlDNopdrm2oMAgBuuCwjnvEJsVCdaLfrMZdEBTd0V1
 DLCDWjQhDvQaXveONpCSI+vFM9oT3sPWn8MkmluchG9AhdFldXNM0EqUe w==;
X-CSE-ConnectionGUID: ORNDrWpBQt2wvwVjFw1/7g==
X-CSE-MsgGUID: 9Q3E3HHXSa6B0LvSVOeLOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="319864"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="319864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:17:18 -0700
X-CSE-ConnectionGUID: ZHKDqdRFTIq5NjB1sAdQBg==
X-CSE-MsgGUID: tGMFtqdnSnGVb62PtS5UIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="108417"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:17:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:17:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 15:17:17 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJYIeg+enQ1/tQPsN1lIN1BM/dl3qzxLIcFp/l+eVyZzdOOryCwHyW9MWfzxw1F2GX450njF+aR6e5+UDmlhpxuxmmJNYe94rrvxEKNkB6u9n0JTPEAEA2BzJ8NLWzZY7JijDilHxGwrTIINLq2coEoSGCUZRdPFOESRmNZ3NriN2Uz465PZFjQeHobNIJxS37l866iSOx7cpjy+eycQui16XSGglkVPHENpyfZzzbhiG8HutqJX3IA7SAb9FK63mhoMyKmHw415J2BQboUV4xv0gGcUakcF34SPb8nWrTXPbQ54cyDV7Arw7DUTXBM92GxqU+61EDO5RXYKrtJejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=327jsl61Cdm4KZHTS5EdapbeEteZLe1t92RWle7Aoqw=;
 b=o0UMIvz9ZWOtrgyGou3egWDn65+4Ti6MMq63xYKXVguhaVo62KB4DLsl8UP9is/0wyL256jVsvdI7ku/fM62NbIEKjEBjH2BEqfljl6QW8NJcAwS6gV8UygEqPCDEn0/t0mpizmh1rB5L7Oedd+TEz0SosSpUHZLFZ+pMaPjvm82gF5EavNyG2LdenEFNCtNqmqu9DPg8V9j7gJUJL9hLQo6Tx9U79MJRjDddUrAVaNyDjoTn5CIROk6Ip8T3V9KrGfmlY6iCDaLH28etfHDiozb24N+zKqxQYdm7IrvD1l1U9RKC+7NjL5PO487+wZIoPdieqwEVyv9zHqIQVHLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by CYYPR11MB8332.namprd11.prod.outlook.com (2603:10b6:930:be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 22:17:13 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 22:17:13 +0000
Message-ID: <99616b68-6ecd-4853-9a99-4e4e03f04f6b@intel.com>
Date: Thu, 8 Oct 2026 15:17:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/xe/guc: Cleanup error codes and handling for
 CT errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
 <20260922231758.2695562-13-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260922231758.2695562-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|CYYPR11MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f3ad31-2879-45d8-17f9-08df2589e75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|5023799004|4143699003|11063799006|3023799007|10067099003|56012099006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: G4Z5wzRXDaWYI4OjPyy+GGiulEHk6Q81iBYpbTNHwecS5CJHSAUOkeO8EuK/BP6o9Jh6QYGrtU1vs/ccK4091H6GxeeO+u8YAk6HtRHcUKMFSoko6HuwhKmPLU+IAnzdsowZTtKaMA+UQRvtswUaYXg6nXS8xuE1v+8P/gp9KbcC0a/VM5qxF+7EJNw5VxTHG+lOyQqsX3uralZufo67l3C3ehR3AJONOfgpeXXUd0EZFxpfJbywAikVCZbVTBRVy8LCec6AtBNnPcgT+cqJSZa4iUhFB6FqL1Mykulun66i9OkeMR0cW3psi9xNdHdBEdmjTlOhwDw//LrIe53Swa9H1lWf3IAoLTf1yirafi8PMQCpzdHnAI/sjCnKFnHav0FAgoKYj63pCAIwkGa2YqdwFi7WmhUjJZ8/nA2o8vKnhqPb/0XH1y/ycBUWkLr6jx9ccF4Drf87FToJIV2+xe/7xY28g4QeSjvyAoZ/oOULiY6Cq6tCDxjc6dyO8JqXd8OV7cY0TLr9Az67sqJctt6/Axj6+Fuxim/O97QrLWEGLHX9vSlLe35Zxl+ucZD/Ccj9+6anBpHYsSKcTJ60wvCfUfuSekLdRlSsFJV56SayPBwuZOHOXcs+g0yabGGPrNFeWYJPabumgXfUcqCetUoZNYozFGeAS3483mrIV7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(4143699003)(11063799006)(3023799007)(10067099003)(56012099006)(18002099003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVJR2pIK081ZTloWnVtZmNtUTVROVRhY3YzN3hGQ0xXZkdCb2xWeDlRMlZO?=
 =?utf-8?B?ekVnUEtRVnFvaGpHWCtrUll6c3BLTTFUNCtVdTl4NCtsN1Q3MHZxeEc0LzQw?=
 =?utf-8?B?YjVOUU9IYURaVUVwV21EN3BiSnNSdHB5U3MwdEhLTTFtR1BTdkVQUm1uMGll?=
 =?utf-8?B?YytpWnlDY1l1K1E4aFRDZy85SldwR3JuYmNoazdwcHNjMDRMT1g5QjhMamNI?=
 =?utf-8?B?T2dGbFJZZVV5Vi9BWnBlbFhaZFhlS3k2UXJBTG1qQi9PTk5PWFNJOW9rT3ZP?=
 =?utf-8?B?RlMrdGlVVDJ3bjZhNTBpT05VS0ovc1hoTHhKOFpFd0tjYTVsRHhZSVFCVVo0?=
 =?utf-8?B?T2dsSk9TdStWK2JkaVREOG00MkNRZkhYTTlLQjFIQkxRbE1MbUQ4eUtnRDZh?=
 =?utf-8?B?ZWtlRm9RdllrMDc3ZDRWTElrRjVUOWg1dWFzQXU1bXNFQUc3MmxPQnJnZDJh?=
 =?utf-8?B?T2ZOUFU5bEZtMGJ0MzVyVmdrQXR3S2hjZ3EwRktSVEpoT2prZmRxaTVFNjFZ?=
 =?utf-8?B?emtWV1JRbmR1ZVpvekhYQmp4aGNUNE5xakhuNkVaN1BJNC8yOHFWVmRBSmU3?=
 =?utf-8?B?eWthSjUwZUM0aUNyMFoyY01PdzJzY2JqMU9DMDlldUNsczVwZS9XR0I3WWZj?=
 =?utf-8?B?dGNJQ2Zua01OK1YralhjaDd1UCtLRXM2LzJ4QTRKOFZpQkg3YjM4cWJ3WDUz?=
 =?utf-8?B?YTAwTEdYM3FOeU82TEdKUkZNWDZDeDR0MHZ3UDNrZjltdi84ZWx3YnlxY0M3?=
 =?utf-8?B?T2V0WGJXeS9QNlVlazhLT2RQWldMbWFlMmE1VW42NUdtUVhmYjUzd3I5UnQx?=
 =?utf-8?B?ZlUwdWRTTThxdFNsalFLSVNvdm45RWI0TlNiTTVvdzZqMnNIcW9BRk12K0Jt?=
 =?utf-8?B?bk43R0NMaUxLM2g4cWdEVU9vbDBnMitLS2p5eFVxQk9QZ092RUVjRWFOaVpv?=
 =?utf-8?B?RWhsTFRqbFdIV0tPZGRiVmJyTVVMKzFzS1M1alBIVXhoMXFmVS92RThSSCs1?=
 =?utf-8?B?WGVCTDJFT3htanMrRFFQL0JRa0VFUkFGanZNcy9BcFVOcExiZVRIUjBUZzdo?=
 =?utf-8?B?b1lqS1dmL2o0N0lWNzlKaDBwWEU1TGVKUDJkeHZFZUlBci9XTG94SmkzMW5x?=
 =?utf-8?B?bDJEYjZEQlRFbVAzVXhkYjZLL0x3RG1qMHVBZkF3VEk2TlpaWGxaMXd3d0E0?=
 =?utf-8?B?eExhcWVwcjF2V2R2UU1HMFptSE8rVmo5U3gvcHFBZFVaVUhMUkJPWmdVWDBZ?=
 =?utf-8?B?TGZheUovNS95YVdFcmgybFo4RHVFWVdzdmRvdExUVy9SYUdOY0FaSGRQdmN4?=
 =?utf-8?B?T1FEc3JSdmZMcHRGeG1pQnZmUnpFb2p4UWN5RVNXQVZEOHZNdjlqVzFja2cv?=
 =?utf-8?B?MlI2Z3FhY1NwSmsvVDJOU1BQd082UnBKdWFtTEJHYThZVzROTm83OUdmRkx1?=
 =?utf-8?B?K0YzdmVFYzc3RFFPOEdNVWJ5RzZDODRsWndEZ0tLckF1ZVhwTWxRVnpMRWFt?=
 =?utf-8?B?RVZuNXdReExEYWhSdk51bEpvWno4dWhDNTBjZzFUOHFBNlZhZVpaRTNncTds?=
 =?utf-8?B?M1hhS2ozcUlsSEVwNmo5b0t2UDVpR1B1US9YM3I0TG02ZC9wYjQ1dmZzWkdX?=
 =?utf-8?B?czdNaXhnVXFNVDV3T2ZCRE81TklpbDdlSW1OdnIya21iU1VUK1NKNU1qbE9Z?=
 =?utf-8?B?TDBSRGh4ZVVzOEprZ0lQRjZGQ1RHSGIyT2VGb0hPM2gwWmRzdG5tWExRVlRv?=
 =?utf-8?B?cStsbFpNUjZZSCtHbUIveGZZWCs2bTVxNkZKLzJlZ3ExbFplSEV1NFBya01Z?=
 =?utf-8?B?VE1tQWJtMC9lMy9qUzVtZkF2NUdGMXRYUzhvbTNQZDlSenJUc0xXK1BYYUpR?=
 =?utf-8?B?QWU4MTZLODFjdEE5ZFNZWTRJSVR6N3ZmTTdyaHM0Y1pZSGM5Mit2Y0FCeEV6?=
 =?utf-8?B?dzdLQ29yb3dRZEkyVDVRMXR3MjhvTzhJUHdTQlYxQy9ZUmxvS2J3c0I5L0ZV?=
 =?utf-8?B?TnZpT0FwNGhsb1V1c0NIcjh6d1JPeDVKT3Y2UlluZU54dno0eUlscDF2djZF?=
 =?utf-8?B?L2tHbVJveFNQcktvR0h6ZkU2bmZRUUhIVmFHVExieERiTlZmdkNYYWkxN1Ro?=
 =?utf-8?B?SndyREN2WmtQRi9Temd5clIxQytIbUd0RG5YVU9HTHd6aG4yc3dUS2JpNDNL?=
 =?utf-8?B?d2REekd0TU5RVk9HSFFKcVlUSStnZ2wxdlEvSlNkVnp1WnlUcXdxbVhlZ1ND?=
 =?utf-8?B?bThjaTJxYnpuUnVFbjk4UjBnbS8vVi9icCsrQUQrTThwMzNPalJ4UWpUeWUr?=
 =?utf-8?B?WjhTMDVBdDhXZmc0NDNHUWw0VDJGTUNPbXpOSmdwNjVzdzFlaUxkakluM3h0?=
 =?utf-8?Q?brCBud6H8n0Jo88I=3D?=
X-Exchange-RoutingPolicyChecked: xwUegKmywC2v/Y89ZFD9JtcM9AucI6sdF8nuyeQ4a3vbOb7/8M2nUQ0x2JC64he3gBNNrBm9Mr1CSZJuJRtTSXK5LdW556l8FQS0NmMZaC+lmD03rod1aDnf8gb8aM3EtQpSCcTkhSDNeRoLV+YRVR/z7l6hOXgpXpaOuKJxv6QDrOaYYyEHuamWN4AlAe8bGqv9cFdCLail7o2BG4ZFqfK4u9lW0ieJ0SjBikA9rfAo1LXMKIcUOmOp/ey1rP35CFS0MAC3IjwCyk166BVlirourED9eZGgjRezeDItvvmxr7+1mP4BkSoG4CYo7LjOGXfDxAgBJc4AC8B23iYPaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f3ad31-2879-45d8-17f9-08df2589e75f
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 22:17:13.3693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+n/somugxTmb6ROd3fS7W+Txttgrjjg3EI9E5DCXZg1Ak9QxJTBRgFdyEgyPhcnjurKAJh6Cu05RkVGbULUI4oAX4+athin3uK1tr89z18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
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



On 9/22/2026 4:18 PM, Umesh Nerlige Ramappa wrote:
> Instead of always returning -EPROTO for most errors, use different error
> codes based on the error type. -EPROTO is retained for the cases that
> are genuine protocol violations by the GuC.  The remaining cases now
> report what actually went wrong.
>
> A CTB that has been flagged broken reports -ECONNABORTED rather than
> -EPERM. These errors are not contained within the driver: they reach
> userspace verbatim through the gt freq sysfs knobs (min_freq_store() ->
> xe_guc_pc_set_min_freq() -> xe_guc_ct_send()) and through the VFIO
> SR-IOV migration callbacks (xe_sriov_vfio_suspend_device() ->
> xe_sriov_pf_control_pause_vf() -> xe_guc_ct_send_block()). -EPERM reads
> as a privilege failure, so a user who hits a broken CT is told
> "Operation not permitted" and retries as root to no effect. Worse,
> xe_sriov_vfio.c already returns -EPERM for its own "not a PF" check,
> so the two are indistinguishable to migration tooling.
> -ECONNABORTED ("Software caused connection abort") says what actually
> happened: the driver aborted the channel after detecting corruption.
>
> Note that -ECONNABORTED must stay distinct from -EPIPE. -EPIPE means
> corruption was detected now and transitions the CTB to broken, which
> g2h_err_is_fatal() classifies as fatal; -ECONNABORTED means the CTB was
> already broken and is benign. Merging them would make receive_g2h()
> re-declare the CT dead and re-kick a reset on every dequeue iteration.
>
> receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
> two error codes that dequeue_one_g2h() could return on a fatal error.
> Invert the check to simplify reset handling.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
> v2: (Michal)
> - Sync order of errors in g2h_read and __guc_ct_send_locked
> - For CT errors use EPIPE and for HXG errors use EPROTO
> - Convert the non-fatal EPIPE to EPERM in the helper
>
> v3: (Michal)
> - s/EPIPE/EPERM/ in __guc_ct_send_locked
> - Add ct_corrupted helper
> - Add error documentation
> - Remove "reset required" string from logs
>
> v4: (Sashiko)
> - s/EPIPE/EPERM/ in retry_failure and xe_guc_ct_send doc
>
> v5: (claude-opus-5)
> - Revert reodering of error checks in send path (claude-opus-5)
>    When broken is set to true (CT_DEAD) and reset is in progress
>    (kick_reset), we have a broken + STOPPED state. A no_fail send will
>    bail out with the reordering instead of retrying in 5s. Hence retain
>    earlier behavior.
> - Update error DOC
>
> v6:
> - s/EPERM/ECONNABORTED/ for the broken CTB state, since EPERM reaches
>    userspace via sysfs and VFIO and reads as a privilege error
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 217 +++++++++++++++++++++++++--------
>   1 file changed, 169 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9d9bb3028d52..8ba39e4241da 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -37,6 +37,98 @@
>   #include "xe_sriov_vf.h"
>   #include "xe_trace_guc.h"
>   
> +/**
> + * DOC: GuC CT Error Codes
> + *
> + * Every failure below that takes the CT down - i.e. one that runs CT_DEAD() -
> + * is reported with xe_log_err(), so it is tagged with the GUC component and
> + * carries the error code in a structured SIGID entry. Failures that are simply
> + * returned to a caller are left for that caller to report, if it needs to.

This paragraph about xe_log_err is not true until patch 7, so I'd move 
it there.

> + *
> + * Send path - xe_guc_ct_send(), xe_guc_ct_send_locked(), h2g_write()
> + * ------------------------------------------------------------------
> + *
> + * Channel-state rejections - the message was never queued, nothing is corrupt:
> + *
> + * ``-ENOTRECOVERABLE``: the device is wedged. No CT traffic can make progress
> + *   until the device is recovered.
> + * ``-ECONNABORTED``: the H2G CTB was flagged broken by an earlier corruption
> + *   check, so the driver aborted the channel. It stays unusable until the CT is
> + *   restarted, which clears the flag.
> + * ``-ENODEV``: the CT channel is disabled. Don't retry until it is enabled.
> + * ``-ECANCELED``: the CT channel is stopped or a GT recovery is pending, so the
> + *   message was dropped. Often benign; retry after the reset/recovery completes.
> + *
> + * Internal flow control - never seen by callers, handled by the send helpers:
> + *
> + * ``-EBUSY``: not enough H2G room or G2H credits. Triggers a flush, a wait and
> + *   a retry.
> + * ``-EAGAIN``: the message would wrap the H2G ring, so the tail was NOP-filled
> + *   and reset to 0. The write is reissued immediately.
> + *
> + * Hard failures:
> + *
> + * ``-EPIPE``: H2G descriptor corruption found before writing - non-zero status,
> + *   or head/tail out of range. Marks the CTB broken.
> + * ``-EDEADLK``: H2G credits never recovered after waiting ~1s. An async GT reset
> + *   is requested before this is returned.
> + * ``-EPROTO``: the MMIO CT enable/disable handshake got an unexpected reply.
> + * ``-ENOMEM``: internal allocation failure (fence lookup under GFP_ATOMIC, or the
> + *   G2H workqueue at init). The blocking path retries the allocation with
> + *   GFP_KERNEL.
> + *
> + * Blocking send only (xe_guc_ct_send_recv()) - the H2G went out, the reply is the
> + * problem:
> + *
> + * ``-ETIME``: no G2H response within 1s, even after flushing the G2H worker.
> + * ``-EIO``: the GuC replied RESPONSE_FAILURE; error and hint codes are logged.
> + * ``-ELOOP``: the GuC kept replying NO_RESPONSE_RETRY until the request hit
> + *   GUC_SEND_RETRY_LIMIT. (NO_RESPONSE_BUSY is not an error - the waiter re-arms.)
> + * ``-ECANCELED``: the pending fence was canceled while waiting, because the CT
> + *   was stopped underneath the waiter. Retry after the reset completes.
> + * ``-ENOTRECOVERABLE``: same as above, but the device got wedged in the
> + *   meantime, so there is nothing to retry.
> + *
> + * Receive path - g2h_read(), parse_g2h_msg(), dequeue_one_g2h()
> + * -------------------------------------------------------------
> + *
> + * Channel-state rejections - the same four codes as the send path, checked against
> + * the G2H CTB. g2h_err_is_fatal() treats exactly these as benign; anything else
> + * declares the CT dead and kicks a reset:
> + *
> + * ``-ENOTRECOVERABLE``: device wedged.
> + * ``-ENODEV``: CT disabled.
> + * ``-ECANCELED``: CT stopped.
> + * ``-ECONNABORTED``: G2H CTB already flagged broken.
> + *
> + * Hard failures:
> + *
> + * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail out of
> + *   range, or a declared message length larger than the data actually available.
> + * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is not the
> + *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences aren't
> + *   tracked, so there is no caller to report to and the failure is escalated to a
> + *   reset instead.
> + * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
> + *
> + * Reported but not returned
> + * -------------------------
> + *
> + * These never reach a caller: they are detected in a void path or in a G2H
> + * handler whose return value is swallowed. They are reported and the CT is
> + * declared dead, which is the only escalation available:
> + *
> + * ``-EHOSTDOWN``: the GuC sent a crash dump or an exception notification, i.e.
> + *   the firmware itself died. A reset is kicked to reload it.
> + * ``-ETOOMANYREFS``: G2H credit accounting went wrong - a release would push
> + *   the free space past the usable size of the CTB, or there was no outstanding
> + *   G2H to release. Indicates a driver-side bookkeeping bug, not a GuC one.
> + * Any error from a G2H action handler: the handler for a given G2H failed while
> + *   processing it. The code is whatever the handler returned and is reported
> + *   along with the action and the raw message, from both the worker
> + *   (process_g2h_msg()) and the IRQ fast path (g2h_fast_path()).
> + */
> +
>   static void receive_g2h(struct xe_guc_ct *ct);
>   static void g2h_worker_func(struct work_struct *w);
>   static void safe_mode_worker_func(struct work_struct *w);
> @@ -929,6 +1021,23 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>   		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
>   }
>   
> +static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
> +			u32 reason_code, const char *msg, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +	int err = -EPIPE;

nit: the err variable is only used for "return err" and AFAICS this 
doesn't change in future patches, so you could just do "return -EPIPE".

> +
> +	va_start(va_args, msg);
> +	vaf.fmt = msg;
> +	vaf.va  = &va_args;
> +	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
> +	va_end(va_args);
> +
> +	ct_dead_capture(ct, ctb, reason_code);
> +	return err;
> +}
> +
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -953,23 +1062,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		u32 desc_status;
>   
>   		desc_status = desc_read(xe, h2g, status);
> -		if (desc_status) {
> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> -			goto corrupted;
> -		}
> +		if (desc_status)
> +			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),

&ct->ctbs.h2g is already avilable in the local h2g variable, so you 
could use that

> +					    "write: non-zero status: %u\n", desc_status);
>   
>   		if (tail > h2g->info.size) {
>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> -				  tail, h2g->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
> +					    "write: tail out of range: %u vs %u\n",
> +					    tail, h2g->info.size);
>   		}
>   
>   		if (desc_head >= h2g->info.size) {
>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
> -				  desc_head, h2g->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
> +					    "write: invalid head offset %u >= %u)\n",
> +					    desc_head, h2g->info.size);
>   		}
>   	}
>   
> @@ -1034,10 +1142,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   				     desc_read(xe, h2g, head), h2g->info.tail);
>   
>   	return 0;
> -
> -corrupted:
> -	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
> -	return -EPIPE;
>   }
>   
>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> @@ -1061,7 +1165,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	}
>   
>   	if (unlikely(ct->ctbs.h2g.info.broken)) {
> -		ret = -EPIPE;
> +		ret = -ECONNABORTED;
>   		goto out;
>   	}
>   
> @@ -1213,7 +1317,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return ret;
>   
>   broken:
> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
> +	xe_gt_err(gt, "No forward progress on H2G\n");
>   	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>   
>   	return -EDEADLK;
> @@ -1246,8 +1350,9 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>    *
>    * * -ENOTRECOVERABLE: the xe device is wedged. Stop submitting new GuC work; the
>    *   request cannot make progress until the device is recovered.
> - * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
> - *   CT is restarted, which clears the broken flag.

Isn't -EPIPE still a valid code here? coming all the way back from 
h2g_write.

> + * * -ECONNABORTED: the H2G CTB is marked broken, so the driver aborted the
> + *   channel. It stays unusable until the CT is restarted, which clears the
> + *   broken flag.
>    * * -ENODEV: the CT channel is disabled, messages not expected in this state.
>    *   Don't retry until it is enabled again.
>    * * -ECANCELED: the CT channel is stopped or a GT recovery is pending; the
> @@ -1358,7 +1463,8 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>    */
>   static bool retry_failure(struct xe_guc_ct *ct, int ret)
>   {
> -	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
> +	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ECONNABORTED ||
> +	      ret == -ENODEV))
>   		return false;
>   
>   #define ct_alive(ct)	\
> @@ -1663,8 +1769,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   
>   	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>   	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
> -			  origin);
> +		xe_gt_err(gt, "Invalid G2H origin=%u\n", origin);
>   		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>   
>   		return -EPROTO;
> @@ -1682,8 +1787,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		ret = parse_g2h_response(ct, msg, len);
>   		break;
>   	default:
> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
> -			  type);
> +		xe_gt_err(gt, "Unexpected G2H message type=%u\n", type);
>   		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>   
>   		ret = -EOPNOTSUPP;
> @@ -1804,6 +1908,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>   	lockdep_assert_held(&ct->fast_lock);
>   
> +	/* Keep in sync with g2h_err_is_fatal() */
>   	if (xe_device_wedged(xe))
>   		return -ENOTRECOVERABLE;
>   
> @@ -1814,7 +1919,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   		return -ECANCELED;
>   
>   	if (g2h->info.broken)
> -		return -EPIPE;
> +		return -ECONNABORTED;
>   
>   	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>   
> @@ -1830,10 +1935,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   			desc_status &= ~GUC_CTB_STATUS_DISABLED;
>   		}
>   
> -		if (desc_status) {
> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
> -			goto corrupted;
> -		}
> +		if (desc_status)
> +			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),

Here as well you already have &ct->ctbs.g2h in a local g2h variable.

> +					    "read: non-zero status: %u\n", desc_status);
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> @@ -1854,24 +1958,24 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   		 *
>   		if (g2h->info.head != desc_head) {
>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
> -				  desc_head, g2h->info.head);
> -			goto corrupted;
> +			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
> +					    "read: head was modified %u != %u\n",
> +					    desc_head, g2h->info.head);
>   		}
>   		 */
>   
>   		if (g2h->info.head > g2h->info.size) {
>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
> -				  g2h->info.head, g2h->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
> +					    "read: head out of range: %u vs %u\n",
> +					    g2h->info.head, g2h->info.size);
>   		}
>   
>   		if (desc_tail >= g2h->info.size) {
>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
> -				  desc_tail, g2h->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
> +					    "read: invalid tail offset %u >= %u)\n",
> +					    desc_tail, g2h->info.size);
>   		}
>   	}
>   
> @@ -1888,11 +1992,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
>   			   sizeof(u32));
>   	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> -	if (len > avail) {
> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			  avail, len);
> -		goto corrupted;
> -	}
> +	if (len > avail)
> +		return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
> +				    "G2H channel broken on read, avail=%d, len=%d\n",
> +				    avail, len);
>   
>   	head = (g2h->info.head + 1) % g2h->info.size;
>   	avail = len - 1;
> @@ -1938,10 +2041,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   			     action, len, g2h->info.head, tail);
>   
>   	return len;
> -
> -corrupted:
> -	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
> -	return -EPROTO;
>   }
>   
>   static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> @@ -2033,6 +2132,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>   	return 1;
>   }
>   
> +/*
> + * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
> + * is simply not available right now, which is expected and handled gracefully,
> + * or the channel state or the message itself is inconsistent, in which case the
> + * only way forward is to declare the CT dead and reset the GuC. Since the
> + * former is a short and well known list, check against that and treat anything
> + * else as fatal, so that new error codes don't silently escape the escalation.
> + */
> +static bool g2h_err_is_fatal(int err)
> +{
> +	switch (err) {
> +	case -ENOTRECOVERABLE:	/* device wedged */
> +	case -ENODEV:		/* CT disabled */
> +	case -ECANCELED:	/* CT stopped */
> +	case -ECONNABORTED:	/* CT already declared broken */
> +		return false;
> +	default:
> +		return true;
> +	}
> +}

Unless I'm missing something, if we call ct_corrupted from g2h_read that 
would call ct_dead_capture immediately but also escalate an -EPIPE 
error, which would be considered fatal here leading to a second call to 
ct_dead_capture(). However, we do want to have kick_reset() called here 
in that case, so from that POV -EPIPE is indeed a fatal error. Maybe we 
just keep the double call to ct_dead_capture for -EPIPE, since it 
shouldn't have any adverse consequences? This also seems to be an 
existing behavior, because the current g2h_read code returns -EPROTO 
which is similarly considered fatal.

On a side note, process_g2h_msg() always returns 0 even when there is an 
error and CT_DEAD is called, so kick_reset is never called in that 
scenario. This seems to be on purpose because the crash handlers 
explicitly call kick_reset and return zero, but I am not sure that all 
handlers are correctly coded for that. Something to double-check after 
this series has landed.

Daniele

> +
>   static void receive_g2h(struct xe_guc_ct *ct)
>   {
>   	bool ongoing;
> @@ -2070,8 +2190,9 @@ static void receive_g2h(struct xe_guc_ct *ct)
>   		ret = dequeue_one_g2h(ct);
>   		mutex_unlock(&ct->lock);
>   
> -		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
> +				  ERR_PTR(ret));
>   			CT_DEAD(ct, NULL, G2H_RECV);
>   			kick_reset(ct);
>   		}

