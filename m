Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ADAEB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 14:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E360D10E25A;
	Tue, 13 Jun 2023 14:05:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4C10E25A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686665117; x=1718201117;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Yhdkc3hH1Aonppcr/HMc0vKEYb2JrFX//tCEGZD8bZ8=;
 b=f7cKYu+SvKLgSdaev5HBeTEsjy8kaMjFeCFkIXRzyTpVa0phECmodgTc
 eb3YJRMUbiRCVhCeNPCeUXEUSsGg0Avn0xHkSObNdK7BxyJncgJknOFLs
 pswL1FTFjn6Su+gfU4J+XI3nbdHs7aQfC4iHgkTb0jhU/1Y2xfeF7rLg9
 OrjXkvlX8ql1MoCTNyzmu1cQOTc6C22E5q7WF7YeXY1855FY73XEHTq1W
 d/8/rDNcb+mvBX0XW2JU+uTDWwnZ2blItQm98BnlNKi46ToDMak0KO9rW
 fyHk6TYja7EBXUXRlzcEg77AmqbLglyPgL8Q8r4JNQrdsH5ProHKxF6Ux Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386739269"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="386739269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 07:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="885858639"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="885858639"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 13 Jun 2023 07:04:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 07:04:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 07:04:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 07:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARKyACJhOdQg4M6Cm7EQRHgzZKtSVkeyCS54ycfbRyOB2NUMJJPKV1sHOqXk6T11CZE1C2oeUZsMJW79olGZ+vvCf/RMsrmJyRx6+i4kyC0Z62xeucncvtfsxKQpznflAtT//+sCDmIfweRHZRG0P4+rbviazFwdOnTFh7nS+JoDPltKX41E1Xu4Cgu0RvgzKs9xCgwMtMrsFjmnk54BcprkGMrggKEm/aA7+vQE5YLuPDXNRZXXOC9EahRaD12F4kBtoVVxJdlXuHFVmPMivObTzvhad+7rhF0oylx+QiqDdw9Kughub6GqNJrLw3H4Jf23yUQs9IJWG/4MyZQ4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLOSoU9MWnFPPrAh9OQDDkoki4g1XX3VQVg0cJzoPEg=;
 b=EKZr1pRqAfq5Am5OyXMvbiyiwhFN5c2Uy9TPH1IF0CKluZoeOLhm5kLjKHRbi8fQ18mZuJWtJgVuXLk4bFSbtbqInsjyDRsjhbk4QMPLdd5YKzuFh9H8r5yRrjJb/SxXfR4w5Gm/4BLoyPOJbZJxW+jIaV4RVJaeqaunDJOBgrfpmxmTB4sD5Lpk+xuzeycc8yaWW65ASIGUc7PFNok212/QHkkMlunwHcQNla/w7v6kOYWcedC0uRed1NhD3dd+ZWHicjfsB43BOr4oUOlGoPYJcq7dAsrG5bSbPE/+dC4r+DMmNar+1UzmxPX5lRbCRU3JSmcLupOZE48IDAv5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3567.namprd11.prod.outlook.com (2603:10b6:208:ed::31)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 14:04:22 +0000
Received: from MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e]) by MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e%5]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 14:04:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230611222447.2837573-4-lucas.demarchi@intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
 <20230611222447.2837573-4-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 13 Jun 2023 11:04:17 -0300
