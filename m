Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977E7CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528A110E597;
	Mon, 12 Oct 2026 13:17:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A36F10EC49
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791811020; x=1823347020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RYHaKWgjBfbok2Epsh/qggTpo/yB1srciLBBl2cTctA=;
 b=Ska6iRJXXiKotqiWH1KaKjCcnffsELeocumXcK+AhSs/L/5DDuSbSiuQ
 Ps44eHfiHgfMatb8yexoWVYwITmz5ANJujTr9MbgimvKL4zJDW6kPDUZh
 hXizp4Dsc8TJV91TUtEMnxi1cfsk86MDbEQq/5KcF2oUVg67ugtrviI9T
 23Y9HOboSTwQHpI5drefWyFdeRXRzHYm5OHaL+JKkiGA/7Xj7rBkyQu+0
 BeJh5rVHfR8VN/3gXKVlwEutYNYjIDivvmhsqvy/nNM513HMpsmU7P9pT
 2Z2os6RhkjmFuAtO8jxHkcv0XjiOv5hUEFLYVGhklAMHQg70uE1LuWl/x w==;
X-CSE-ConnectionGUID: 7dy+FNPoSke5Ml4dbXukow==
X-CSE-MsgGUID: OivUAgcQSDWFeSNxItWSkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="615626"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="615626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:17:00 -0700
X-CSE-ConnectionGUID: sk4XcGXjTp6YW2+ulgKG7Q==
X-CSE-MsgGUID: n7r3+0H6SzGDNRgTFhXtgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="837296"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:16:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:16:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 06:16:59 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/krwNASzznTuBEG+uxWYvufmSeRV5mjF6mpyLu+WcSQfyYtg43TuSAP1a+feJ0AxXvhgnNW1pAJfe62QuWhS1RMt8j3AfuqBgux0ry+NSfz07bxCt2vrXTDIgmkZeR3lhpNIRahKh1jx1Oxfs/GbSaS6XuiBiz5B4xKenT5XuTub7RaijFfk0eh8BrivFkiUJn14eZ/VRULN+WjUn0ZQdsAwc9XhP+YamMCrHD8NxTFDih6dNulD/Qsf/Yr6IUaTh0c6yVHi0mf5C9Zvaa6IDiKARUW+nxdWC4GScUrYr1sPadoTzpS0RTCZtt153jMdyx3EnmLUYd/otLnOdW0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5nswa4l3mQlUNXP4mYbSYW28EUWcQrnESF+nOwp7nA=;
 b=mn2WEZo+lBuwgpoNGoDSiDpMTciTiR7k1nQO8/K1/cnCHwVWew9g8b3r+WKveqnnrVA15Suxmx9UDdu7Qv3SMp/hPybe6jKcCDzOiXIXDxvHyPqVLn2fDgI/pwxDtGjrB7I82/uweqJf4LMZcdy0ioKQ/UUNn6P5zmKRM+ON5diJECTY4heExlVuLus5jybaDMKrVTCTFC3IJq8WPF9zgTVccqh5CdZMErTKf3TdqqxAzwABkqfm8n9fi58fS4giT3xEvLlBaZktyA8zjSRUjUsCXcvyceW5hzIWcpcIyedM/1Ga82b2YYPI4Mbw1ZOi2MeR+mIaz9G3OG0jKt8Qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Mon, 12 Oct
 2026 13:16:55 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 13:16:55 +0000
