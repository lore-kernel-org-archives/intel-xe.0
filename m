Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F53C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141110E26C;
	Thu,  3 Sep 2026 23:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtXu39rR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27B110E26C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788478982; x=1820014982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fr1v7Ri3/QGmGublUQ6pDwyPTKCHK2k5oxwbfXHVw+8=;
 b=RtXu39rRwQLKm1JKbMSG6XLLrz7Opm1b81I+IqXxVGlPoGZRlXME8Z/f
 j/HeJJb6TL3SCq4GhNmnkNO/dOdfhUITUN/j7ymOOIUP1jxfC0/Kjr86E
 F96t30cplIZm7r5Xfum4527tbIGkcn3O1NPqy2QnRQzt5oPJ/1dSDQUZj
 CrmEFnIAfE713HCLFeGD9hawpEsZozkCucamPJH2CPnQEGPejI62CqR3t
 DoJ4WToPBkb+FiUaWmN6UfnJoy0v1/6QZPljlg8vIGiFgYxfvO0/voUb5
 h8kjytOyydBQ7mrTrXErSY49pQGy1Q1FdS+0ImSsOJbKRSZY4USIeOu8k w==;
X-CSE-ConnectionGUID: am5xsk/JQSGRvoaoaQhIHw==
X-CSE-MsgGUID: KHX5PeAiTGuO9utDeOS1VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87916801"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87916801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:43:02 -0700
X-CSE-ConnectionGUID: 030vc86CS+2MCLFuBsdWwg==
X-CSE-MsgGUID: lizWNlu1TNGkjHVq85667g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="263682853"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:43:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 16:43:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 16:43:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 16:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXY9KQIEkcAd18pGiJaesbi3LmZdXqbFYwv1rXrGzQm65lqVubYaghNW6HFt5k4BT6Nh0nyOKCqUvjkaQnUVaaZuCLzpoctvRrO5kuTHL5hHHMIOHJu0NXP2uD4jvfnHbdPZPzx+yhaqpy3f+3AREEvA7Hu4TUP1Mamh8aimZ9NjLYnug81AO1uoyWx872hykHAXCHByf3BtJVxx0cQ3UaCyjqvLk16rPF0dcXBKK0TyhEuoUfmraev9XWJlcQ6m9J17f2E0y4oTW1ADMkaV7+feGir2jZaJR2z6N0fHVhaprwekknfXajyhU1neN5OTP3pPViERwzZ7CbhqfOVJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QErGZS108Y/Rm5yoTqMyRKYYwDTxtBIQqxxmcpfs1co=;
 b=DpS3ktIiMRPWpdvPh1IsfOZQqc/gQZxb0tkjhMKc41rtE0O2/+j3BrFwM9ggbaYyf8Cygc+x6pOVqgRg4fQ6XfI1MOuPIyCvQgeF0IPlMgkTfPiJuRiEM/CusnnNbEL4R6wFVMcdDqoHjSYDrqFRkagKFrbfOt9sgvkI5faxGI/7kyJ904qEwxCQ2NczP1gavzDhsndhAcTFkJjkyfu57TtZP8xQbiNQRcgjoa7HF47jH+Ve7v4B+mdOenEKQTdJTokxzNi4g0R7O8mS+kuLxFxNawPXNPf7Rg9nCSOIIFc0HcI2TAU637OAE8097k6Uqlhc9na+4E0UcX6wgScJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CC6PR11MB022132.namprd11.prod.outlook.com (2603:10b6:170:209::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 23:43:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 23:43:00 +0000
Date: Thu, 3 Sep 2026 16:42:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Use different error codes for CT errors
Message-ID: <apoGAdFBGXr0ufmy@soc-5CG1426VCC.clients.intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0132.namprd04.prod.outlook.com
 (2603:10b6:303:84::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CC6PR11MB022132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a70629f-21a4-498b-1f7e-08df0a151684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|3023799007|56012099006|6133799003|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: EFX6WuAb2CjxgLXtKUyusDsoUnNi4M0wsOR+2q88X+9AHVVGWaoqtptPaXtIoE/WN6QeJUvyBbkLS26czBhwmEY4QCSr1sHTotPZmLFKC4IuSc/I8gVSxJI3REoxa4vQ5V30X6gNe9rEGxJlYSiOYHiPfF0cYBEPNSgjHGxD9MiK3PCBLTBhHQ5xMiAHw4rQhFRFgW6VxGSbyRQkHumgmt5rdZw5lYceGhS21up7/DaLCQ+pJk0qjj/lE3cqYvvUejV4Pv9xAdw7cf6sAvE/obMzDiEMPCkJTxTseKLFTgfd9IUc6bEWV8P9ySGYnV1yNeBK00Y5TQBGW4GbQ6mb+tp6SLPe8W4AbNmUAt+D0uZewpS1rsAJDZaL9RIuBjnRjELneOfzeLns0auRRzVkshwqASB1aR7iVoQUcapji40jOqHPkmL8Y6J5Zxphsb+KreJjjGLOuE73LscoPIKH0x0bIycHcwfBZhLjtiS4kwmuk7b4U0p5sCqNgMB+UG8if/HnWQFVNsS9hdOIMxDflkkzjScvwZr3EjOmqWsEyhcqyQlLzs3z33sZYg2Vw1HdUYPA8JIFriTqdhQmgXtzaDR/PTgb4r9scyl20veVaVkXUmKOt+bqliWEMMMkubayEezLj22qLQEoCPPZ3mWl/9ez/XascQQtfrf5AGDPbhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emZiL2psTmZiQjZPK3hlS0lhamFxUUZYQS9rc0FROHhMQXBKNGFaVWxXb1hC?=
 =?utf-8?B?cjdFK1JPcWRNQWk1V0VsYjU0bTlRbnpSMlRZQjl2T3NqTXlUYzIyMVd1Yi9o?=
 =?utf-8?B?Z0ZBcGtCMnAyV2dkcmhDQmdWcG1DUnJXcllhRVpDS2crOWJxYjdnSkkxaCs4?=
 =?utf-8?B?UDJrakJYN2JuUEFxWkhCbTluVjFCZHJrSzFEbE1NZWJPUFo3a3EyVDlqd1dO?=
 =?utf-8?B?S2o3cXVleUZVUEFZM1NjM2ZnMUhoZEI2T0VKSXVNWlgwR0RZclJUZFgxZkxJ?=
 =?utf-8?B?bU5yakpYODZ5bHpRcS85bWZ2MWRBOUZoVkwyNnRQd3JSWVNRaHBlRGtpWkdQ?=
 =?utf-8?B?NXZINWNmN2dXYTg5R0pvdUpNVEkzaWd5NklpanZCMTZYZkY5cTg5UjUySkZW?=
 =?utf-8?B?SWtwN1lpSDZDZXBtRGN5UC8rR3JMekI1Vnh4bmY1UWN0QXprZ0UxR2tmZVdX?=
 =?utf-8?B?eEpBRUZveVE4Z0wyZGxIOGpCb29PaytzSWN2OXUvSzl1Ty95VFA3VWxKcnJh?=
 =?utf-8?B?WXZ6V1l0ZDI0TFRBdnF3RUQ1R3ZTWmRUK2hZTURWYVdHYXUwQ1U3TDBMZ1cw?=
 =?utf-8?B?aStHc0RyQTVWR3RRbXZHblNkOG5nVzlFckxmbmh1Y0Y5WmN6ZnczWmJaNTJN?=
 =?utf-8?B?M2tuZTV2TDNOUUdQaVdueWFENDdMVkE5WGVJbm5ldTNWak0vTUVmNWJBK210?=
 =?utf-8?B?WHFaS2MrM2VaeG5WT25BU3pMcmhONnpjVTE1TXNwbjFDSXFDd3RSTGtwb2xZ?=
 =?utf-8?B?cVJPdmpCbzZ6WElOcmV0Qm10U0g1aWhXd2xPcXJhLzkveE0zL2NjeW8zTVRp?=
 =?utf-8?B?VWR4anI4cWExU1Z4UUxMR3lxb0xRVmw4OURUL0svbSs4c1QwZkpUY04xMGZI?=
 =?utf-8?B?Qk9qRnRwbDBVdjFWbmlZY1FzenlGOEdlZ0dnc05ac0JUYTliOFhsR1RMU0V2?=
 =?utf-8?B?S0FZSjIySWJTdVdER25FK0N6a0hReHZtQ3d4Y05pdjlLOUovSlg2NUp4WFk2?=
 =?utf-8?B?N0dBeERLTnZCOGE1dGhnTG0zTm00ck9iTkNKTUh6VmloMFh2MnhWN2dkbmZ2?=
 =?utf-8?B?V3JBUFdlMmc0WDhNNzFrVFVnY3dwT29VNmh0NWFqSTdmSC9TektVR3Z4aUtD?=
 =?utf-8?B?V1loaE9WWURHVXB4UWc3cmZJSlFjb1oxT2ZvVFFsdldFaU1tRktVaDVUWXVQ?=
 =?utf-8?B?eE4rbnVYV3lXOTIvLzFEWE0yZ3lRQ29veVlZbEJKYUVaZGw5NUloUEM3T204?=
 =?utf-8?B?OGp2NUt0S243dWNHdG1iWG5hZFdtYm9vdFhEQk5zMHl2Y29ZcllPaGFpNXh5?=
 =?utf-8?B?V3NuanNBYXBaV2llYk5MZktvemdJK0JTNFl2Ynd5Q2lEVk40RUZpR0F5dy9o?=
 =?utf-8?B?MFNrTzkyVTZiNjFYSGVXMm80ZnpVYnFwWmNzSHozeTdUdlJDK0ZKdTdBZzlF?=
 =?utf-8?B?TUNLZ2tjU0o2dStIWTlWbnNHbHRnL3A4Qm94ajdsNlNCRCtzeUpSbkNiMzhW?=
 =?utf-8?B?SDZpdXQ1eTJYRE5QVm5uWmpEdkNOb1RSOXo2Y1FBdURGbVl3eXl5SDlQMmZy?=
 =?utf-8?B?RTZZYk1pejlvSkdINUNGOS9ucWhacmJzTktidUpjSGxGcUlET1FuRnlSblQy?=
 =?utf-8?B?UW9KZ0pyMndrNnQxb0dVNUlVdjhGM2pNcWNma2poaEtlK0tjNFJwZGxORWFi?=
 =?utf-8?B?WEIxeE91enRIa2tFbUpPbHl0bEdnM1F0UUlEcEtkYXhRc2xwbHp6VUZNSjBN?=
 =?utf-8?B?ZkVMOEhHeTBuTGdzZ3RxaSthT0V4TXo4NlZhV1QzTG93aE9qMEwxZ3RCNG5y?=
 =?utf-8?B?YWNCTGp0d3loRkVZd05hS2pLV21sZVhBdHdaN2tXUHppRnBKWGhyVWYybm4v?=
 =?utf-8?B?MFB6dWhqZWVrZHVObWc3VjFaTGthL1JlQ21iWENjd1FkK2ttd1hUSUVnbE50?=
 =?utf-8?B?Vk8rNEpyWkpMMzZEZmVLbUoweGtvYmVQdmJXc0RVUVUxR09HVkR5ai9FbTZr?=
 =?utf-8?B?WTFuVThyS1QrSS9FS29OK1o4YXRYTU9IOG1scWxDbkcwTHNsYjlaREhiNXFL?=
 =?utf-8?B?UkJMcmRvSHUxUnVMcmtuTFdDaDlmbTIycldBUlNRNUc5NFRrVHRJdWxqb3hK?=
 =?utf-8?B?QXo1SlFVRDJyWHpIRWRWeTZ2QkQvMm5rMGhxOXMwRkxhRmhtVnYzQnhCUlFX?=
 =?utf-8?B?Qk8xT0w2a0FJZFBFWFM5Y3dqK1EvMy9lbXM2RkV2S1J2Q3RJVkpJeVVxY3Q3?=
 =?utf-8?B?K1JiWnhUT1JSaUdLMnRXTmQ0NmNlTUVUeXhQVjVxUGtsanFrd0RDSkVwckNB?=
 =?utf-8?B?d04vVUJuRHd3bHVOUTBLdGI3ZTZ4ZmdaTWdSTXArc0Z4TTVLY055ZUwrVHdG?=
 =?utf-8?Q?WBjKqiVsQhIYOWlLjrcvVofpqH1qXDxvjOL9M?=
X-Exchange-RoutingPolicyChecked: LfP8ckgd6nQSFg/OPkEpsVORXxnhxzTGKN+vN6genk/VDAEiu7357GOa+uRsxMFJ1aLLHzJrUBOSifqT++cAe/CS09lIfJiDR3k2je9/MebTeW616gJPdWXKYQDyWBA4NSVUO9Ncgj6Lyzr7jIestH6OrffD7jLKiuCWJiT9q6i+7Hw9EhOKmtOTQWJ7tS2QUHMBv5/AZ8ThIylQyuMWiBE5R9sltxSMcEXYzbRfruiwSlWnniNsNo8TYsxk/n8Yq7pcSGYwCQQNW7dS2K//QOpBnLs43zb70KCAOqo+sNInVoNao/qOxcVrNGRtfwf6djapiE+NkEcmzPW+GppQEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a70629f-21a4-498b-1f7e-08df0a151684
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 23:43:00.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDf+hMXFj557C+okRTuQMRjkNt2K8UT8wwnpmZKEhI4KV9myJTQQ84DtNDJXuEvf1/4wDjmd2p5Z578xAIzpWfk5l3iqpkupTJgnhzdZlPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR11MB022132
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

On Thu, Sep 03, 2026 at 04:40:01PM -0700, Umesh Nerlige Ramappa wrote:
>Instead of always returning -EPROTO for most errors, use different error
>codes based on the error type. -EPROTO is retained for the cases that
>are genuine protocol violations by the GuC.  The remaining cases now
>report what actually went wrong.
>
>receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>two error codes that dequeue_one_g2h() could return on a fatal error.
>Invert the check to simplify reset handling.
>
>v2: (Michal)
>- Sync order of errors in g2h_read and __guc_ct_send_locked
>- For CT errors use EPIPE and for HXG errors use EPROTO
>- Convert the non-fatal EPIPE to EPERM in the helper

I missed changing the EPIPE to EPERM in __guc_ct_send_locked. Will 
include that in next rev.

Thanks,
Umesh
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Assisted-by: Claude:claude-opus-5
>---
> drivers/gpu/drm/xe/xe_guc_ct.c | 51 +++++++++++++++++++++++++++-------
> 1 file changed, 41 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 5c4733da385c..c5a417fef913 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> 	u32 cmd[H2G_CT_HEADERS];
> 	u32 tail = h2g->info.tail;
> 	u32 full_len;
>+	int err;
> 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
> 							 tail * sizeof(u32));
>
>@@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>
> 		desc_status = desc_read(xe, h2g, status);
> 		if (desc_status) {
>+			err = -EPIPE;
> 			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> 			goto corrupted;
> 		}
>
> 		if (tail > h2g->info.size) {
> 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>+			err = -EPIPE;
> 			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> 				  tail, h2g->info.size);
> 			goto corrupted;
>@@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>
> 		if (desc_head >= h2g->info.size) {
> 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>+			err = -EPIPE;
> 			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
> 				  desc_head, h2g->info.size);
> 			goto corrupted;
>@@ -1044,7 +1048,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>
> corrupted:
> 	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>-	return -EPIPE;
>+	return err;
> }
>
> static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>@@ -1067,11 +1071,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> 		goto out;
> 	}
>
>-	if (unlikely(ct->ctbs.h2g.info.broken)) {
>-		ret = -EPIPE;
>-		goto out;
>-	}
>-
> 	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
> 		ret = -ENODEV;
> 		goto out;
>@@ -1082,6 +1081,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> 		goto out;
> 	}
>
>+	if (unlikely(ct->ctbs.h2g.info.broken)) {
>+		ret = -EPIPE;
>+		goto out;
>+	}
>+
> 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>
> 	if (g2h_fence) {
>@@ -1809,10 +1813,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> 	s32 avail;
> 	u32 action;
> 	u32 *hxg;
>+	int err;
>
> 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
> 	lockdep_assert_held(&ct->fast_lock);
>
>+	/* Keep in sync with g2h_err_is_fatal() */
> 	if (xe_device_wedged(xe))
> 		return -ENOTRECOVERABLE;
>
>@@ -1823,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> 		return -ECANCELED;
>
> 	if (g2h->info.broken)
>-		return -EPIPE;
>+		return -EPERM;
>
> 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>
>@@ -1840,6 +1846,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> 		}
>
> 		if (desc_status) {
>+			err = -EPIPE;
> 			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
> 			goto corrupted;
> 		}
>@@ -1871,6 +1878,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>
> 		if (g2h->info.head > g2h->info.size) {
> 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>+			err = -EPIPE;
> 			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
> 				  g2h->info.head, g2h->info.size);
> 			goto corrupted;
>@@ -1878,6 +1886,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>
> 		if (desc_tail >= g2h->info.size) {
> 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>+			err = -EPIPE;
> 			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
> 				  desc_tail, g2h->info.size);
> 			goto corrupted;
>@@ -1898,6 +1907,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> 			   sizeof(u32));
> 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> 	if (len > avail) {
>+		err = -EPIPE;
> 		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> 			  avail, len);
> 		goto corrupted;
>@@ -1950,7 +1960,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>
> corrupted:
> 	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>-	return -EPROTO;
>+	return err;
> }
>
> static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>@@ -2042,6 +2052,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
> 	return 1;
> }
>
>+/*
>+ * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>+ * is simply not available right now, which is expected and handled gracefully,
>+ * or the channel state or the message itself is inconsistent, in which case the
>+ * only way forward is to declare the CT dead and reset the GuC. Since the
>+ * former is a short and well known list, check against that and treat anything
>+ * else as fatal, so that new error codes don't silently escape the escalation.
>+ */
>+static bool g2h_err_is_fatal(int err)
>+{
>+	switch (err) {
>+	case -ENOTRECOVERABLE:	/* device wedged */
>+	case -ENODEV:		/* CT disabled */
>+	case -ECANCELED:	/* CT stopped */
>+	case -EPERM:		/* CT already declared broken */
>+		return false;
>+	default:
>+		return true;
>+	}
>+}
>+
> static void receive_g2h(struct xe_guc_ct *ct)
> {
> 	bool ongoing;
>@@ -2079,8 +2110,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
> 		ret = dequeue_one_g2h(ct);
> 		mutex_unlock(&ct->lock);
>
>-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
> 			CT_DEAD(ct, NULL, G2H_RECV);
> 			kick_reset(ct);
> 		}
>-- 
>2.55.0
>
