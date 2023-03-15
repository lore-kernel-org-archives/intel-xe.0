Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4795BC7618B
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0E710E941;
	Wed, 15 Mar 2023 15:45:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023310E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678895136; x=1710431136;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=We+IvIjZ7h2wDo3QecszuKg7qenfAJQ2TTmr+VBwOlc=;
 b=NuAi5xerLYfXQutk5D0JbgvPIbqa8pItHryx5V338TTGNqvy1Lv5p2BF
 t/QkKUEs4ocj3olkvDNAmfvJgjx8/+J5mmq4vwhBpnKBvMvREXvFz43Ot
 e6+EVIBRxQT+sH7fP8V85bhGRa2ej4MQQ1/89KlXK8r5yqKY6G05mPnOd
 wSzuytABiw12FhYQj122jKCRROKR1ctrKnRyZEyH5kf79U5li9E262p3s
 UXUqbomqvLupm5VQf4Jwl3ozT3TdDbfR0/iHcuk7YKN7hwKUMXa+Krhie
 NJmY4fmvWfEdE0ZmNuyAJNbhxBBCF+iRFELNgYT1uPBRjZUOVe7tWyHZm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="326098844"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="326098844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="789846900"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="789846900"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 08:45:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 08:45:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 08:45:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 08:45:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDrr5XQq6b57k+p2ESb3qTQuDiaW5ALsGS3MLvViZNhxocM3r6zj2N87LbSZAomKmRAZ9t509Ccgz06UtCs8D4YfQVYfkugmwc4aSF2P6/ogbh4YMahVUlGABNpZmRDwm6XoYBqm4+tgaEZsFykqcKVWOx+EP4RoFJgStnNJPxfeAIs/VJ7AtkoTA31v+8xwHnWK3eej3qwQ+cQQawXvBDXFcn5NJb1//GQgjX7NafpElph2KpuO93iTZAAJdDDjThymD51lGTTbXrLUMD6OvOJhpwtXltbNAPTFArQV2yW+x1YrGO+QaTohyTqxYBAUSRICxPOAnEanuNI8Uz2dJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq6c6RSysXASFi5dvqdV75zjDt1SqLrAKhfE01cmvG4=;
 b=bTi6xgEEP3WZ9UIXWoyXtsdGcBVWED0YlUmcnbFMqeCk/czVFnKqlcnAGeW6mclDwZka0B/WGoMaHjLajEck6LYpqfVeQKKklQkvZL+nkqWCHaXGAi07aKtwnG1JEAle0+Js342U+cTILB0rfVFrtSTwRa9k/Bo2nSN1OK1SKF2JGB/zYrRdHOqsK1wLvrXUPkskeFzUY+ZEGJatVExjWguqBvV8ZIGvUQT/a7Yso5ZkdJRmqmIYwQeH5bc4AW2YpUVIsIqYuhHPnUGC6J3F8zAntT5uLvSWx18tx3EI8XUNkZ/F3lcBUoNBQAtPF9GKjq/xotlo7GYauQDZmbaksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 15:45:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Wed, 15 Mar 2023
 15:45:31 +0000
