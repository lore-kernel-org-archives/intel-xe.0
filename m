Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD36FF886D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 18:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0E810E0C0;
	Tue, 28 Apr 2026 18:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRdkNYOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D5510E0C0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777402324; x=1808938324;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=y5Atr5yt7H2Yas+hKkzhvoL5iF2Q48+bJIns+sbAx4M=;
 b=aRdkNYORpGjlLzKimd7MGq3juEOjFh36Ow5vul7UcLNR6gwh4zxnHfXA
 p95h/CvZdinMdsKe5bIB9dSfHGVmfFt9NgNL3bwylKc4KDIGfTs9XVAZ4
 AMrkRJw2LGY8U4eLbHYVr5fk2FX/Hbos6Iok5Zs9zHJPFiusymUZgyiJu
 YwQdc7gM26Vgi5hu7Wf0m70HpoLEiKiI2Uo7Z12N012gltcsuHqNOjFOw
 VF3wYRPa95RZmDsjhQ8gT3GrueU8OiP99Qhauggq3SvvVg6gReBPFxdj4
 csNkdK0TcwOyTVx/MHqQXC2EzTdC8V7m+0dGgMeVlV9CZ5/qbIywV7rcR g==;
X-CSE-ConnectionGUID: 52U5kCvNRly4kiPrn3sjuA==
X-CSE-MsgGUID: 66y3pVUDQ++dAVWdr6bdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80898578"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="80898578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 11:52:04 -0700
X-CSE-ConnectionGUID: pbZgoAVsRhC28wQEM5CO4g==
X-CSE-MsgGUID: LLxgXAy4S/Sbl2Kr6JADBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="257592363"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 11:52:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 11:52:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 11:52:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 11:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQKueaeLR5a9R6wB7Db0WgI4WFUm5OPbMjjB/36Xakuf1d2hb6kHD3Ppf7C7kxccZh4d5ZAHWgFANFBr02bYn/nsv3cjnvhXX01wNUHRm9YUtF8JPOmdc3+e+Fd7V3+kfkE9xuVt4ZwvfPl9SJApPcj1reuqXyQRsmCxFBpMDhgJZeLa/ooG0ZuCuwFGwhOD2QKae0SBfTH9USppxefRoPZ9vMpuSLqg3rd0/dIjCkL9rP2dDyYr+ndht5P9qMQlpdu4IOaapEEXK5v+trHYIhYkC0LhkDBHy6qhc0yvTF4QsF45iC7KGiJECiE3OEg7rjrYgoxdyvB/MnMCgw2xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTesr7yk+A9uVdVJBjjyzfsiXvFDuaaiw8IVnMuSm5Y=;
 b=iz0/Y5ZwJnbOhFFBmAEXrOnRa4rjhkG94y5gfo+JrirElXswioIHCEui2oLX7SXKNOr0MwtkfTrACkCAXy/rz6l7v0yNqeHfPraVn3oTc6AIUFlOogUnp7WsOP4Qfp99/pSNch/JhZA7pEFPrax6gyKYm5h4GMSs0Jx/0MOe7TFDpFrYYArPgkrTfRkrLRAJUqruFcj2W8WpNn2lDRWnk+XfGkog2dO+qUdHC9S2y5uAYU7ibnqc9UNhFcNEGgB6c01zxTruIXQAoTNQFDuXsytyuVy/xbrSkkdCDs16Cen1JdGL1obXhnlZ79aK4ujCJmJ473oaLgB+sYrs9CkCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 18:51:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 18:51:59 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Fix EAGAIN sign in pf_migration_consume()
