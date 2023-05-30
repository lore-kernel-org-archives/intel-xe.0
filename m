Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBEEC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 12:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0325410E059;
	Tue, 30 May 2023 12:34:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064510E054
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685450041; x=1716986041;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=b1SYPictQL0TTf6EfVcJ/5u3bICQ3tA9DFttU7xCFGo=;
 b=SOznZOscd5gYDAroXMyR1+H1HXA2H1byxRO4IA7y18C4cRXQbvdJa1MP
 8Tk7rs3wbp+3Yo5f9hEHgu9wPL8mS00S8TRsAUmxz6simAyX/VHE6Wx5k
 g+jC9DLyUmNF1mOwDWjJ3LfBTrrlE99h9cSvXkGKZYhKq52nazOcLtMfk
 tVuBcbfpHLKKg5AQyDwPvRO2ySMNdzqTUrT8iIUnbajs/pMDbC/dSRQnp
 Xn3IebtJCG7lfjVAcA0fwcIJ/fbqd6+0d0RVkZfpxzbsraWZSLnyaHhyX
 Of8fOmhzy3sbVdUDoNiyJeY0fRK0mpBDIxZ3g9OC0L2dW3WcZsyYh2Zcz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="353740849"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="353740849"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 05:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880737633"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="880737633"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 30 May 2023 05:34:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 05:33:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 05:33:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 05:33:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 05:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT/RCoFbVKs2P/AOo7cPRwTBj/0xz32yw/eBa8wxatSyhyoIVaUsMMcbtro5pwCnKCgAm8dXgci/Dy+wgUJ4WJvOrgcQlWXh524E0eE//PLoSsZvQnBxnqlSMvgUIUM6S7OEB4hz91kQRb7AH+TEbfDc7WMGUdK3gT8gzR/Glmvr3B1YTxJEbOmHfBrYxwlFWFJCRKOyrcWFX0hjAhTtU2GwNb/4+noOX+A+hqp3qK8Y0xXkEQbYcDP7xdSmx/FUwU0nINrs4wAP2a54ym0sm7Oqp4sVinmDUajZ0TLO9i7rXRKXn24MeBrChA+ns32aC4gZq9exMvmblKu5kwMCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1SYPictQL0TTf6EfVcJ/5u3bICQ3tA9DFttU7xCFGo=;
 b=DqtakVilpf7iDrkxamgPvGKBDDZfjiqBGjgsnJVVHjlefkLAfMOYUH2wyD6g10kvSHNA+5VxjdBEEPZFi3vz7iql09HnPoVSWRsIq5L61F+1ANT7aAkJQIt1WnhwaXNbkp6kalyq8O9gf2oVenhwLJdVckl8bH7/xyfOcf4Cjaa7mNigN3p8X+OuZ6w5kODxYRIvDCEMMhU2Azpt92bBdaOojhAGvWVuUdE4vIxSavRG2QLjK/1WZicwIKmr7NxSyeEJT68JB96cAEzk54lP5IOY1YO/DEePCWJO45n6cvfjVUakswS1NwuSmbq5LSU/1xGBS6+dQ53PWMsRcWq49A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Tue, 30 May 2023 12:33:54 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 12:33:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <53as2nbkzwgnyv7n3kbbl5rlzwquiuqazks4wkof3hm3rsgzon@3l7vhj7w4hrv>
References: <20230529211914.659551-1-gustavo.sousa@intel.com>
 <20230529211914.659551-2-gustavo.sousa@intel.com>
 <53as2nbkzwgnyv7n3kbbl5rlzwquiuqazks4wkof3hm3rsgzon@3l7vhj7w4hrv>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 30 May 2023 09:33:48 -0300
