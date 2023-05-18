Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5443DC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 22:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2835610E565;
	Thu, 18 May 2023 22:03:51 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A6C10E565
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 22:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684447430; x=1715983430;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=SdmQD4rtR/kQ0mqaVSMtvKtH09PFlIQg6cGJGv8H8d8=;
 b=PAhQQ5hmwT6jvJc0DlhktDVs2lJHRWqthO6kWYMxub/mLgE4f/I88cmb
 iLKC2TnfQbixzskveDzZup9C4uZo7eoI/8WO+bfba2+og+iQidf+2z9AF
 Uv2mg6bJ/4oBHObgH+qBWsFhaQoDzorWxMMjU1OhGSUJxPi0IBtUxZbr5
 N82C/jnGGh9IuBqkbWOW553wNIZOFr3vnRbeCL93zMeuJDxFeHGa6+v7d
 sms/BqI62POgWwLLMoY5Mzan4o/DkWbqqrfn5Od3yG+H+EpzHGyju8ZDG
 spuVaPewLJi8Am21gBiEDH7zL0FdtGebhMxwcPz1xFf+4V6y8+L9yPQ1q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332567328"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="332567328"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 15:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="679821967"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="679821967"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 18 May 2023 15:02:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:02:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:02:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 15:02:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 15:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DghLFuCnJaEgREFuP6bvSQ0nx+D9FbTGmHl0GWF11h4KtlbtgZCZherfJ4MV6qT9n4f7OMBovTwFj8Jvz01CWW6UN9wB1bjPzL1T9e4rKB6OoCjvLHtNBTuUu1e2iNl5vOwyiULOXLK5PyZTUKfMUuVj4SpzPsqSYA9e4Jb4vUxUrN7qHSfPBPQSbzODKn/XmJ4gLpitDSrG9Yp04hefCbdwTEFRULnpFYFd/QoFcQpiO+NiPMqCcryDz4lTPzPw888vvRJdSBmCFr9buVcfrFCu3TUOOe1Q8rjmb2YzdV+RQ8Wyz1n7xLiIQ7UcvLg003K5A6/JfieKa7Te+Hocug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdmQD4rtR/kQ0mqaVSMtvKtH09PFlIQg6cGJGv8H8d8=;
 b=dUKjf8dqh344c8oPQEzywpeTMKvv+G/14L6wy4wn4VF2wUVxRsK4IE8BiGzpECwbdWpW3unBhIcbhJ9JgPUfeY9ZHVkNtWb16S3Xca4ijh9BjMRmex+JDQwqDx+Ur/IA74ideY4pT+mB5CXdtzZ5Xg8rUk7gIcB8+ed/yb/y/YqGdZndulCoe5jKCkzPhJbUgDT59DHNuLvQdr4y5qC/Bd8Ufv8D3Ub7l2spX940slegTSZptNRss1h4xVWyXK4UHGdXd5cFLx4NqaFZJhRuiSSC9l+Ze7kDYizckkSyuVVdj1O+65QwwRObhTwXQnelxbm9MqlTQXQhys4ozV48aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Thu, 18 May
 2023 22:02:54 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 22:02:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168444270443.28967.5196907904146040415@gjsousa-mobl2>
References: <20230518201500.420190-1-gustavo.sousa@intel.com>
 <168444270443.28967.5196907904146040415@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 18 May 2023 19:02:48 -0300