In-Reply-To: <20260428183050.3998257-1-shuicheng.lin@intel.com>
References: <20260428183050.3998257-1-shuicheng.lin@intel.com>
Date: Tue, 28 Apr 2026 15:51:55 -0300
Message-ID: <874ikuq5o4.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e4fe01-d177-40b0-a270-08dea5573a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: B4LTmCOFMdKgVM5K2GnCE/T4sbyh/APJRgz4Gsv57aXcfZ59KCfP1OkGnEUeff/5hXcvhy/QmOvUjGwp9iUIawjcZgzwWLYThSttJDGY6SOOyGqiGaADTZEGJjTxWlOIFgbnfVaVUBMQb3I0yga9OIJrhcVAr81pgH1X7Ht74dRgryxV1yuP/ygkKSKXnLSA68hvO1FWMwRC0dhRZ5kz6JcOEHpzZZt69ZZryU4VNatVyHnH6lSCWafmcXVudB+gyDhRraPwgqCsiAHNerdvqR+8k1p8yYIYiVW9Rs/X8WdFAXGqHWGA/IW7m3efT+IESZBmeRO2jBhdEWyxn5koRCcA9n0KLkm5g9gxSnx8Yd0M3TO7ZRxvpt5pFa5mU/MdFU/T8oVmJSRlqojgyC5jvr7uHYPb7IpNE7CnE+2PkjDcp7V+ARbszIyU23NeSspcUkOe9UwbfYXIW43/bgFONjcEQxXccyxp4uC1s2dg/HMefLcrSAPPsOd5Y/dBzqCnf+0ixfB65vUSThvpsAc/owvpf7PbJHP9jGDbztWGaH8ls1B9bDZR5UkF49ktd2+egi2JdFGlkl6wtDIhp2pbGHkJsmRmuh8ssrEo47HJsDb7qTMNZYWHkG0GOxOklTMYOSFR9gMg0EaU5lgP3mrqeKEj+BMJYwrDmZZFP2IOw9nCfBniXvhlCClwUjoTfqHUtJpdiSpc2ucC8HhMki0/6oeTiuhL/wSeIsUBto5g+/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlRTMjRvdjA4NHZyNzNQRVIydmx4b0J5aklSMEM5Q2srY0dBcTYxRmhrUVZT?=
 =?utf-8?B?Vk94a1h1dFFTZGZGQ3FndnUxREVDTHU3RndSOEZLeGZYY2dRQVMwVk5idk40?=
 =?utf-8?B?UFVOejVYazJGVEVGR1VxZVFwWGRIeitPcGV1S1lEVk5vdVFIMGs3S0pCU3VD?=
 =?utf-8?B?OG5HNXF3bG9ReFl2c1BoU004UjJtYzltK3k2MWhSTWpoUmJJK1JwVGgrMERn?=
 =?utf-8?B?WlVNZjlKNmpkbndhZmdLNkN5eGFlL210dmFiSFBENkdtajJjNHhJWXBoeFp4?=
 =?utf-8?B?NVBtVkw2bVBhTGd5OFh6c0lCNlVCQUhaeTJOQklGYWdTV055M2xOUUdHczND?=
 =?utf-8?B?OG5GeVpySVdvQmkzWXo3c0ZLaUtZWXVGZjl2M1dUQjI5WUhoaHR1cWVmS051?=
 =?utf-8?B?VXRGNmRDcEQ0R3JFRFUyNTF3dU1wNCtnT3dsYUJiaXdnUHBxY3RjYktIamIz?=
 =?utf-8?B?VTNXOENDdlZDeTBIS0FSY3NBSE9VemU2bVBiSEpNeVlVVS9aS0ZFQS9LeU9K?=
 =?utf-8?B?S2FYQW5kSVZwV3FCOW9sbjMzWVltNDFqSHhUTXNzeUlNQ212cnBKZjlGbFRX?=
 =?utf-8?B?UGZlczMzaUwxYXN6YnExemkwZTVERDNKYUI5T1hUeFM2Vm1VN2IzdU9SN09i?=
 =?utf-8?B?cHd3d1hXVkJpWWNuU0NONTFDWW4rQTdITENUU1NydG1ZbmY1V1FuZThVYzNC?=
 =?utf-8?B?b1J1QUFaanN2T0pXcDUxMElOcXRkWU0rRno4OUtjR1VWeXFNOXcvU1pYYzdv?=
 =?utf-8?B?bFMxSytJWU1iQnc2VWdUQkhoSDlGTFJtWlRvZjhlL1FXRmxzeWhTa2RFWlRC?=
 =?utf-8?B?RGdPMng0VEJZR2dxOG1JYk5DOEtGN25BL3B3MUl0TlFlWklheWhaQ2V3U05a?=
 =?utf-8?B?am45Q2lyZVdzK0laM3BVY0I1bVN3bDFOU2VKaVFoMG9tREEzaWZ2a1dkc1ZO?=
 =?utf-8?B?MGlSZ1l2bk9BUTZoTUtuYm5jRWF3YXArZ1dUSHE4Z01CMFo3WG1ZcmpWVjlT?=
 =?utf-8?B?a1NQSE5QT1REZ1dKaGdIY0JxWU1jd1Y5NVJ2WEFOYzJlOVBnTkFPYm4yem53?=
 =?utf-8?B?OUpKYVR1ZUNoYU5OQzkvNk84WDdvVmRjbmoweCtPMU94MHcxc0R5L21aSTMz?=
 =?utf-8?B?MkJ4VmpYQVdscTI2UDlPby9GRFo1L2phSVNwNEZHQk4rTFMySnhBa1hNb2c5?=
 =?utf-8?B?WU05SzlJOXhUT0dIcEU0cittR0xuclN0cmxYRzMySkZQdE5VSWhISlZ1aUNs?=
 =?utf-8?B?eUJBRW82UGtjaDlCTm12dWt5cG1SYlMrNjZJdVd0M1IxaGlOWG41bUlSOThv?=
 =?utf-8?B?QWhmZFJTQTkrbVVydzgydVNrTXFTY1Z5YVJMNjQ5a3RjRjVmV3d0ZE5JUzVm?=
 =?utf-8?B?Z1FBQXR6WkEvWkMxSXhsekNIUm1OT1BZZldIUzFzNEpVTFg4dWRvQjBJVmJX?=
 =?utf-8?B?VGg5cENqMHlEUjdubTZqTXBBbG1tdENDckdqSVZFRHFOcllOcWJtWXd1aXFF?=
 =?utf-8?B?b1kzcEg1bFNpYmtxRkI1eFNIK2RjVnhCSE0xa3MxNDNHR1lIak41RDA2R3dC?=
 =?utf-8?B?QVl0UFF1VFg4TWFGdTBIL3hIY203cG5oclpUcmZaNisyTFl4NlEwcEdneXQv?=
 =?utf-8?B?UE1heVlLc0ZITE1SRmhidkxZaEdPSythcG1tMGh2Y2dtWkllMjZTUUFEUkZK?=
 =?utf-8?B?SXF2bkt0NVYzNGZVSFYzMk1FcXFlRkNSRTM1azV3cFZiTko3ZTBDSk5CMlgr?=
 =?utf-8?B?MjhleEtLVk95eXpaNi9XKzcwdlFUcldtdzJqd0ppRjVMS0hoWU9Zd1VMemVB?=
 =?utf-8?B?bTJxL0NKL09CTFQ0aktuZGFoWk1vSStsZ3BmV3YrdThBbHpTREl3RE1OYm45?=
 =?utf-8?B?L3N1QVMxckVEWnRwZlY1MEFDb3JnQmc2WndnN0JIS3lMcko3ZThSMEtvRlZj?=
 =?utf-8?B?MEl4WVVkcDY2ZWJWSTBkSEJKSnNVUDB4TFN6WWs5azdaZ0c5bjlERjJRWm8z?=
 =?utf-8?B?T1duUE5hM3pxcTBRR2N4dUF6KzRMYnAvR0dnQkNMbHVQbDc2eU5udWRWMjd1?=
 =?utf-8?B?bCtrdzZ2VUZsc3k3ajZ2UnppVHpUNDRsNjNwZFZ3QVZDamQvdlZVU0xBbml5?=
 =?utf-8?B?K2pJNTNFQUZwbmQ3VC9NUU85VElyNnFBNEJDeXd3UThoYzMrUUlJZHpuUVp4?=
 =?utf-8?B?L1FROUI4NTMrVHJZTVRtNXMvM1VPdWx2VzU3OGZUZlJRbXlkb1dlM0JmTmhi?=
 =?utf-8?B?Smo5N3hxcUZSSzhVWXZFVzIxeGo2dW1TQ0YrVWZXM0lQd0hxNndLcldZTmVB?=
 =?utf-8?B?YXoyT1ArSFZnUHl4MmwwNjdtQ2pRcTZKc2ZURTc5SEE4R0l3YXgwQT09?=
