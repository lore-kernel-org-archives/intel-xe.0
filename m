Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A5C38142
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 18:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4F610E385;
	Tue, 31 Jan 2023 18:48:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952310E389
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675190898; x=1706726898;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UcpUzZkhxcDTzVb39GwwaKfVpi9IeWoqj6T9SNPlpyk=;
 b=I/FuL8hby4yd7Px/1vvkiSG4k8zo9FSp2u5XT0mYWGJZr4gOEBST81oI
 sHtl3hxlAtbXBohIua6LyTCy28if6vKeR+s0reugMB0MDp0M0aoZlrvk+
 kS/yIgqFTUfQBOPU5fSTiUQytzzOFSGXilNi2+Ggffj3WDNp61hkV5T45
 wO1iP4e5TwtBrio5zobSXACtAScmJlyobw8QEg49CpbSIjezh4ePi9/ch
 ICIXGdMmjjiLAp2ASNvWOwwOdsPLtdFiqLcoOqps2lsKryi40xNfgZAM+
 OJcVBcOl45S8V1p7jW8nnBqoTG8ZSpzZr56OaXE7rCYt6lphOfG5KJYpO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355251051"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="355251051"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 10:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="773093606"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="773093606"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 10:48:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 10:48:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 10:48:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 10:48:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 10:48:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJzJZ2EvYHJgyZLBhx9TZbTvkWT8MqPqTRlaA251LcHztPsap3UPpE6z+lZinntJ7EbdDoDUCn+fu9QFblsPU41nBFH/iMRuXP+Fw/pb0A/k43mFjoY/YR6vgVZs1Yl3IQkxciqaAKgEZwnx/XqVOgCanp5FmPVG6SSnmOVdNfcKpl+So6CJMdIgVRjhNliSL9NM78DsmjghaOk9w6TlQL/cg/rbbq4Lyq1LY92kJAj7AYO42GNrushD+1p4/N0jT5hfm5kavz88ztoEGKOb0vuc6k4YYMQkqo3wd/KJT4Rfe8WAcLO9YF6/fGXkoYGDX+UVnwzM4oaLfgpCK6cfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9r9vhg/Fsk861L8Gx6Lv3mpiPHjZOeUszafecXIciM=;
 b=hJRqb3AoXtzEtBBFw2ZBJy3bvzPq8iDvo6dc3s2kcCp1qarpOGL2R7i2RSigh/L8fq4sLVAoHXB9rMBWmHyJuQBSKgUOqR1ziZhLIU6feHXxbrhVALef408kY1F+iHhcVR1LIATvlBTudQW9d4aZJoWAn0LzdzQsmbJUvCeksRhgn6R1WS/gmXTg0pfNXGl5zsGUXukZ2T073a4Y+Ap0loGJ1eC7Ty4xLLrGZ36e17YpdHwMqcaRAXLWmM+3nyymDovtLhItncA0y0tuHOD+kmXQNsO3Pfo5iZgUAwhsRLdjv8Ei80iU/on5HpBcmuoTigUl+aU3iAxZHkJ+BLKD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Tue, 31 Jan
 2023 18:48:13 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 18:48:13 +0000
Date: Tue, 31 Jan 2023 13:48:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <philippe.lecluse@intel.com>,
 <mchehab@kernel.org>
