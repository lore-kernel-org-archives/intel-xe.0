Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E6CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 06:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5163C10E594;
	Tue,  2 Sep 2025 06:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAev40sc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18610E594
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756793180; x=1788329180;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xCmo1Jv6HvOV2U596iIU1azb7JkkDudBZQqa2kEnYak=;
 b=fAev40sc0dJ9u888m3rBZ2iwoxrKQS6T6dXPYQTHpBW8IFug0qIbp52o
 rwZu12IDzznCN+aSMEXXmuR5Uk2WX+SiDdmT1bJaVuGCgOSIElnhlLfUN
 MUzsATyxSqexNL6IcPzBUifk0NYrv7yN5/HfbSHV3AaDIk1p4wuw35QBR
 KVXeGGtIrAJjUI4KRSvVnElh6wf+1MjmB2G1wH1fldEKBwcLKsLGW6fb3
 BMTymyuIIXpTQ36L6VnxhA6Ka0ZuGbcy52np26dPPVwCL+hxuyLv0eOue
 6BHCPrA305/0/eixRJYuuYsMZusu2WQ6JpBU795+LshPKLQfIsNXEJEJY Q==;
X-CSE-ConnectionGUID: pLbTgnjMSv+lJWT/0cEjkQ==
X-CSE-MsgGUID: AV21FLhrSZSaXof2ML/viA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59119483"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59119483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:06:20 -0700
X-CSE-ConnectionGUID: yOiy4SK9SLG2uEht+q10rA==
X-CSE-MsgGUID: GVjEqBYQQYygnLLE6atN+A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:06:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 23:06:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Sep 2025 23:06:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 23:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIBF7D7UvqIITA4+lYrxyVn87t+SPqYxKuuAbr2vNmWIXtR76ye4KAnW/YYBAjS3+R9lxwOGUZRGPAJO7cQqK7uRu1p2MUnoE3XM2enLKNSHpRgM808w94v3z8zZHvQIeifLxwV1v2AZLHMhZ21piK81O7SKnjWwHHtPDUDb+UEEy4Aw0Kg872xiFoBzgs951e0eYXX9if7H66hqMrhILg/h/DGIti/IW9vgzob6VFiWTVAi4RHZzvsOs0/fo2resOtr8JUU4RUlMFWHu4t0ETy+TZeIW5qyEqtt/sjvbFR3P3/sDEgsdsEB3q461QMYfIGmeju1NhPF4hj8yusPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6wcEdp69gAaNCdiQ7lmsbwmqpiFiTNAKBFLDSMPqeM=;
 b=x/nXArQb8c0hXITk/q3+BzsZqdHncRTcNQy6m0lgfeVz4Zwb16aIfEtHNbYdtsSi5qdIxJop8OJEkP/yWnKJxZWrq4iWM64o8PeM8sdz1jsrw6GNWLvi1Hr73cI3t6rJgh+TvcfkOKlkk/a9TfHXkTceAl37bdx8wVXFHrnWqjRxKjvX2JIb35aByodCquH7m3lUKNb6hGkrbpY5zFqTYAe+uzzICTJCoh6xgIOPfwhp1k0wJMMhCYEFjIKKTh5znwDrpTOCP/1HqimPwbjRyDnGEpt2dl84Itdx2sFJYYML44QLz1rXB6ktPTPspskdnFylcPapfmzGiN+osFBJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 06:06:14 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 06:06:13 +0000