Message-ID: <168545002829.51912.8918875124371388312@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc19966-b427-4d54-3f52-08db610a2182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFuTmrRqBMkgzQy27X8Gx72FDKod+HisxhSO74ha4uXHrB05JRgbvGONI/tFcKu5Nv9W4+6DziQfCLp4+tJg/bt9slGy/CvXpiOQSFTOPtmUzA1SlboppwpH/LRC+vxTgVfnliLHPMjviL5d+la4qosss7oYUlJv5911lS1messT9MEvpOR9nGMRt06GKP+WI0wHw1TMVBFS/eBBqtE0u5OVKmtWI2QihYr9QjmaDruldMMkB6xRAmLPg5OrsuCnm1ciUNhe4sq4aQHE8ksZ/AyCXB/RfsSuS2MOws/6HnKbX/Ja24ftHYyVEudHEFR4DtwYrvdDhgnrPVnVtXi/MJuDZOPHRnyx0fKKj02x7SCvSFnxVqWpXZSllz2nC5iRcN4Osfwy4QXwuXTc3/RB6Oc5odZbG5/hopjzNRGe4EO7j9ghXr1A6pdOZWRI2gNBop9V0PnG+qfYhpNxo0vvJrIVvO3jBcvz6S3llbrc7V7XDmCua8erwR0WOaiS/flwBJxkYHAgJDhRYTf3H/hG5oov9S2gwojuLDEbSEhPPJJBREFaxFaptO211KBrMmon
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(186003)(38100700002)(41300700001)(6506007)(6512007)(9686003)(26005)(6486002)(6666004)(478600001)(82960400001)(66476007)(66556008)(66946007)(4326008)(6636002)(316002)(5660300002)(6862004)(8676002)(8936002)(44832011)(2906002)(4744005)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alFaakZ2T2Y1SlFEVVo2Y3ZrSUpkYTBidjRadllyeFk4M0Q1VzZGNVNqN0Ny?=
 =?utf-8?B?T3VxRVNEb05xaXpSSEE4L0U2SHppdEdLTzVKQU5rMTVGbndqT0tWZHhleDdp?=
 =?utf-8?B?TG9uVzJCRDRjRGc0NHlhOUYxYXJIZ3pLQXY1YWRyT0FidldlSlUyM1oxUTJY?=
 =?utf-8?B?MlpEbUFiR210VUFCb0FxZjBXRDNkV2poMUh1Zk9KWTlCcU5TMFAyNXorQ0RY?=
 =?utf-8?B?N2I3MVhUdEJZT0x6WlR6SzRhT2dOeE5zMXF5NytHSzFlN2dwNlRSZlJoZXhW?=
 =?utf-8?B?NEY4UnNuckZWanJ6dmIzb2VRMi9DWnJ6eXRKd0RjNkJHYU1oMittV2ZLdldl?=
 =?utf-8?B?bVV0Y0p6aWczSThuNmdGUUh1S3VaUjV4dTZwcVgrTVNUUGNYaU1zWGh0aS9K?=
 =?utf-8?B?aVJZbzJWamZlVXZKQ3V1NC8wNm5sekZib0Q4c2pUdEJQL01idzRCZDZaS1Zm?=
 =?utf-8?B?R3ZweVRUbjZ3bjJYUlBkMFRYYXhoemR4dWpEMExrR2xFc3pQVmJGVE9Wa0dB?=
 =?utf-8?B?QmdzRmNVT01MRzd6Y3Yrc2ZCTmVCTmkzeTJ6VGlZWnBIaHNBR1R4Ujc1QXB6?=
 =?utf-8?B?M1p2aTFRdjJRT0RsVHdlcmE1N25SeEVyazlPTmhVMnh0OTR5eG1hdHZyMHJi?=
 =?utf-8?B?b0ZPRmxHZTdjU1JzZ1FweERuZFV6REl4VTJRTVhtREl3ajlHZTlJNUZMc2pM?=
 =?utf-8?B?bllSd2NWZnlQV1JLUWI1cTRjSVIzRW9zSVJGSWQvaFo0bGR2cUJrSzgwTGxr?=
 =?utf-8?B?czF1eFNMaXRQMjlIbmdPWW1IcTRBM0dOWTlGU0JoTFBrKy9FQVlBUi9XbVVW?=
 =?utf-8?B?YkJzK1E3SlZRWEpRYUVLM3JackxpdXNEZ0VaSFYwOWo5azhIbTB0UWd3MkJO?=
 =?utf-8?B?NDNSQVZZNHlVMnRkZG5XTGFVd3Q1MWFMazF3K3l5eVoyWGFhT1FYeWpzeWxP?=
 =?utf-8?B?eVlqQXBoOE1URURNR3crR21UdGdBUE9tRVFoSHlMWVVQNTBrQklBQ1l4SmpP?=
 =?utf-8?B?QktCNEg0NWVYV0N1bE8xSjV1bUpGemtGT2tjaStDa0NXN0c4Y0tlQm5ScXVC?=
 =?utf-8?B?ZHZlaEpuL3JzT3Y2WVNIdkFTTy9EY3dDaFBFM1duNDh2VkcwTGJBYytNOXls?=
 =?utf-8?B?bFdjT3ROanVWazUxRGprTlRjYUJOcXNGckZDNjVrMkVxb1pWb2tlSU94MEtV?=
 =?utf-8?B?Y0M1WGlvVTJXM2FIcEZTaklrd2JkYjVPTSt2eTlxNGpaallPRXpvZFdxME9o?=
 =?utf-8?B?akVHQ01TUDl4UXM1clFHdWxURUFmYjRMbld2NmtoUzRlS3daVW9xS3R2QXBP?=
 =?utf-8?B?ekViRnhpVnZqZGRmeDlwQmhhTHp4aDRLSkNvTlkxVGR2ZU1RMGEvQ2N3R0lE?=
 =?utf-8?B?WWVPWFp2RmdKaVk3UEtQNDNpY0pqN2xJNW5JUmdyT1MvVWdqaEdEZmhBOGx5?=
 =?utf-8?B?R1FFMHFEclAxeG8yWjZ4dzVhY0Z4Tld3UXByTnNvazBSdnVteVVtM0lRS2JE?=
 =?utf-8?B?WXFROUVQZlNaYXJUTEExZHRvRDMxMUh3SlFha29wSlFld0MzZzY2RmtYRUdv?=
 =?utf-8?B?bzZUcDNXWTVQYkN2TFIrcnljOHByVE90UjRVNWJHTWcwUGQwZ0JmUmZjU0tS?=
 =?utf-8?B?SzhvRGs5THFuMERmTXBDcG1vTjBEbGM0SG5OYUFmNnJDN3NEdURGS3Rlc2dU?=
 =?utf-8?B?OEhzQng5MVUrOWIyUlhFNXh0dFVwdk1HVk1SbjlEQzk1K3paMVY1aWw5a0d1?=
 =?utf-8?B?aWEyQ1kxNW55SnFtOCs3REtLS2F5OVhGVnpaUDNHYWZNWDNCb29kRGtXaDlB?=
 =?utf-8?B?SzNLZFFLTC9PRWh1UktJN21aNUJtSmlKVkx5VWVMTVBBeDFlTUhROUVCWEpy?=
 =?utf-8?B?SHdTaWNYU3RRbWl6SDVja3RvNU1NNmJTT2VIYm1LMVpYWjJVN2MwZ05UL1pM?=
 =?utf-8?B?cTRQVE1uS2hEU25wOXFLT2M1bTN0YkhvdWNpblR3UkF0ZlBqMnFaNzVVWmdh?=
 =?utf-8?B?cU55S3c4YnRDaThZNWYxcWJ1RWV5ZS8zYXk4ZjNNSTE5ZWhnMDlTSDRHVFhH?=
 =?utf-8?B?WFNIWVcvVGF2TVU2a1UzZFI2amk0ZGs4Q01ZRVNnWFFPMEk3dmsyWFVUcDlR?=
 =?utf-8?B?dUtWNFAzeEZpdjRhZm5Ra3Q2UTZZaVhiSUdHUXgvejdpVE1Ebk8yelNJRTlX?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc19966-b427-4d54-3f52-08db610a2182
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:33:54.4520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyAyfUa8kDrzdIqcIX2tiTiNSStnXkiMTPHVINoTnWh4usvRmn7AWSbZSuzCVhDXl0JQGvhygisw8lSlwUL1HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe: Add support for OOB
 workarounds
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

Quoting Lucas De Marchi (2023-05-30 01:03:00-03:00)
>On Mon, May 29, 2023 at 06:19:14PM -0300, Gustavo Sousa wrote:
>>Add gitignore entries for generated files from OOB workarounds build.
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>thanks. Not noticing this kind of stuff since lately I'm mainly doing
>out-of-tree builds
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied. Thanks!

--
Gustavo Sousa