Message-ID: <168666505766.20985.17848650937260706246@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To MN2PR11MB3567.namprd11.prod.outlook.com
 (2603:10b6:208:ed::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3567:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a06ebd-3ab3-4215-79df-08db6c171689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yoXGROwrb7NvPC9ILkKvDHxBXuJ/R+0Ks0arxDL2iNPQJgvQSQIwiopJ3EOqN1j6425ypJzeQX8rOG8Am9O/DqBeV4JP/cFceHOFuYgAU/I+0YNefaAMYsTMBBuKxwrnBquOKhmpNqZZcdK6i0GN43EY+B6cKvd3PxDAbHASnQjzZzTCTqa759ff/zlCyzZsJg7d6olX4WlmtE+xrAlHWPy4xcgfjLjAXWxVwJSuVvT9Jb0jbzAgQF/X3PwDra33uJXiVSC5A/Dw2gt33KrK19w/uK87bxTn4yd4DcZ5Y658/VL64U4/txaKidZ1o2BLKXPT+CnzWf2W17Mpz3eWqeUrUASCYvmC/7p/n9B+RcFmlBRryam2KE9XARDUkPX5dehiTQiSq0I0R9nGbcmxPZ/Tq9INr54F/mJS3R6l89fFLTA3DLviiZuG8IJ+OEBLUaFajqHZFvuztU0cBJhTfG7ZLqUT8pGDPF65i+H4qfn0qO7YyhvU2TINNsAxjn8F5XvcCNhKHTFtEyKFdzo5BtOQcxqyEdWgLVs8U3VJHfRiwqxz9zZlIZ/+QXaCuDf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(33716001)(66556008)(4326008)(41300700001)(316002)(66946007)(66476007)(82960400001)(38100700002)(6512007)(6506007)(26005)(6666004)(9686003)(107886003)(478600001)(6486002)(8676002)(4744005)(86362001)(5660300002)(44832011)(8936002)(2906002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1l1OTF1QXRpNE9sQzhkWUwvekVEZFlKVnVYWWFjZ21RVitpdmVQeXlHazQx?=
 =?utf-8?B?dFdyNDE2QlhJbmdaMWlHa09zbmxack84Y2xRWTJ3a0xsWTIrREhNMkRjOFo2?=
 =?utf-8?B?OHFKc0JkZTl1V0xKWnFWU2hOMmx2K3AvWFYrZncyalJVNG96WENwV2VVcW5F?=
 =?utf-8?B?eEFZVm5lOURKV1VuK0ZWM1pVd1dPdU01eHdkTkFTa0ZMejZudUtGcFpKb0JK?=
 =?utf-8?B?UHNZWmtNQXc2ZTBvQTQxODRzNEwzOFZsQ1VJMVZmV2kydk9tK1Z5NnpFYmhP?=
 =?utf-8?B?MTRvRTcra2NBRWVEZXczUVRuZlh5UFAySlJpQktHRysvc3orZjdnOC8zVVZa?=
 =?utf-8?B?b0NqT2dIcUpLd0daL3krTm5NNTZYaTBzajVNbVVIYkFvUE1WaGxxSThPenJy?=
 =?utf-8?B?b1lKU0RqL21HUmM1czFxV1pCcmlTNklnQ1pOYzdDUWpxdEtzZnVGOWVaVEZT?=
 =?utf-8?B?ZmNUY014dVVicVpvNGZmbXVzVlRtcU14V1BYZDNKbGlLQk1TN3htMVl6bFE3?=
 =?utf-8?B?WVVSVDNoVWdsMHU4TDFrUVlhcU1XTXpaa2hDdnhJSGdnMVZoQjhxN0U3UU03?=
 =?utf-8?B?L3k3TUhONnhBQWtyMDloTnlVeG1yaVdCeVhwR1RaYnpLS0lWUldYeG5mdkNy?=
 =?utf-8?B?WFhVQ1lGUWdISU4vckpDSkRKQU95Y2VkQlEvY0hBdzBERVZFUExobkxQQ2lU?=
 =?utf-8?B?UytISmhhbVV5dEhOczd3WVNoVTBRc1FOdDZuZWZzRTYzbjkydjhtYlZnV3Zl?=
 =?utf-8?B?czllRkwydDlrZjBhRUFKY1pBR0hZM2ZRaEhBbE43N3dYK3NrVUVtLzIydFJ4?=
 =?utf-8?B?UXRNNWd1ajhuSWhOSTVEMDM2QkVweWlXdDV6NkpqaWE2aVVjODloV29MYUoy?=
 =?utf-8?B?MEZ0Y1VUS0VoWE8ydFlLQnhYRXkreVViRDNvWTZBV0pTOER2Y1gvNEVUWDQ4?=
 =?utf-8?B?eU5QZXpRTm1PMW1SdVlycDlNakF6UFU4NGRPT1UrWVR4NC9NaWFYdHg3T056?=
 =?utf-8?B?SUNjTFdRdGVRNmxhTk1na0FJb09EVHo5b29DZHJlNVY2aVRuMEFkbmtnc3F0?=
 =?utf-8?B?Ujc2dnpPNEFsY3RKbjh4clU1cllVZER6VjN6bnNQbitFTkt5V0lvMlBtU1Qw?=
 =?utf-8?B?R0UrdzJCeFdXRXNpNHNGT3dVRWN6OU9EVVVsa2JYZE56Sjlka0NmNHdNSFFV?=
 =?utf-8?B?ZlVOSUplU3RVVldZNVVTQXRkUFBETXhYczMyaVh0b3RyaVZVY0hoMEFGOU1C?=
 =?utf-8?B?S3FMMGlPS3RWa3lQNjBRaFF6NlFiYTFldkkreVhPM0FsQUw2ZFR4VXNPMDRo?=
 =?utf-8?B?N2Y0YkR6SWVFZjRiKy8wT0lLVlg3a1dpcUdlWHhEeDg1eHRaR0RWdmtZVXZk?=
 =?utf-8?B?YUpLNnV3NTBPdnROYXREa2x4ZVFTYUhqWW45T3U2ZjhIYVF5S2tkTmpVanIr?=
 =?utf-8?B?WW13SkJEbjdvZ280akVxdEJkOE5CUUk4UXYySUZZaEgzcHpDNEZTeWFxNkw1?=
 =?utf-8?B?YjBSQk5nYXV2QXZGR2xXR2ZUeEhHVDgybUg0Q2FxSCtUQUxFblhISS9zdzZi?=
 =?utf-8?B?OUt3STNNVEY4Y3pvb3JlcjdpZ1hPRnJCNWk2UjAxZkJXMm9RYlhmL09VTEIy?=
 =?utf-8?B?aFVrZ1RuYmlUbS94UFl4WW9BRmFNd2dnNVUzNkQzR25sUDgvc005NEFUa2lM?=
 =?utf-8?B?bENDbkl1MXphSHlQQ1M2d01qdDNPRzE4dkdLQjJHZnZYcXhmd2U2T2hTRkhx?=
 =?utf-8?B?VkthMzBtQUIwYXpKOVIzaXo5RHNaNHlzUXJSN1JRODJ3ZC9ackRWSVhzZjlw?=
 =?utf-8?B?d1BYWUoxZncwMGhheFRiaytJTXAwVkt6djFmSnhxcWRkWTRFT3RtOGlsQkha?=
 =?utf-8?B?WlRjVDZKSE93NGRFOTVRMy94WTJTdzRoMEhzakQwMFJyQzZrVjZvV0RjcG01?=
 =?utf-8?B?M0c0dGJrRGhiQWc5dHN2SUpwakQ1QnVSNWpHeGo4Z2RGQnhCUFpUYlM2VTdo?=
 =?utf-8?B?aXFiRkZDclYwYS9jZHJrMTJMLzlyMXZwNnVvRGtoMVJUdlhMOFJid0JFYjB4?=
 =?utf-8?B?UXAyZzNpOHljM0ZTbzNLb21UN2kvWXIwQmZKbGk3bXc3ZGg4Z3IvUS9CcTY1?=
 =?utf-8?B?U0J3WkNXb1F3N0dnVWZEMWpSNzluUmVOMjJMb2pLallRQUF6aHpzQUVYYzZW?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a06ebd-3ab3-4215-79df-08db6c171689
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:04:22.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IwnimhpniCFU3aHBu+sm/dsJWIuEZjxXBJEFf6eOFrQE544DEx/tUTVDksBfg7suQI3VjKe5pZ2DmtTAIjqZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe: Skip applying copy engine fuses
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-06-11 19:24:46-03:00)
>Like commit 69a3738ba57f ("drm/i915: Skip applying copy engine fuses"),
>do not apply copy engine fuses for platforms where MEML3_EN is not
>relevant for determining the presence of the copy engines.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_=
engine.c
>index b42a0cb50159..d3a8dfa1d2cc 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -492,6 +492,9 @@ static void read_copy_fuses(struct xe_gt *gt)
>         struct xe_device *xe =3D gt_to_xe(gt);
>         u32 bcs_mask;
>=20
>+        if (GRAPHICS_VERx100(xe) < 1260 || GRAPHICS_VERx100(xe) >=3D 1270=
)
>+                return;
>+
>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>=20
>         bcs_mask =3D xe_mmio_read32(gt, MIRROR_FUSE3);
>--=20
>2.40.1
>