Message-ID: <feb405e1-246b-4722-bf6c-d41533b39133@intel.com>
Date: Tue, 2 Sep 2025 11:36:07 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Add_devm_release_action_to_safely_tear_down_CT_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
 <175671972703.288466.10512690046668307981@1538d3639d33>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <175671972703.288466.10512690046668307981@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|MW3PR11MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: 865547ac-4d19-4920-512c-08dde9e6d1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjJKaURJZm12TWhxVWxLeTU0MkRXSEpBc2Z6aTNES3BoUldFd1hmNy9mc2lC?=
 =?utf-8?B?SFpFWDRiRTVCZFowQUl0NC9vNHBrUHVKZ2ZNdFlYd1lvZ3d3VjdJU2p2V3hm?=
 =?utf-8?B?a1FrenhWc3RIdDBTRlUyR09VTjBIUm9Eeml0aThWTnJrUDNhbkdXd1F2Y0pY?=
 =?utf-8?B?T0hzakVZMWpFeUM4M1ptd3ViQkFibDdZNjBJKzBiOXpMRXdjU25Ybit2amhN?=
 =?utf-8?B?YjZxbnJVSzVXTEJUdGhrTXViNlloZmNuUFQ0VXVTYVlNQzIxYVZ1ekpQbzVN?=
 =?utf-8?B?K1haVUVKQ050cXlVZGZOb1daTWtsNjc1RnlSdkVmSzhVOWpRYVR4cE9EaG16?=
 =?utf-8?B?TWExeFdBWDBYbzEzbHNNWUhMRWQ3Vm5vTkpDVE9KVDE1ZHc1K3VVZ29rQm9I?=
 =?utf-8?B?Mkdqak9LOGJzNEYraTB3aUw1V2QzVzkwVTU5ZU1nUkpQYXNqcWVhd0pPWEhN?=
 =?utf-8?B?STZxSHVmNGNYSEh3L3B4R0VQeGRVbVQrUlYxbmpqZUNmU3lnMGd2Q05uRFhS?=
 =?utf-8?B?ZkZ2NTJJWDZIVWFtQ1JnWENhdWFiS1VSaWNUZVNOTkFpd2pBQW1HbnlJMzBG?=
 =?utf-8?B?c0E3L0FxUUhhTW0wL0JSOW03UDFxYkNiQTFLS29STG9BYnJUSzJQR1FDdEFa?=
 =?utf-8?B?aXlzR1JMMU1WbTZiUVJFUURxRnYyNTF3cjZyM1p6bHlLbDZiQnRiT3dMWnEz?=
 =?utf-8?B?c29yOEN2dExRR3RIMFFFQjlZaFBaSVp2aXRkcmIxdEU4elFOcVY2QTlpLzR0?=
 =?utf-8?B?MUU0TzIvUmwxamdlVG1lYnNxTEJBOVJnWUVHU2NLQUN5dUdoQnNSeC9oQXp0?=
 =?utf-8?B?TjZQemlMd3pFVXRsbGN2ajZMcSs2Mkg2a2daVFZnYi9IeHIzRTdZek9kUHRy?=
 =?utf-8?B?TTRWMEd0U1AyY3QvYWZBNXNyRmpJMENVdzJvR3ZIcmN6V1lMM1h3KzVMemF5?=
 =?utf-8?B?L3dkQzB0WE1XTEtWalZ6QmQ1V3g1bkxEby9YUVN5UUp1b2RGZHd5Szg2d3hx?=
 =?utf-8?B?TmJVbFJHTFRtY0lsZE50VmQvN2wwR21BeDY4WlhVSWRQZHdtSzlCbFprdjB2?=
 =?utf-8?B?UWwrY29iUEYyeDZNaVk1NDhjd0RiOGhaVngzNGR2K0lKY1RuMFoyZE5NMzA4?=
 =?utf-8?B?bjZBajZVem53c3IyNkFvK1hYUVNGMFpkdXhGVnlnUncyMEdXeFRNaURrMmpH?=
 =?utf-8?B?ekhmM0IydXdRQ0M0NW9BWDdLTTMwOVc2cjg5RStkbmF4QnpVRFBBNWJrQUxS?=
 =?utf-8?B?S3gydEpBbmJ0TkRJaSsrRlQyL1FEczFEWVVRL29kNUR4MGdSMHZYWUJmZ3Q1?=
 =?utf-8?B?SmY0NWlYWmdtam4vRjZYNjdKbEZ4cGJaQ0hHWmdmM2F0YTAvSVhmcFo0SVkw?=
 =?utf-8?B?K3ZDZGJKc1ZJOE1TaHhkdHllU1VwaS9QWVduVmJ0VVhtekxUU0tOaEFnaGFU?=
 =?utf-8?B?dEc1TUlQNTJkS2ZISkR2dHBLay9xR0JPQUdrL0w4ZWJuekVZQUExMlFCNDEx?=
 =?utf-8?B?RkZvMkVPQ2t5eVBzZG96OC9LTE9saHNYVExyTS8xYWZNQS8waXVObHdPcnlh?=
 =?utf-8?B?WXRwRzkwZUtqTEg4R243NFRScFdwRTQ2dHZ1bXZMbHQ2dUVobXgyZldUUGVT?=
 =?utf-8?B?K2ErdVhVZHdiT2lzVVpOZ0dTdU5GeU5uTFl1QnpKMUx0UlVWMzhVd0p0Zzls?=
 =?utf-8?B?MExrbzFqS3ZyTzRNSkgxRlFodUtWTzBrMjZFZVlhSk1IQ1FmVERnMzV6eFFR?=
 =?utf-8?B?U0tIS3ZFZEhMdDdTSEZ1TWtJT1RNeHVTZURlYlJ2T2tKajkwMFp0WG5maU0y?=
 =?utf-8?Q?ujgTIxJS+l5AbIs1l/WTiOjYOvhPqGBkxgntg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1FUmxUaURNRFRBMlpMWkZpaE9OckpsR2F6cTB4bHdONHlNZUFhSlYxdTdK?=
 =?utf-8?B?cEh0b3NybXZWTlBGcHZSaTczNmlmN2F0YTViWlZPTHVSb2lQYnl6Wkc3R0tY?=
 =?utf-8?B?MU91WlVLTERrV1plNitieUpoNFc3VGZNbUdKV25tMkVEQUdZM1U2UDlMa3l1?=
 =?utf-8?B?MXhodExHRGZWb2t1WTg1UVFBZzBTOHBSUFNla2huZXNBeGROVlM2RW9jQW8v?=
 =?utf-8?B?MEp1bzVteFNsUGRBRW0vTHZwUFdyaysvQVRPbWx0VHJjK1MwQk93cFFkRlEv?=
 =?utf-8?B?UWlQS3RxamtxK2ZOditTZ3A5MVRGM09aWldtMU9NU3Jyb3dwRXBBaEVJcitE?=
 =?utf-8?B?bmJsMFM5MmVBR1FZeTlDWDFYbHdnOHJBSG82TjIwMHI2bFFxVTFZUm9TRFZH?=
 =?utf-8?B?WjJDZE5ETnRiZHVSNHJJL0plalZ4dUkrNHlaZnRiQVlhOVlXVFUvTU5kRTRi?=
 =?utf-8?B?OXljbmxtOGtFYUFmYlZocGJrVThUbm9yajBJYTE5emlUVUdvVW1WeWRPOEVO?=
 =?utf-8?B?alVoNVViYjluTWdUb0ZObEN0VkJYY3hyK1hHNmNKajFiZjdIbUZ1VXdCRzB6?=
 =?utf-8?B?RGlETUgxalgxMnJyL0E4QWpjNkFDRU05cVVucTVBd0k2NnI0ZmxFZnJkQ09X?=
 =?utf-8?B?MXUyMGpSMjJ4TTdSUHlLTkVzbmVva282Q2dKdkdzMms0MEpKZGhSb3FDMVda?=
 =?utf-8?B?enJsUUxWS1RzUUNhaWlQMTlYSkRjeXZ2eC8zbjFHcWhJOUtRMUdHRzV5ZHRy?=
 =?utf-8?B?SUs3V2JoOHhGaFh6aDhoQTRYWklxbWZwbUZ4V1ZJZ1VKZE03TGZZVWhBOVBk?=
 =?utf-8?B?amU0bmpISjk2ckJKSmVvbDh1cWo4RDV2NzZlV1JmUTFwVmZZNnoyQS9lYkxm?=
 =?utf-8?B?WFYxZk53dlp6cjMxQXlPRkZUWWFvbFFjdWtkRVd4QTBrSU42SXNYdkdyQXFB?=
 =?utf-8?B?em1Oci83L2Nzamc2L2EwTE13Q1VyaXR6WEhmVjZ6VmduMEZTazBSUVgreko1?=
 =?utf-8?B?enVIWlF0a01zMWVmMEQ2WmQ4K3hTTlBPcFBCZ1NJREhBeDRjRGYrR3pSaFBS?=
 =?utf-8?B?Qk11T3VnM0FNY1ljcHNhL3poQUU0NUtxejdPa0VuU2Rsd2VNQTBmdlFkbTgz?=
 =?utf-8?B?cTBxUXpkUnkzZ1o4MXc5YmU2NTVnZTl5ak5TdVBjanBTUzk5TnlsNXkvMVBN?=
 =?utf-8?B?K2V2TEkyeVpONUlYbW9Mdys2ZEsvQjJOSUhRQWhRWXZPMXpvWUpPNDArSXdw?=
 =?utf-8?B?L25kQVdQNFFXTzVoRW1TK2srZmpseFc2TkJOcFpZVmZRaC9RZnlIdU1OSkFw?=
 =?utf-8?B?eTUxMDR0aHYybE1zd3pZZXBFR3R6aHVvZ3htSCs3Mms1c1ZLdzVpUHZlUXpU?=
 =?utf-8?B?eWZhZzlvN1BDU25ydm42eWNZZVpBYmlXL21TZ05XQnJzbEFITmxySW9meUlL?=
 =?utf-8?B?dWtQaEt0OVdUUVlFWmhicDdteW5KSFJBRjgxajJDNzJ2M041czRWZjUwSi9N?=
 =?utf-8?B?N25hZVJWN0V2M3JLazFhamZyUndFdHJyTW9SSmNlaTlkZVhNaS9LSkQwZktC?=
 =?utf-8?B?dHBkMStPNnhWZEF1aW9TcmJ3U2lKUmU0MVN0VEU5bUFiejkxblRsN3BHL1JT?=
 =?utf-8?B?am5sQ29HWEcxb3hxdU5aRFF4YWVUWENGbXJhTWV1TmRpNVlya1BBcWtsL2ta?=
 =?utf-8?B?cEhGOGtjR2lKQzVGVEp0Z1dyQk1Ld2l1WjlORExJSmc2S1l3SElQSkhKeElC?=
 =?utf-8?B?N2ZQUFlSajNSV3dKcElJeW02d2dBVDdyUXBydDR5RVVtUXYybDhzeEh2TlBE?=
 =?utf-8?B?bUtKbTJHS281M3pVeTR6TnpkNnBkTm9UVGN6ZGVLK0hvQnUvajk1U0pSZDVp?=
 =?utf-8?B?QSt6SlcyOThtYmh5Q216VFJVZHZsdDZEdjl4TDRwRGs2U2lFZjhXK3Q5WFdP?=
 =?utf-8?B?MDNQSi9lT2hUTFZhK0cvWTZ6OXl3Q2k1SUJyWTZHdDgzT3pJM3VCcjYrRHZY?=
 =?utf-8?B?VmxPbEpBck5RM2gzbkwyODMxT3o0Y2R6ckdrYUduM1o2UWZUVExjbVA5TVRT?=
 =?utf-8?B?RUNOamYreE1MY1BnM2hPT0JKUnljSjJXRS9hK21xOGIwMno0UDVNT25uRm5Z?=
 =?utf-8?B?ODBtNTZsa1JHUTZvbmRGNDdvZGpmQjJHbUxPMjdzMlRxenFRSWlMVUhUc2dW?=
 =?utf-8?Q?XucAA6gWW4Aa5dT4mxeiGCg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 865547ac-4d19-4920-512c-08dde9e6d1d2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 06:06:13.4964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RbJrigVYBegQw9pJLbB0JU0kHqq6UgC8IGdSjx7WUtacTCkSkazyj3I8RTIj0paWCZlmfOHq5lRJz4BDvN8umHSG0DDd7ON0wpxwnh6U4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
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