Date: Wed, 15 Mar 2023 15:44:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBHn90RnIIg+iXjv@DUT025-TGLU.fm.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313204519.158888-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:a03:167::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: ada4dbde-d1bf-4136-6a85-08db256c4ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJH73RAaScv+L+hh7GoIplbaOzUTFgKx2TnmWngHlRKv2d6pm6/+3qvTn1vd0TxOXvBSc29gFlxtDCMNMBE4NUJk7sI4CnOpxRuYmdrWfXnoyKdhby5ZguOORkifnKdRa8IDFN4Mr8rVtJXigYN7Rxrm4KlhR1LOn1kGlGQNchaOCzAuVB1Ip53J8Zzf8WO8IzOCwj56+RME5jKGKoXefnHSXw/Jx9wEx97LM8WPI2vhgfvdqZonI4aS0iS8/uzL8j5OANTBxIO3UXql4CIWM5oRzJ6aRfATwQ3/o8lXYPzKDAbI1fkBqzmSC/uTvQMOCOPNKsdoUNL8/TKMhPxFuB8Fnt/flFzAA3iWuOZ9vfyc7XWPx+3GKDtTwEdf83byeyAx+Qp2MYOS1MqjKJmE4raWwcCx9At99dXXAUzAtBdw0AUOJyJGFXf6RzaquA+nBaz6hqCs39JySk5sT85oZZkf+btKoiViDltmn7KS+LfiYJglfijhDgWLzauQNkc45o/iKAgGCXpgfD1Vmbh10IK1AP0E8oTUFtdug3Vu8+FEKdJ+hpkIsJNqUbIEXTUWhe+5gP7nZ3I94gMQnRkGM47IMqVzZsqj8gFLtLhRsD+VRxutf7h9NAA1kbX6vn7ZHnH6BA9l1+EqD0L6lBDKdyWu5spzc4N5psUIDXw5ylR2f94VclEa3kDTU4gMaZ5y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199018)(86362001)(38100700002)(82960400001)(2906002)(41300700001)(44832011)(5660300002)(8936002)(4744005)(4326008)(66574015)(26005)(186003)(6512007)(6506007)(83380400001)(316002)(66556008)(8676002)(6486002)(66476007)(6666004)(6916009)(66946007)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n+sfKvP783EEEUiPPVy38I2no7xhY/CA/H34rzfyBZqZhHD82pEgvxjC69?=
 =?iso-8859-1?Q?lAR/UXJz+++RH+GPps5bra/ffDmD45hSBxF3modDRxJJjTwXy5tt6ijmYC?=
 =?iso-8859-1?Q?HQwNL8H8sKQMG0LNEHnKeOekB1OHh8vqztU+888nJlZSgRTT7h/EQTwoXF?=
 =?iso-8859-1?Q?YuFXaejHkn9q97UqaH14lLjKtDdNUgBl+soF6p/pU/89vqDnuXOc5rXOnN?=
 =?iso-8859-1?Q?N+4frZlncUx2MSA7n0gP1jUi4aog21bEqRygv00CK+0sL49iGKrHQ+VHIo?=
 =?iso-8859-1?Q?rAhsPk8l6F4Teku7Ah2jMxCrhiwXPbU7Z7Xc5jWnePV5dm+WC/RYydTuNA?=
 =?iso-8859-1?Q?y752qRBqdlABU4P4domfX5TNruNqyAOIjizJXtJc5AgWdyegFsXzlQ3lU2?=
 =?iso-8859-1?Q?S9WxyR4lkqfzxkkEalfW8+Phy2xedme8dzCq5I6so7bxbP7/uLnShMMUVT?=
 =?iso-8859-1?Q?7IgrFi1cPVbv+id5opJgyPKgnE8Sc6CbVSaO+z30RRvGv1xy4uTcLH56Kt?=
 =?iso-8859-1?Q?nUe7P9tYCyRL9FtYaLQ/JFbfUqSMVPPuAXF24AVdrrSWLZLlZxhRj0SnYw?=
 =?iso-8859-1?Q?mRgLssHIULse79UDD5lbFVsd19ZZfDe4mp9Pku5MJe9mISE3rJso1DL9O1?=
 =?iso-8859-1?Q?WohEMc5sX3ipsaId3a1uFD2xcvO8/yxqG25qvgX51wb37LNXJrzox/aIn+?=
 =?iso-8859-1?Q?YSsWuMufQf5NLIUiIqky3+wB/tLmeRw4CCppAOw1/paBU7MRHdE5bXt9qa?=
 =?iso-8859-1?Q?fpE2KFFXQohSpyXDbFQ+0uJsS+kv/kpU/EzILlopjvsINsTySBU4lvxzBy?=
 =?iso-8859-1?Q?0mRzgq+woFJESF7qdfXcb5PUc3Rgv05yZb2KSbOdAvpFsM09kyn65T7uVR?=
 =?iso-8859-1?Q?NXpHXjot0ulwdpp6Jwg4JbLrDmQi98Aq4iAj5mLIQK2AsVQPs1lc9JAxY2?=
 =?iso-8859-1?Q?x4IoHAEkZDRNir0zet0Hsohe/SAGr4E9NZZx+sPjn0JQjr8LzbrU6QC/wE?=
 =?iso-8859-1?Q?o2u2oNv+WkMMKmsuMO5QHuA8g6nIMSAFYUvidAeR2NuJzaOLkU59WE+sf0?=
 =?iso-8859-1?Q?8FRfHEePe4fakiJQdCbmiMUGpuOH+Nm7IYUUM77uigAT2yk55V1b2kNDbY?=
 =?iso-8859-1?Q?z9Am0GmsH1HTh0Cpyh0EC8MfzIfilK1EaYJrU2yL9aNFT+ZA74TuT5g4dC?=
 =?iso-8859-1?Q?+JH+W6d/qNg3nCrTFh2D+wydc9cIIi/5Ib1WUOSNH8WSal6rpq6S6fYbef?=
 =?iso-8859-1?Q?21Qv1YLk1v40nGvrqQEQSk1HZniy8aHZmii15np9gynaTZRJrWtjsVAWRD?=
 =?iso-8859-1?Q?l2Zlym9R0hJIby8kV9ZRtfyga2LU8XhxISgVmA/QrHUxuZRMuq4hKhqpmE?=
 =?iso-8859-1?Q?L09voX7ibTKQmusCBvUdPXHTZn3ubDt6GS8+thfT3jaSgA7f7BR5U9CZwZ?=
 =?iso-8859-1?Q?aHS7qs9Aniy7ZW5Nr8IiRkAOPmLiMiypsckflIeUiGVZOdMnHK2wYbjZgw?=
 =?iso-8859-1?Q?axw5Jomdgg/OzylC3dpMGCsgMSvxFyzjfE0zQbiTdeMuMdwiopQHcFs2Cf?=
 =?iso-8859-1?Q?dpptx8kE9Ou3IBGD3h+L1wjTuWEOJw0ntlVqy3Wk+A5owpo8NdrbCK/cWm?=
 =?iso-8859-1?Q?L85UAAsn6cjNMDKDhA6j2Ahhkyjc59uKq0aMKkS4gFfFmBesUCoW1qyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ada4dbde-d1bf-4136-6a85-08db256c4ea7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 15:45:31.1222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MG9OEt36inDySHkiEyQmF5DDTdMvdxgWYyDvRaXXTAhD5rGpcYY/uZ2okseCIjywKTDLt3Iz5ufI0senCA/cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Use a small negative initial
 seqno
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 09:45:18PM +0100, Thomas Hellström wrote:
> Causes an early 32-bit wrap and may thus help CI catch wrapping errors
> that may otherwise not show early enough.
> 

Again let's use 64 bit seqno to wrap impossible in practice. That being said,
not trying to hold up this patch though.

Matt

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_fence.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> index 523c2611ef5d..cfe5fd603787 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> @@ -8,7 +8,8 @@
>  
>  #include "xe_hw_fence_types.h"
>  
> -#define XE_FENCE_INITIAL_SEQNO 1
> +/* Cause an early wrap to catch wrapping errors */
> +#define XE_FENCE_INITIAL_SEQNO (-127)
>  
>  int xe_hw_fence_module_init(void);
>  void xe_hw_fence_module_exit(void);
> -- 
> 2.39.2
> 