Message-ID: <Y9liaEpzSpXF6kkm@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112222538.2000142-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2baeff-8ab1-4cfa-6238-08db03bbb51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dMXHvMM8SXi+zlNqsgVLXqGbThmiOQlgl6XeKR2GqaJknTNubZ9S+Fzfr7JlRT8ywJUg5p/HnUJX144G63473qZuwZawJa4tCz10tjcvGG4KfDlI6k+2mMeIMe3dHvOqBjSWjAPewRjFX8Nut0ArA9T5Li5xZXNsezrcioBEfPpdEV8zzH9pLwcxvakY9hWsh/UOjLTd/7CmnOJgwS8t9kvtx8g4bE6FDAr0csrcpMk0VtebtJTHlmZPhtM1ajviL38jRfqOuTF3uWjIeOSzhkFrg33q0hDkHmAEc9CysJD11RPdAFDkuv2xn61eKcbQCBu4PC2g2m1lp+DPBckp3hdtLQBnbClHBZnA3P7AhGzxCB3DDyXxGPXNJCPQG3dvtU+yLAlXFlvZPg3Vucd68dCjOWnlPsDfiMcuGxyz8jR5PXnCNh1OdgubwL03TarqiYlajgEE7D3HesJt8E0rjUwFU5BLePmQV8rl+m7xENvMv3a0ZGKpJgswOLKOXqF1Bk4sihllRMXbMlhrbkV5XpiZ91FPcSmLfizbPGc4y3xWB8fMVzsaDOoshdD5L3dh3k8tpMcLW+fEdiAaxlcXnnFl5QAnxWK4PX6don/z/UUS9D6dclKRap3ef2+BVuWp/45zeh8aoNvVm2EsTv6kQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199018)(478600001)(6512007)(8936002)(186003)(66574015)(6666004)(2906002)(26005)(6506007)(2616005)(6486002)(44832011)(86362001)(8676002)(83380400001)(4326008)(5660300002)(82960400001)(316002)(38100700002)(41300700001)(66556008)(66476007)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WfE4f1v3sCb/lLerbDK1vAao2fTzTucqnKW+kmZyaaW5s1V0CQVbo3Gr9t?=
 =?iso-8859-1?Q?EAnMYmJwffkXu0BqP3ODUNXRYrwpxWL2SY2cvITeSCr433a2MqPNSeZ6eE?=
 =?iso-8859-1?Q?YNnJNQnUAT4MwOAd3e4bnyHaiqI1P/uc1K+fxjR+f+7ct6QGvWuGKloPlr?=
 =?iso-8859-1?Q?MYmH8ktb/mNunpCj8KLwNU+yLbcZupQGMFUU1oqp8GBaIPrSdounWe4BkS?=
 =?iso-8859-1?Q?wu4N6hkBse5/qg3I/qsp91aKkT5df3o9x+7j416215zS97efhaS1g1ESh5?=
 =?iso-8859-1?Q?pvw0mjS82EzDcIjh1Iq3RUpMcCLijb3F1+XlqRvAHRXvlaDY++2jUAQjH/?=
 =?iso-8859-1?Q?8kMGHxbmWezZfyqx5ZkKhusvob+pMsMdWKNXG4R/YW1MhaRN/8a2RmwNDG?=
 =?iso-8859-1?Q?1kgOnMH1/utFBMEBGb6E+ltFQypLUWLzNkmx7K4nZ+hKzRGfLn4Xv/yL2+?=
 =?iso-8859-1?Q?gdpcbN8jrMQlK4MsYKIXbO2AoQvIQqXq06Z9c7nmVbqub6ZHvfQuIlGz3I?=
 =?iso-8859-1?Q?xJEkKjyFo1qKZ8ZcitbW+IUOoZfQxFnzfsNmWk8N+GuN7a9JEhniBbx2tT?=
 =?iso-8859-1?Q?0xFswh2hcepIDsvn84Zk/l6MGxZYolBs+Yul0Ep1NPJ+6DF2flcGF3u9oj?=
 =?iso-8859-1?Q?cmbiu7kl5dbSi5AtiL09Re6z6C3MMn3PtUAC0L6SoJqTedrEEEbWnOHIkm?=
 =?iso-8859-1?Q?LVR924YATXQOx1S8znlFRpX/EyQdf7+PrtJdutMF2akj5iv38y5x4vm8Z2?=
 =?iso-8859-1?Q?RGKPXtq7E6WEt26oz4ag2ghCs4QrUXyQ30181u6vwNCL4jPpUWhxL3bM8d?=
 =?iso-8859-1?Q?xLTw9CWQNc4Cc/vd4CebmtxwqpPKfoioshGB8SzOqJpc3wSJMXKNY+uniJ?=
 =?iso-8859-1?Q?1p9aWz0iSfbQNObMuGAYaY2P1BlnSdrVPid9QO3nFELRlTwQ6JmGZNs11R?=
 =?iso-8859-1?Q?kAUoqJUhWjeQZc4jI52UTC6H2lmwFoFWbH5iL9v68UwIPtvggNSGTBqR9L?=
 =?iso-8859-1?Q?cK6Iq4wWmbX7ybxAJZtrMDaQ393Sroj77WAeXO7feJ0fob11fZETFGOaQI?=
 =?iso-8859-1?Q?Qh2PPKE/IYVCay0fqCPr3EuU4fUDiLW13bI+zAEqVcEOu5YmZ0msv6nnO6?=
 =?iso-8859-1?Q?jyjOkQyEoGRsM3tUnmo6odMngcdgV8CX0+G87RodzUqsL9hukVHO10Xm/5?=
 =?iso-8859-1?Q?D4kcQxdSxGyhlhp4MpIV1ZvZ1NT+Aa1nwCLS4jKwENpsPajKy0X1wZWUP/?=
 =?iso-8859-1?Q?KEOLSBqFFtE52RzyE8O0gnJOOyxUiCVONe5RshgQ54VlA2XlkowgwF4IEl?=
 =?iso-8859-1?Q?zD5aZ4F1fo0ekkNMVT4R0urZM1Paj+70wP48n11j6jddgLdWATIhm8olFa?=
 =?iso-8859-1?Q?808ru/Ybsj+J/5hRsOUGUoQs8IO3eQl3jQTGmGUDPJjs/Xz8wkxJMpeNkF?=
 =?iso-8859-1?Q?7B+ezJUAnOkQQbharZFLVrJQaqzoBj9tEHYxjpNbVl79Vj6er+CXpzwB6s?=
 =?iso-8859-1?Q?ld5ZTnYFfgLMBUiXUU2uqFNSPXuU0rSPGuV7bjFtj6hXuKj/wGt/VeqPyQ?=
 =?iso-8859-1?Q?FqTpzn1e3rTPEhP4BBm5ShOgFhN+55MIZfY2w3T1eDEiZGN5TyYIkxQiR/?=
 =?iso-8859-1?Q?h5vNRxluiftsdCX6nyW+4ErlzJ+57x8oSeHvhSmQ0uDHDXPXDw7yoYIg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2baeff-8ab1-4cfa-6238-08db03bbb51b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 18:48:13.7340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVSiogpBlHadrBvPx4T5cdHUUrFt6LPb0ZR8ARbbVpbpvziIbFKuBYBX40fXjKxV4gEGbR0HO8QqhooLS2FDqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/37] drm/msm: Fix compile error
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

On Thu, Jan 12, 2023 at 05:25:02PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> When changing the DRM scheduler from a kthread to a work queue the MSM
> driver was not updated to reflect this change. Fix this.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thomas, may I convert your gitlab approvals in reviewed-bys,
or do you want to go patch by patch that you have approved
in gitlab and drop individual reviewed-bys here in the ml?

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 628806423f7d..37cf74a2cbc3 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -660,7 +660,7 @@ static void suspend_scheduler(struct msm_gpu *gpu)
>  	 */
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_park(sched->thread);
> +		drm_sched_run_wq_stop(sched);
>  	}
>  }
>  
> @@ -670,7 +670,7 @@ static void resume_scheduler(struct msm_gpu *gpu)
>  
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_unpark(sched->thread);
> +		drm_sched_run_wq_start(sched);
>  	}
>  }
>  
> -- 
> 2.38.1
> 