On 01-09-2025 15:12, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add devm release action to safely tear down CT (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/152870/ <https:// 
> patchwork.freedesktop.org/series/152870/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667_FULL -> xe-
>   pw-152870v4_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-152870v4_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-152870v4_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-152870v4_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_compute_mode@many-userptr-invalidate-race:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-2/
>         igt@xe_exec_compute_mode@many-userptr-invalidate-race.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-adlp-9/igt@xe_exec_compute_mode@many-userptr-invalidate-
>         race.html>
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-7/
>         igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-
>         nomemset.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-4/
>         igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-
>         nomemset.html>
> 
> 
I have checked with these possible regression tests on the respective 
platforms and see that the test works fine.
Seeing simillar failures for some other patches as well.
So, these regressions do not seem to be related to proposed changes in 
this patch.
Please help to merge this.
-Satya.>         Warnings
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_oa@mmio-triggered-reports-read.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-466/igt@xe_oa@mmio-triggered-reports-read.html>
> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667_FULL and xe- 
> pw-152870v4_FULL:
> 
> 
>       New IGT tests (2)
> 
>   *
> 
>     igt@xe_oa@tail-address-wrap@ccs-0-256k:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.01] s
>   *
> 
>     igt@xe_oa@tail-address-wrap@ccs-0-512k:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.02] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-152870v4_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@fbdev@nullptr.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@fbdev@nullptr.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) +1 other test
>         skip
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +99 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_big_fb@linear-32bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-2/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_bw@linear-tiling-1-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_ccs@crc-primary-
>         basic-4-tiled-dg2-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-433/igt@kms_ccs@crc-
>         primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +167 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-466/igt@kms_ccs@missing-
>         ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +23 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-466/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-
>         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html>
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs@pipe-a-dp-4.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_chamelium_frames@hdmi-cmp-planes-random.html> (Intel
>         XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2252>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-436/
>         igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-432/
>         igt@kms_content_protection@uevent@pipe-a-dp-2.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-1/
>         igt@kms_content_protection@uevent@pipe-a-dp-2.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_cursor_crc@cursor-
>         offscreen-32x10.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-2/
>         igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-
>         size.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) +4 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +3 other tests skip
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-8/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-bmg-6/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-432/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>         (Intel XE#4494 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4494>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_dp_link_training@uhbr-mst.html> (Intel XE#4354 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#2374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) +8 other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend-
>         interruptible@c-hdmi-a3.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_flip@flip-vs-suspend@c-dp4.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>)
>   *
> 
>     igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-1/
>         igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-
>         interruptible@c-hdmi-a1.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +2 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         upscaling.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +9 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-suspend.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         move.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +3 other tests skip
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-5/
>         igt@kms_hdr@static-swap.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-bmg-6/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) +1 other test
>         skip
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-5/
>         igt@kms_joiner@basic-force-big-joiner.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-bmg-6/
>         igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-432/
>         igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +2 other tests fail
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html>
>         (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2387 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>   *
> 
>     igt@kms_psr@fbc-psr2-no-drrs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/igt@kms_psr@fbc-psr2-
>         no-drrs.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_psr@psr-primary-page-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/igt@kms_psr@psr-primary-
>         page-flip.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel
>         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414> / Intel XE#3904 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3904>)
>   *
> 
>     igt@xe_create@exec-queue-destroy-invalid-reserved:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/igt@xe_create@exec-
>         queue-destroy-invalid-reserved.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +16 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-2/
>         igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html> -
>          > DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-
>         vm-userptr-rebind.html> (Intel XE#3876 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) +1 other test
>         dmesg-fail
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-435/
>         igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) +5 other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-2/
>         igt@xe_exec_reset@parallel-gt-reset.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         adlp-9/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html> (Intel
>         XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4837>) +2 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-7/
>         igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +1 other test skip
>   *
> 
>     igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-463/
>         igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-
>         userptr-rebind.html> (Intel XE#3876 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-466/
>         igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>) +1 other test fail
>   *
> 
>     igt@xe_pm@s3-basic:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-2/
>         igt@xe_pm@s3-basic.html> -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-adlp-9/
>         igt@xe_pm@s3-basic.html> (Intel XE#5545 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5545>)
>   *
> 
>     igt@xe_vm@large-split-binds-536870912:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_vm@large-split-binds-536870912.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@xe_vm@large-split-binds-536870912.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +225
>         other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_getversion@all-cards:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@core_getversion@all-cards.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-464/igt@core_getversion@all-cards.html> +2 other tests pass
>   *
> 
>     igt@fbdev@unaligned-read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@fbdev@unaligned-read.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-466/igt@fbdev@unaligned-read.html>
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-adlp-6/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#3908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3908>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-adlp-3/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition.html> +3 other tests pass
>   *
> 
>     igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-466/
>         igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html> +10
>         other tests pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-
>         adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         hflip-async-flip.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         hflip-async-flip.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-
>         dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-
>         dp-4.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-64x64:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_cursor_crc@cursor-onscreen-64x64.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-464/igt@kms_cursor_crc@cursor-
>         onscreen-64x64.html> +85 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-
>         flipb-toggle.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         bmg-3/igt@kms_flip@2x-flip-vs-rmfb.html>
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-
>         adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-
>         vblank@c-hdmi-a1.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-lnl-4/
>         igt@kms_flip@flip-vs-expired-vblank@c-edp1.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3149>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-lnl-2/igt@kms_flip@flip-vs-expired-
>         vblank@c-edp1.html> +1 other test pass
>   *
> 
>     igt@kms_pipe_crc_basic@bad-source:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-
>         adlp-6/igt@kms_pipe_crc_basic@bad-source.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-adlp-3/igt@kms_pipe_crc_basic@bad-
>         source.html> +1 other test pass
>   *
> 
>     igt@xe_exec_balancer@once-parallel-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_exec_balancer@once-parallel-rebind.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html>
>         +196 other tests pass
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-1/
>         igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html> (Intel XE#5530 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5530>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         bmg-7/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-
>         rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-464/igt@kms_big_fb@y-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/610>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-0.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +8 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-152870v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-
>         offset-overflow.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +2 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/igt@kms_bw@connected-linear-
>         tiling-3-displays-2160x1440p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-464/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-152870v4/shard-dg2-434/igt@kms_bw@linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +3 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_bw@linear-tiling-3-displays-2160x1440p.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-436/
>         igt@kms_bw@linear-tiling-3-displays-2160x1440p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-464/
>         igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> (Intel
>         XE#3442 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3442>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-
>         y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/igt@kms_ccs@missing-
>         ccs-buffer-y-tiled-gen12-mc-ccs.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +4 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2907>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +10 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-466/igt@kms_chamelium_color@ctm-
>         limited-range.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_color@ctm-negative:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_chamelium_color@ctm-negative.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-152870v4/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-
>         nonplanar-formats.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +13 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +10 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-436/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-464/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-2/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         bmg-6/igt@kms_content_protection@legacy.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) +1
>         other test skip
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         bmg-1/igt@kms_content_protection@uevent.html> (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel
>         XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-
>         before-cursor-atomic-transitions-varying-size.html> (Intel
>         XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-sst:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_dp_link_training@uhbr-sst.html> (Intel XE#4356 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4356>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_dp_link_training@uhbr-sst.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-
>         area.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-436/
>         igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-
>         area.html> (Intel XE#4422 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4422>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_feature_discovery@display-4x.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1137>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_feature_discovery@dp-mst.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_flip@2x-blocking-wf_vblank:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-8/
>         igt@kms_flip@2x-blocking-wf_vblank.html> (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-
>         adlp-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-adlp-9/igt@kms_flip@flip-vs-
>         expired-vblank@a-hdmi-a1.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1 other test
>         dmesg-fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +10 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-
>         pgflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152870v4/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-
>         draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +6 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +28 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +7 other tests skip
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_joiner@basic-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_joiner@basic-big-joiner.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1
>         other test skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_joiner@invalid-modeset-ultra-joiner.html> (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/igt@kms_joiner@switch-modeset-
>         ultra-joiner-big-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>) +1 other test
>         skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-yf.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html> (Intel
>         XE#5021 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_plane_multiple@tiling-yf.html> (Intel XE#5020 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5020>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_plane_multiple@tiling-yf.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_pm_backlight@basic-brightness.html> (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/870>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_pm_dc@dc6-psr.html> (Intel XE#1129 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_pm_dc@dc6-psr.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_pm_dc@deep-pkgc.html> (Intel XE#908 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) +7 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>         fully-sf.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-
>         exceed-fully-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +10 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/igt@kms_psr2_su@page_flip-
>         nv12.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-464/igt@kms_psr2_su@page_flip-
>         p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1122> / Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/igt@kms_psr@fbc-psr2-
>         primary-render.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +10 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_psr@fbc-psr2-sprite-plane-move.html> (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-
>         plane-move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6
>         other tests skip
>   *
> 
>     igt@kms_psr@pr-primary-page-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_psr@pr-primary-page-flip.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-466/
>         igt@kms_psr@pr-primary-page-flip.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +4 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_psr@pr-sprite-plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/igt@kms_psr@pr-
>         sprite-plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +2 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#2939 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2939>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#2939 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-433/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/362>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@kms_vrr@flip-basic-fastset.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@kms_vrr@flip-basic-fastset.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +6 other tests skip
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@kms_vrr@lobf.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152870v4/shard-dg2-466/igt@kms_vrr@lobf.html> (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@xe_copy_basic@mem-copy-linear-0x369.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +1 other test skip
>   *
> 
>     igt@xe_eu_stall@invalid-event-report-count:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_eu_stall@invalid-event-report-count.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html>
>         (Intel XE#5626 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5626>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@xe_eudebug@basic-close.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@xe_eudebug@basic-close.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +16
>         other tests skip
>   *
> 
>     igt@xe_eudebug@vma-ufence-faultable:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_eudebug@vma-ufence-faultable.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-433/igt@xe_eudebug@vma-ufence-faultable.html> (Intel
>         XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4837>) +12 other tests skip
>   *
> 
>     igt@xe_eudebug_sriov@deny-sriov:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_eudebug_sriov@deny-sriov.html> (Intel XE#4518 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4518>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@xe_eudebug_sriov@deny-sriov.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-no-exec-rebind.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-rebind.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +3 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_exec_fault_mode@many-userptr.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-464/igt@xe_exec_fault_mode@many-userptr.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +22 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-
>         prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-
>         prefetch.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +29 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-userptr-invalidate-race-
>         prefetch.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-466/
>         igt@xe_exec_fault_mode@twice-userptr-invalidate-race-
>         prefetch.html> (Intel XE#2594 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2594>)
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/igt@xe_exec_mix_modes@exec-
>         spinner-interrupted-dma-fence.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html>
>         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +260 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-
>     dontunmap-eocheck:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-shared-
>         remap-dontunmap-eocheck.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-
>         shared-remap-dontunmap-eocheck.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +298 other
>         tests skip
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-bmg-3/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4917> / Intel XE#5466 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5466> / Intel XE#5530 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5530>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         bmg-3/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_ct_send_recv.html> (Intel XE#5466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5466> / Intel
>         XE#5530 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_huc_copy@huc_copy.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-433/igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_mmap@small-bar.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-433/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_oa@buffer-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@xe_oa@buffer-size.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@xe_oa@buffer-size.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_oa@non-sampling-read-error:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_oa@non-sampling-read-error.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-466/igt@xe_oa@non-sampling-read-error.html> (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +4
>         other tests skip
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-
>         stream-sample-oa.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +7 other
>         tests skip
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@xe_pat@pat-index-xehpc.html> (Intel XE#2838 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2838> / Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@xe_pat@pat-index-xehpc.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_peer2peer@read.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-466/igt@xe_peer2peer@read.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>) +1 other test fail
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_pm@d3cold-basic-exec.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-464/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/366>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +2
>         other tests skip
>   *
> 
>     igt@xe_pmu@all-fn-engine-activity-load:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_pmu@all-fn-engine-activity-load.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-433/igt@xe_pmu@all-fn-engine-activity-load.html>
>         (Intel XE#4650 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4650>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-
>         post-termination-irq.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
>         skip
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html> (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-433/igt@xe_query@multigpu-query-
>         invalid-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-152870v4/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-
>         version-huc.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other
>         tests skip
>   *
> 
>     igt@xe_render_copy@render-stress-2-copies:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-432/
>         igt@xe_render_copy@render-stress-2-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_render_copy@render-stress-4-copies:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_render_copy@render-stress-4-copies.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-436/igt@xe_render_copy@render-stress-4-copies.html>
>         (Intel XE#4814 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4814>)
>   *
> 
>     igt@xe_spin_batch@spin-mem-copy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-436/
>         igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4821 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4821>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-434/igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-466/
>         igt@xe_sriov_auto_provisioning@resources-released-on-vfs-
>         disabling.html> (Intel XE#4130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4130>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-dg2-434/
>         igt@xe_sriov_auto_provisioning@resources-released-on-vfs-
>         disabling.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_sriov_flr@flr-each-isolation.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/
>         shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html> (Intel
>         XE#3342 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>   *
> 
>     igt@xe_sriov_flr@flr-vfs-parallel:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_sriov_flr@flr-vfs-parallel.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/shard-
>         dg2-436/igt@xe_sriov_flr@flr-vfs-parallel.html> (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>) +1
>         other test skip
>   *
> 
>     igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667/shard-dg2-434/
>         igt@xe_sriov_scheduling@nonpreempt-engine-resets.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152870v4/shard-dg2-464/
>         igt@xe_sriov_scheduling@nonpreempt-engine-resets.html> (Intel
>         XE#4351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4351>) +1 other test skip
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667 -> xe-
>     pw-152870v4
> 
> IGT_8519: 8519
> xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667: 
> 9319ef352fbc3067e632b13572e19d3b6e6b4667
> xe-pw-152870v4: 152870v4
> 