Date: Mon, 12 Oct 2026 18:46:47 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <aszdvyOY5zkyFTU1@bvivekan-mobl1>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
X-ClientProxiedBy: MA5PR01CA0273.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: b7accb98-3979-4a38-22f9-08df28631634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|261009223327099003|261009221727099003|261009221227099003|56012099006|10067099003|4143699003|261009220027099003|11063799006|261009223027099003;
X-Microsoft-Antispam-Message-Info: 6JV1vy9ibo++Rd8WiqSSCJwRYSaWms4YumJrGj5Tr4Wzoi3dGKcFEqyDqkzV8JwE0Z65Rh+1V2Rkk2Wyev+dpdJo39sgdWQpoTB/be7qqkAcoUeds5ISmgNqxnCSjsLE8JKXMW8DttGUO1CGwXCDQ19+bcEge13oHzi384MPPNQ1LfdjgkgODJQU/PasLN9J7ZUJvNoTZxmtI5pEuVXFkxKRYS6+iqxlSZaIH/xUJjDaWX7esZsF6dE4Dq8y1Vq11h75oV/oTJ4EKjblU6SBuQi1w1JzwgQ9nILrBDSNTHT6arAM6SalJRSRGIhQHIKIWtcmyfatrXGI/yRf3HXpyiT38pl++u1h9Sl53xS7CygFsrq4KuFrqTXq69QfsQEf8rJtHDLpcNtZIQa1PZLRV1xBKp6Lrp77TBwugSDx+jiHdGLT3xZajDT3mN0LdvnySNAka1F2VGmDLrL32UgKvXCYhNKJzZHIJFntx2upvQ7V8zim4qEaAoWMCRdMC9Nc1ATct9SZUm/D2OJfEkpiMyQU4E0ERi00BOOVzoHp5xY13Tt8hSF1dqpcUNQh7aQ9f6gwMBCZd6IVNdEXIIsjN4+F/fWK+DjEgRc1T5kmyseQtc+usj8AI1bSp6ZxH+ZewvAmSMIN3ptz1A1tWAU/NvcU3wGeJjeluk6b9aq36N4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261009223327099003)(261009221727099003)(261009221227099003)(56012099006)(10067099003)(4143699003)(261009220027099003)(11063799006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDQ2Rkg3Q05naFlqMjljMXVsb0IxdzBSTllJQUpzY2tqQ2Vmajg5Y0VGekdQ?=
 =?utf-8?B?bDEwV2k0TitETHBLQ2xudkxzSE15NVh3bHovOGtWdlpzRlpObk1ZdnUvejJ4?=
 =?utf-8?B?MmF3UEJVaEdBdWRETHFORHFEbUU5aXQ0bDFxa3RjN2xXNm5IWnU4aE9WQXEz?=
 =?utf-8?B?ZlVLNEhtTGE0SmtkcXJBN2wzZkhNUTFLSWpLQWF5NDk0Ri9KV0VPMVNCdW9q?=
 =?utf-8?B?NGlTM0pndS9XNmo4eVlSTFRLekxqU0pCK1ZCTE1Ha3Z4L1ROaGRjTGk4RllM?=
 =?utf-8?B?MmJWOGJ0LzQvUU5sckwrYmN0cVRCdTZQb21XUVBTVFZPR3A3UnJVaUJJOG5L?=
 =?utf-8?B?WUtDdWoyMTc5SytyNC93Q0JGVFlLdFJFOXlrZkx3UEIzbi9uaG40S2FzNk1I?=
 =?utf-8?B?bUZzRG0vamUvSS8rYjVGWCs1QnBvc0wyQm9BbnlzSFkwK25iZm9XaEhwNXdq?=
 =?utf-8?B?WjB5Rm0weEZFclZweVZrZDcreW5GUDF2alEwNk1EM3hOM3kvaGNTQ0dPejUz?=
 =?utf-8?B?NmdyN2pZQ0tXTys2bi9GemRPK1RKKzhVeWd3d0dsTVZHV01WSmpXSkxLa0tP?=
 =?utf-8?B?QlZvUlFJR3FKeEVHUHkyUDViMlJnZEJad0ZRK0x4RVBHdldXdlBkSW9BdnM0?=
 =?utf-8?B?TEwwbXZQMHJEU3ZXRjd6bzNkUzVWUkVocDAwQThOR1BOUSt1NFhKL21rRnpD?=
 =?utf-8?B?N1JBeG41SUFvOFRkcjBiYlIrTDhhQWFnUmg2MDEzZ0FLMGliMHlrVWtvY3R5?=
 =?utf-8?B?T0FiUTZGMXNuK2I3Myt3TlVIU09zY2pFUHNzWUdmbnhiSXU4ZUljalQyTEFV?=
 =?utf-8?B?MjdZQVRqbW9IYmUvVHNMOVFNdndkUWQvSURydW9zN05YL1FCY0ptUitTaFU1?=
 =?utf-8?B?dVBwTldnSVB5Q09nYWQvR3Jia1d5VEdPRkpQcUk0bTlRWDJJWFViOEl2SUZG?=
 =?utf-8?B?Qmk5U29sbDZWVlVDRWZ5OXZiNkl2M3dSVXkzcUNaYlV4MVRwdVMzTUUyemFa?=
 =?utf-8?B?cENOVFlQK1QvVyt5b0JpNnR5eHZoK0YyVkVXVjdMRlBibnl5ZHZOSXBIUjBt?=
 =?utf-8?B?RTFPellIalBLamFydXUvK0dOcC9jYVZlcFZYTWRFdkFrd2JCbjNrcmowaFZV?=
 =?utf-8?B?bDlBeDdCcUtTTWtJdjVsQ1BQSUhLbzlyZFV5dzYrZnBqVWtNQjJmWk9CYTEy?=
 =?utf-8?B?ZFFTRTFmK0lEQm9SSVBEZVRtZ1dJNjJzUThoZTBKZ0VFSjl1bFpoaXpBK1Yz?=
 =?utf-8?B?QVZGYXNZU3lLL3VYbi92QlpBakRiWTNoc1IwQlR4UGdwQmx1Z2ZEaDhIVDly?=
 =?utf-8?B?Z1lqM3M0R2hRSDVOQy9TTnFEZWRwcXovb3dKY0ZOZXlQYWl4cXd5bjV1bXlS?=
 =?utf-8?B?YXliT0Y0ZmlTM3JXZzFKV2M0WURwdStFeFYyRm9BbVhKQjFlU0IxSzhQUUdz?=
 =?utf-8?B?V1BWdThjZVpjL1NCRlg0d2dGcEtTOThUOTBkdEdCSDJFaVNkQXh1WlJRWW81?=
 =?utf-8?B?cHMrdmJ0TTdNL2FOQVJpMitTSVRZTzllZDU0cEhDZlNzMGllaFFPSEtlZnow?=
 =?utf-8?B?OVlGME0zQi96NDJ4cTZoTTZLOVpoNzBzOGdxbURNL1IwUjhFZzJoVUY4RHo0?=
 =?utf-8?B?ZHR6ZjJkUlM5RWdSUVVwRHVZaHVtOXRlZE9QcUFPU3oxR0cvN2VxQm9HdHpY?=
 =?utf-8?B?WlhxOXVqMVhaanpJL0lTaEFoZDNKR01LSjVocERUYndFUDhvYTB6RFdobmxz?=
 =?utf-8?B?L0pIa0EzOEh6ekUxWWlLNkdGejI1OG1XMi9TdzFSOTB1SDMvWFU0Z2NzRVhV?=
 =?utf-8?B?NEFpR2p4Z09ha2Y0UUpLajJYN0EwS0NyY29IUFNjQ3dFcUtHZEczcHhLUzdL?=
 =?utf-8?B?aUtmQ0tsTjVrQllMdWxiVjNnMHRKcGZFV2t1byt3cDlOUTIwaDJqZnU2TW9X?=
 =?utf-8?B?VTRlbEo4NWIvckpNWW5DanE5bTBrOXFUdE50KyszMGlRMlNqNTFpMTVtUU5o?=
 =?utf-8?B?TXFNSEY2eWVPNkI2c0dTTXRBWmt4aXFpamJXS05wSzBzTFA0L0U5RFQ4L1JT?=
 =?utf-8?B?N1JLNUpNNE90dEprT0FpTVRVdWtFdEJHZ1RjQ3Z5Lzljb09ON0FaY1VqWE1w?=
 =?utf-8?B?dXBXMldsM24xRHpzeWxNeENNa1FnZGh6dlU3elkwT3hoaVVwTjJaeDVnZVNl?=
 =?utf-8?B?S3VDV3hQNlpmM2NjV214M2htWmJpVkJaVEVnOUN3WHk1YlJPMm5ZRzEzVHlN?=
 =?utf-8?B?cFRJVWF6amswbVJ1aFNCbVk0SDZWQWVSSTMrV0k3Sld5Mks1NEhwL1F2c0Vt?=
 =?utf-8?B?R3R5aFZka05hRjVJTzFUaWY0TjBNR0hERVlxV2RNby9KZmY1cm85eHJHaDc1?=
 =?utf-8?Q?z4uTlQ01WVoB3+JCpQP4CKFWA+k1dd4FR7FTa?=
X-Exchange-RoutingPolicyChecked: eO+4w/F8JOCRLhWabRyfeaXDZpX66d6BrzxXKzmNEN/3A+Xxk96oaGij8BQAggSn9OPzV84aFfRS91aIfQcXDf4B789efsm4QO04CWn2Kezru2/4FsS88D7mZ/x6nNGWuJ1HEKD5FHYyJF1/QPRIVMFB1tlXK4NWNy8I+d1UB9lZHNN+oTDE4LkuMe2d4D3lxeQm7L5qyTtYVGL/eogUNxS/n3ENFkufMCNh3FEQr3gAXCXOYwhPHnZlbDxytQ3dyoPykOk9cdrhDKZOdNnBvge6uo3mTQRzMlpm/RGQ5YMKACtGSasRvs6xRgcO/ONEqQQFQ9necbgxxK34pf7dAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7accb98-3979-4a38-22f9-08df28631634
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:16:55.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATNCO1ggjeOS+6RZcYIYZK04ksnQhs69/Mtsilefk1jwdpKCE8b8yBXUhqIdTL438UBQ7VT0WycwUIuSQbekPTPNQMrGzBHIlRnHKP42wtzV8/TUOL5ATJwfQvG1Uhgz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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

On 12.10.2026 17:16, Kumar G, Naresh wrote:
> Hi Bala,
> 
> I was investigating this issue earlier in sometime and found the root cause
> in software _node_notify_remove().
> 
> It is a kind of ownership bug in driver/base/swnode.c
> sofware_node_notify_remove(). when a manged swnode is mirrored onto a
> 
> second device(which is exactly what i2c-core does for the adapter's own
> struct device), the old code does an extra
> set_secondary_fwnode()/swnode_put()
> 
> for every device that tears down, not just the true owner. this is a
> double-release/UAF risk. The following fix solves the issue without changing
> i2c adapter registration flow.
> 
> The following code patch is suggested/provided to @heikki: waiting for his
> inputs on the same.
> 
> Fixes: 151f6ff78cdf ("software node: Provide replacement for device_add_properties()")
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> Signed-off-by: Nareshkumar Gollakoti<naresh.kumar.g@intel.com>
> ---
>  drivers/base/swnode.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 84a77ffa3dc4..2efcf12b4c21 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1190,6 +1190,7 @@ void software_node_notify(struct device *dev)
>  void software_node_notify_remove(struct device *dev)
>  {
>  	struct swnode *swnode;
> +	bool owns_managed_fwnode;
>  	swnode = dev_to_swnode(dev);
>  	if (!swnode)
> @@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
>  	sysfs_remove_link(&swnode->kobj, dev_name(dev));
>  	sysfs_remove_link(&dev->kobj, "software_node");
> +	/*
> +	 * A managed node can end up mirrored onto more than one device (e.g.
> +	 * a bus core copying the fwnode onto a child device, as i2c-core does
> +	 * for an adapter's own struct device). Only the device that actually
> +	 * owns the fwnode releases the creation reference and detaches it;
> +	 * every other device only releases the reference software_node_notify()
> +	 * took for it.
> +	 */
> +	owns_managed_fwnode = swnode->managed && swnode->fwnode.dev == dev;
> +
>  	/*
>  	 * Drop the device pointer mirrored onto a secondary software node in
>  	 * software_node_notify(). For a primary software node the core owns
> @@ -1206,12 +1217,13 @@ void software_node_notify_remove(struct device *dev)
>  	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
>  		swnode->fwnode.dev = NULL;
> +	if (owns_managed_fwnode)
> +		set_secondary_fwnode(dev, NULL);
> +
>  	swnode_put(swnode);
> -	if (swnode->managed) {
> -		set_secondary_fwnode(dev, NULL);
> +	if (owns_managed_fwnode)
>  		swnode_put(swnode);
> -	}
>  }
> 
> 
> Given that,
> 
> Is this rework still needed once the core fix landed?

We don't need this patch if the limitation in sharing the managed
software nodes is fixed.

Regards,
Bala

> 
> 
> Thanks,
> 
> Naresh
> 
> On 10/9/2026 10:12 PM, Balasubramani Vivekanandan wrote:
> > The kernel crashes when unloading the xe driver on CRI:
> > 
> >   Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
> >   RIP: 0010:platform_device_release+0x80/0x90
> >   Call Trace:
> >    device_release+0x44/0xa0
> >    kobject_put+0x9b/0x250
> >    put_device+0x13/0x30
> >    platform_device_unregister+0x29/0x40
> >    xe_i2c_remove+0x80/0xa0 [xe]
> >    devm_action_release+0x16/0x30
> >    release_nodes+0x3d/0x140
> >    devres_release_all+0x96/0xd0
> > 
> > This started after commit 0f485f88656af ("drm/xe/i2c: use
> > device_create_managed_software_node()"), which attaches a managed
> > software node to a platform device created with platform_device_alloc().
> > 
> > Comment above the device_create_managed_software_node function cautions
> > that the software node created by it should not be shared or reused as
> > the lifetime of the node is linked to the device.
> > 
> > But the DesignWare i2c driver which creates an adapter device as a child
> > of the platform device reuses the software node as its fwnode.
> > (device_set_node() in i2c_dw_probe()).
> > 
> > During module unbind, when the adapter device is deleted, it drops the
> > reference count for the software node and frees the software node.
> > Later when the platform device is removed, it tries to dereference the
> > software node pointer and results in use-after-free.
> > 
> > Instead of managed software node use a static struct software_node
> > passed through platform_device_info.swnode to
> > platform_device_register_full().
> > But we have a blocker which doesn't allow to use
> > platform_device_register_full() simply.
> > 
> > Currently the driver is using the two step alloc/add sequence while
> > creating the platform device so that i2c->pdev is set before
> > platform_device_add(), because xe_i2c_notifier() needs i2c->dev and it
> > can run before platform_device_register_full() returns.
> > 
> > We can fix it by removing the dependency on i2c->dev in
> > xe_i2c_notifier(). It is using it to match against the right adapter.
> > Instead of using the device, use its parent to match.
> > 
> > Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
> > Cc: Bartosz Golaszewski<bartosz.golaszewski@oss.qualcomm.com>
> > Cc: Danilo Krummrich<dakr@kernel.org>
> > Cc: Heikki Krogerus<heikki.krogerus@linux.intel.com>
> > Signed-off-by: Balasubramani Vivekanandan<balasubramani.vivekanandan@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
> >   1 file changed, 15 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index b82caaff80d7b..c54a2375f07ef 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
> >   	{ }
> >   };
> > +static const struct software_node xe_i2c_adapter_node = {
> > +	.properties = xe_i2c_adapter_properties,
> > +};
> > +
> >   static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> >   {
> >   	u32 *val = ep;
> > @@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
> >   	struct device *dev = data;
> >   	if (action == BUS_NOTIFY_ADD_DEVICE &&
> > -	    adapter && dev->parent == &i2c->pdev->dev) {
> > +	    adapter && dev->parent && dev->parent->parent == i2c->drm_dev) {
> >   		i2c->adapter = adapter;
> >   		schedule_work(&i2c->work);
> >   		return NOTIFY_OK;
> > @@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
> >   static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> >   {
> >   	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> > +	struct platform_device_info info = {
> > +		.parent = i2c->drm_dev,
> > +		.name = adapter_name,
> > +		.swnode = &xe_i2c_adapter_node,
> > +	};
> >   	struct platform_device *pdev;
> > -	int ret;
> > -	u32 id;
> > -
> > -	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> > -
> > -	/*
> > -	 * Not using platform_device_register_full() here because we don't have
> > -	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > -	 * uses that handle, but it may be called before
> > -	 * platform_device_register_full() is done.
> > -	 */
> > -	pdev = platform_device_alloc(adapter_name, id);
> > -	if (!pdev)
> > -		return -ENOMEM;
> > -	ret = device_create_managed_software_node(&pdev->dev,
> > -						  xe_i2c_adapter_properties,
> > -						  NULL);
> > -	if (ret)
> > -		goto err_pdev_put;
> > +	info.id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> > -	pdev->dev.parent = i2c->drm_dev;
> > -	i2c->pdev = pdev;
> > +	pdev = platform_device_register_full(&info);
> > +	if (IS_ERR(pdev))
> > +		return PTR_ERR(pdev);
> > -	ret = platform_device_add(pdev);
> > -	if (ret)
> > -		goto err_pdev_put;
> > +	i2c->pdev = pdev;
> >   	return 0;
> > -
> > -err_pdev_put:
> > -	platform_device_put(pdev);
> > -
> > -	return ret;
> >   }
> >   static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