Message-ID: <168444736811.28967.2544120973536829330@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR16CA0029.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::42) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SN7PR11MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b5a531-52e7-47a9-0a23-08db57eba0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9VtkPG+OLlZbxiPTLjkZKiu8UmDs18kRQwd/ypGA6GyNe4ItuN+gfOip3pt96HQ5FZ2bf2qX6uaUM2l0lwA9/QywBLqGKH3F5F26Ime397zHE/33MMxRGJX1kwwcFEEVQXXyIs3Kvntkgb8MQ0cfm1JxTemNwSlPVIKnsUAkeTaoBfbRsfxsbrK5XPKk1zjtZqIB65+Un7r8ft/Stgiczx+VJ5dM3lM0y1GebK+kHK8Dv41Vzx89x6NAquItBB8Iyhxe7TC0vQnl05o3JRziD+wOmZPtFYEsbN8HmaEDF8P4Fl93c1HHlke8hcf+O8OGWMxJpDgAENfKTx7Asb7bxEzsXuHhIHywa3XAdvbOGYy/pTtt2nAilHgsS9nDXU4ch9WQBo+2gQyj/EhNIKE9wloVfT2yTlyOOuzQsxhiOlT6snvoueZSGyiAJTHZsVIiMXg3SPOT/KVbGESmdWmHJ6E2AfY4I3Iy6Vyft89SRwvU5VEDiqkT2mL/29iaOTXdVKcaMdhYa7SkQnrWMbI61g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(478600001)(8936002)(8676002)(316002)(38100700002)(33716001)(5660300002)(4744005)(86362001)(2906002)(44832011)(66476007)(66556008)(82960400001)(66946007)(6916009)(9686003)(26005)(6506007)(41300700001)(6512007)(186003)(966005)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGxaZHhmTnY0WDBobnpjTFZPQXBjSUg5S1k0T08xanBJVXE0SDczZXBlTTV2?=
 =?utf-8?B?bmVUa2RmakNTak9Yai9keEJsUEFYUnlPb0RpZVJuWUpYQ2hLbXhvTTZiR1VJ?=
 =?utf-8?B?S3lYYkw3UndhYmt0UHBXamdQckgyVDM3bzRXUHdzQWVwMUs2U2lUYkxUa1ZC?=
 =?utf-8?B?aTQ2ekI1R3pqWGJGNU01bDgwMGhMSExoVFV0Z0oybXNZWitjc2d4eGc4K0dE?=
 =?utf-8?B?ZkxDU3RLclVZTUtHaUdpK3JOWTZJSHdxSXlRekI3MTJ5YytjRFBtOTUrWXgz?=
 =?utf-8?B?SjRqei95aGpGNTdNU2NhUnpTaHhKWHBDOWgvM3VKSXdhMEpyazEwSjVFWHVz?=
 =?utf-8?B?czgwWVVRaldzNjZKWTNuOGZvdnhEN3I0Z1hqdzE3aUxqVkFuanZCTTg5TmZL?=
 =?utf-8?B?OGQ4NkFIenZDTzYweDVodFBON0pST2F2NitQODd4VWVrS1hYKzVnWXpDUEJy?=
 =?utf-8?B?TWloNnNHdnE1cFA5cW1ld2FGbVpuRHZVdzZxelJGem5uSGxrRjVoQjlZTVpw?=
 =?utf-8?B?dElZL3VzV2Z3WjRCQUJxM25Yb2RCSmEyUVdpQXJ5bXZXbTh0TldBUXNoTVpw?=
 =?utf-8?B?dTZ1SERLTXRpcy92YktKekFNYWZEeUd4WnFaeTRTaHFSUjRWVEhoVk92RVg2?=
 =?utf-8?B?MkRVL0tEUzltdHNWa0F2SzVObzFBNmh5Z1VZaVFXbmUxc25MZm11SGdvRkd0?=
 =?utf-8?B?ZitqYzJTTUI2VDFjTXlxTkE1WGNOVHhKMEwwSE8zUlNkb1JVMVhGS2JrU25V?=
 =?utf-8?B?d0FkU2Flemg5QVliTCtoM2d1TXc4SjBFVXNQRmI5Wks5cW9Jcm1yTm9uTSs3?=
 =?utf-8?B?NmIyTk9PZ2o4WjE0TXVqVjFkZENzalRkVjlpc3ZvU0dEN2JlS3V6N2F6TlNJ?=
 =?utf-8?B?cGI2QVlkQmdTdHpiMWYvTGZGVWNJQVRRWHYxRHdNbWFzTGRMcUZpaDNCNXB3?=
 =?utf-8?B?cXZGdDR4bktTdzNTTXprbTc3dnVrcUlVOVR6dU5TNWsrM2RkVWpaY1hHdXMw?=
 =?utf-8?B?TllEaGxPNkFuSUkrZlhpRXlQa2NmSUhiNWJOZnBiem12bzB3OGFsRk9uWGJk?=
 =?utf-8?B?VmJla1lKelc1TGFKU3NJRUtaNWhQKzhhSUlXNm1MTTVDVkJMTjVSaG9kQkN5?=
 =?utf-8?B?Y01vWGJRRmwzRDdUc0szK3d2c3F5VVUwWW93YWM4VGJPUFJaWFZVTHc1VnFV?=
 =?utf-8?B?RG5YMHNranhGa2xNR0pQZUVmaGw0R1cvNC80K1NoTFdhdWxSSmNITVdUT0JX?=
 =?utf-8?B?S2Erb1hHL2s3MHBybUJQL2xSV3Z4SmVxMFJoN3FMelk4L3ZUSE4zR2psTUpU?=
 =?utf-8?B?QThHaWkzR1RSbnp0ODVYSFh5Ync4Q2RwQ0wxZDhrS3JsMXU3UmxxV3lvR1B2?=
 =?utf-8?B?bXNDQmd1OUJJL1V6K3NMY3p3a1pCNFFWcFd5cEVyaXNaUUFrOElBcEdSckk0?=
 =?utf-8?B?eCsvNkhKUk52Ty9ySlpobFhCdFczUU1rZVpJUEY2R213QTVzUG0vRnNtZ0I1?=
 =?utf-8?B?dWcvdkZHcXJtbVdSbVpQVjR4SC9ndFlLTTAreUM4RGxXSmZUWStnZXlwZllU?=
 =?utf-8?B?TXBFdGtBOFpTT3NaTWJqd0tJc0dNSTYyMTRHZlhReVM3eDFLZ3NNSVNSTG5y?=
 =?utf-8?B?RktvdXg2cFdyS1RYWGI1cTUzaG9qeGprRHRvTktLY202dkN6T1A0UDFGSXJT?=
 =?utf-8?B?K0E1NEt2a29Sc3B1VDJIZDhZeGRBcmdjYWtNSVo2bGt4ZXBzSUpVWjNkUUdQ?=
 =?utf-8?B?Vk5vcEs1UkQ1Rlk2bk9CWDdEU0VUQ1dZZmIvTUhQNm9IQ0ROU3YzOW5rYXQ1?=
 =?utf-8?B?UU1QdG9tNk9Yei82MDA1WGV1c054cWprR0ZGckpMcDR4MkNmWU42WVpnZEFY?=
 =?utf-8?B?SEtCSE56eXk3Z3ZjRWlHN2lRNXA4TDBsTFc3WWpidGFRRTFtK2pkY0ZlcjBW?=
 =?utf-8?B?UnNqUm1KQ0FUSnR5Z3F4eERNQ2tsUDdkaDZrRTJYTFNDRDdMNUJzZDFocTZ2?=
 =?utf-8?B?QjRkZ0ZadzUrZGNBL2tUQ3FGaGxUQkYzdUJyS3VIN2ZPdGkxbGp5Z1dyS3Vk?=
 =?utf-8?B?aGQ0Vk9BVmRlZTNMcXFMT0RiOGxqM1U1Z0l4WVJXeitRMFdUUkVQa3crMjBq?=
 =?utf-8?B?RENFa0traHQ5ZmZHS3huRVNyVmpUNmtLUHhBSlE1c0JlVy8wUTBTcmpNWVBp?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b5a531-52e7-47a9-0a23-08db57eba0fe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 22:02:53.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSYZiLHrNyvS6+1W+w/0WaoaRF94P1y+2T1hBoAVl3NHiFr9x8LvNaOV5y0mENJySCz/ZQRn7Bhjk7aRN2oNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6653
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fail xe_device_create() if wq
 allocation fails
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

Quoting Gustavo Sousa (2023-05-18 17:45:04-03:00)
>Quoting Gustavo Sousa (2023-05-18 17:15:00-03:00)
>>Let's make sure we give the driver a valid workqueue.
>>
>>While at it, also make sure to call destroy_workqueue() only if the
>>workqueue is a valid one. That is necessary because xe_device_destroy()
>>is indirectly called as part of the cleanup process of a failed
>>xe_device_create().
>
>Hm... Just realized that xe_device_destroy() is not called in this case, b=
ecause
>we goto err_put, which skips the call to drmm_add_action_or_reset().
>
>And I think I have found an issue with this: shouldn't
>drmm_add_action_or_reset() (or rather drmm_add_action() in this case) be t=
he
>first thing we do after calling devm_drm_dev_alloc()? Otherwise, if anythi=
ng
>fails in and we goto err_put, no cleanup is actually done.
>

Addressing this in [1]. This patch is incorporated in that new series.

[1] https://patchwork.freedesktop.org/series/117971/.

--
Gustavo Sousa