X-Exchange-RoutingPolicyChecked: EtiXNo5eap3QU3sf95I9QGA5jTE78OQjX7vL8n5kDj4CPMwmX9Y/vXSOamWxNySMwXRuBgR7xr/ng11GE5E8S0vWls9q2lCZgj/3dH1qmSJGTbT+zCUPEilOsbLTPejq1dR15URLVnZFKowf5qyWfsdJhL+EzEoegvG60fsHYjhzyACxiNq2kQvjp4vWxYy4Rh3AcS+UU+xzv5w6m0/yzp/SKUOWU+JbB7cji4k0mzOKSGy4L/relyMUhfCtrdvx2mJEf/o9hIw4PzWZGvjKwvDLv1TKBGGqCRNLnr0HK51GjyDSKdM8Y83W0d5uY06e4Dgd5ewQsP9cLw0BECIN7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e4fe01-d177-40b0-a270-08dea5573a42
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 18:51:59.2375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEklqY5Wr65VXi/40b9tLEgnvHzNsK8OL7Tj+Dx72KFKzRJ+xlcQryEIQVzU1fhkCNOMzls2gsiviW+BTQ2nPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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

Shuicheng Lin <shuicheng.lin@intel.com> writes:

> PTR_ERR() returns a negative value, so comparing against the positive
> EAGAIN is always true for ERR_PTR(-EAGAIN), causing pf_migration_consume(=
)
> to bail out instead of continuing to the remaining GTs. On multi-GT
> platforms this can skip GTs that already have data ready.
>
> Compare against -EAGAIN to match the intent (and the following line
> that correctly uses -EAGAIN).
>
> Fixes: 67df4a5cbc58 ("drm/xe/pf: Add data structures and handlers for mig=
ration rings")
> Assisted-by: Claude:claude-opus-4.6
> Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm=
/xe/xe_sriov_pf_migration.c
> index 6c4b16409cc9..d6f602f715f0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -149,7 +149,7 @@ pf_migration_consume(struct xe_device *xe, unsigned i=
nt vfid)
> =20
>  	for_each_gt(gt, xe, gt_id) {
>  		data =3D xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> -		if (data && PTR_ERR(data) !=3D EAGAIN)
> +		if (data && PTR_ERR(data) !=3D -EAGAIN)

Hm... Is it safe to user PRT_ERR() without an IS_ERR() check in the
first place?

Perhaps we could take this opportunity to fix that as well.

--
Gustavo Sousa

>  			return data;
>  		if (PTR_ERR(data) =3D=3D -EAGAIN)
>  			more_data =3D true;
> --=20
> 2.43.0
