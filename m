Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61813E936F9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 04:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A2310E188;
	Thu,  5 Oct 2023 04:31:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7110E188
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 04:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696480280; x=1728016280;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y/mLAnnZWDtrwvQxZed7iIgo7gogyfS0cbS8XnxArbc=;
 b=Tz0eNPUO7Uenxb2riiA6gn+6CpQjEASIVdXGGHDvzPG4nn0oJSHdUj4x
 dp2jUC6xhBxA0L9Hqp/8jf0hglbj/UsArGI39B+9Lntin5b7WWY1L8l9W
 cyDEbfpvSVZV0rReOVqKeXRo15nPwSoyFpgyiH86eG0NkYbCea3QNafPb
 gWef6GbwylxZT4g6XPLtALRwyTJkp3eBVXZLdb53okjg58Bm4r8p+2d+U
 PPNIjR7NmLKadPZhmYWPs8rz7XVeOSfRi81fHm3Th2wQEI8v8X+86hacP
 6DASzDCYjQ5Mt9peWlIeJmkFGdHHqe1h+dWXEjNMIk+v085MocNyFMaGR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380675770"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="380675770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 21:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728302924"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="728302924"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 21:31:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:31:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 21:31:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 21:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAL6CP5yn20Zes+JmE9jLdBmCmerQSfumsb5bWUSf6JtFKdmThvbVOEPHz80bCLQ2E/WHDYd0y0mnILI7JS2hcB4q67GQFrtER4dgRXA5+44oGHFDPToIxBH/lGam8toF0YQabw1cGnuP+oUu0ihWiqjYG9r4eI5fu1vY1SXcaNjgBEmui7pf59Frw5T0hBcd4wNQfMjOfVfGJ7tdB1ZDtZj0n5wMI8+uF9e05yTRv2wv2Ck9dqq3WnYVdvsS9s6LJiCY8i/FhMPlEqPTNI+tdL0yzREULiFnOFDxvBnLjZ/oqmYbV9zZI7BSLT1e9athmqmGGA1kY2Sk9vw6bjiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phlE/Daz5rZYDoS1GyzKCAx3jA4LpHlGBWw7d1X6AOE=;
 b=dGZXWQCCYEQGi8d/4ja5swhQhwTPfyiUdm+e5eIa1ke59LhDZQ80O1caIzbOnF9dBWBrlxnxFq9kAjH+PApEJBy3FQSMwJ8MxPWJ7wcMerQrtWop9HDOlHB4z4Fv+cbSvpvtTT1KAdkty02oUo1UVi0jFx/XVYlbaI+Xc3DcDrHRyzn+omk6dHp1fONCSn5H0fZ3c/ODEUBR1WCiLm0tadfUEUo4zu/pmxWRKO4gE91z5W+sdpPF+YafSAtpaCxDc8i8A/mofyu0qpk+2zy/tt1wBFOapnj4KCjrvRaX/nmuPJ8TY9CNsgGYGuVNZ7FGCI6nuk2jfPcpBMDfi1nZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 04:30:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 04:30:51 +0000
Date: Wed, 4 Oct 2023 23:29:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <yiyeir6exg26ttr5jcuzth6qpz7e2k3wxxo5hwsqqff44qmm53@l7t3ikixq4yu>
References: <20231004210624.123779-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004210624.123779-1-jose.souza@intel.com>
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7215e9d0-6978-4c30-47cb-08dbc55bdb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0kDhf9zGNjdse7Ex2ch6K3FXLyx8cjIixRVmqQJ24fm7L7bNfNUH28obEggKXH76zIB98hkEEWbuLBMJimlxa2pDBTcS8jSaFs90dlZBIZgMv2N82m7wjhkfh38/qjH9uU5pz1GLw3zfL7wV90nA1V2KfAm6stfWpxWGOxqW8pTZWBGkqsqZCbNpdMVp07HooEt5Eiru1aaLUNPPyepZUgC19PDJ9dyxd09DE+i9ZZlKKtCpTaJScKQ/SZd2b0OVtkGICuV5O9VSxtpn6OOOT0cjNWvk+mtTTy4kDR8WLKh4Nrufz4OK6po1Qk5PFZ613DXGY8UZabs1lY3w6hjB/+8+cfWozxvH1kddqqeyP+gswdKjZkgZRUBKFIKuHGOIgCvbDtCY8I2KY+97+362Fqw7hFwvWYAmVtycLJ1jnX71jREXFtYfjy46pSZaoLYeISPEuyInkqWUVjW/6ns9udxJp8KWo7RW+LycR8aPwA66wTrLb4thsADszXDnyhhXqNemslsW9Rv6cTaoYiTznwwNHeOkvEMRIboiPuHFy+Y14LxMIDoxFtAIpVyI2L8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(6486002)(6506007)(478600001)(9686003)(38100700002)(86362001)(82960400001)(2906002)(6636002)(33716001)(4326008)(66476007)(26005)(83380400001)(107886003)(66556008)(66946007)(8936002)(41300700001)(5660300002)(54906003)(8676002)(6862004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dsud96GiljXmTxJcpg+VRiwhEN6FkfFGAWmOKti8w8FKKTU3esscDxR+YF?=
 =?iso-8859-1?Q?gr81g0AspKbKf5J+6l81wqs0T4Frzl11PmbDAxMbFYedqllYA8+glKpdKH?=
 =?iso-8859-1?Q?gQngvZ5z1I/p8d4xgymDcBn/1qiEBq9d+eCIP7jySP2oW19HCqn+x8db2m?=
 =?iso-8859-1?Q?MjSlv2TnWQuZcN+6cz0DSFk8wmqeJ692aIpB3SpWBkew1bnZkQh09wevmK?=
 =?iso-8859-1?Q?bvRLADxuSvuGJWry6Ow2DhyulzKkXWycwGA+5gkK96rQ38RUkotX3voPPl?=
 =?iso-8859-1?Q?SwIiOZRkCYeYwq03Ax3Lm7LxFoLdYMBDyx8jKjWTiW4h0/dzG4GBPUieEJ?=
 =?iso-8859-1?Q?rfWXpl66TCTtXmtZ+D9MMCqP70sYAlFc1GhbTFwJPBI9dcB7BLZG/mA7aS?=
 =?iso-8859-1?Q?ByHXCXbkhFZ2J39/u56eAumfLrtTGhp3gYPRaUiJOo6JMaCiabMo7brrei?=
 =?iso-8859-1?Q?sKoOvDHn4KUeVlbOkxlf/eWEPjDbRSWweRpvZ4j7vsCVHdMJO7Tvqysz9C?=
 =?iso-8859-1?Q?+ujk0LoTJEvOEhJiZLHgouhjAx6rEQPCFmPcC1GK4DVTQ8b+yMgwWmrpp2?=
 =?iso-8859-1?Q?m0h/TxH5QCAz5esEgzESrrbvIw2XNknXwPKPX/3COwa2e0Tjv8/+8OHFwL?=
 =?iso-8859-1?Q?eG6D6wOJZXM9cSe5mLwuXPCjjGNNre3K++oy8m7emB2Pq128nrhLVcP+Zc?=
 =?iso-8859-1?Q?SkdTUfRLk4J8sbrqd9c36lK7AxM6IPhTdCCHuxFve+YQbAnz+LHcaK7CZ0?=
 =?iso-8859-1?Q?ELfByoos+ieAzdmSA0+uv9aRbGkg7IjjwOOpTH3e8bhbzJm0e7Rgpai/iS?=
 =?iso-8859-1?Q?ZgjIMwBfhWlD+L95QSmH3VDEf/SkwcwWhUXRep96pJ0Wcn1nFp4Ai3XDwP?=
 =?iso-8859-1?Q?1n6OFfm5aFG8Rs7p90Q+jzUyAZ1swA5/TzJSVHh50ozcMoHpRRVS2CI7mJ?=
 =?iso-8859-1?Q?rPvolvYGyDFTplDXz849vI+1/6f/7g1vf3O3l2IhFq9LeWOwDDzRtB9n2y?=
 =?iso-8859-1?Q?lnIOVSOkpSfJSz80oKJMzBPe4pQ9ovkEG+LO0xtNOidF7nZwr5VyVhxs2q?=
 =?iso-8859-1?Q?tAzhz45Jxt/Ul8fcEQvdpedyE0ojHWDxIfH/+jcPCTpuP4vpVL/t1GFTle?=
 =?iso-8859-1?Q?5QuZ55k66+jHPc0VeNt1Ym0RjhTAcaYU8mWlX/3W0iTMdfLctq7sJvYt2g?=
 =?iso-8859-1?Q?LRCx+jw3j+PN1bMUwYoh8KMgUla2pkVdj/CC1Z+khXpEdjD6zzm8gSr86G?=
 =?iso-8859-1?Q?/F2DE+sXH2NP1NvgmYUwipt9fDweuc2TKf3GaH0SSYiVI+zR/xItEz9jef?=
 =?iso-8859-1?Q?ZnHFTYhILK3p2xpxUx40qqLhXZFmHWtWrWCYkI0uExaW2wO1zBSh0bWsCu?=
 =?iso-8859-1?Q?EelRvIY7auC0KwS6Pe7ivPoL6QqexyW7eD9QXOroGmsTVtc2roaZHLfzIc?=
 =?iso-8859-1?Q?aXXtc5CkMkiOZvbvyyzK71MVYDySaMPxObBTwLJ5UyGk+0twrrxesQunp1?=
 =?iso-8859-1?Q?X8veq7iH6sa4gGZPi8JclAC9a1PSbG10nP4efJV4V7/3Td0gMBavh50DYF?=
 =?iso-8859-1?Q?T6JrkGbL54UnVJjjDYrSyfs4eI6Y7ZLMWIuh9l1KixRQYjFoukpRTe43sV?=
 =?iso-8859-1?Q?vfCn1afruZXHkGjvrQeSsPyxMqaxXGnzcW5fp1c0tRt03JojePp0UWfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7215e9d0-6978-4c30-47cb-08dbc55bdb3e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 04:30:51.5999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0mvOW2AzY0nVpGSH++zMjlDWKY0dmTwU6R228Dq7eccoAU33LvyWb4QheuN4c2yShvnTxXhzut04HeaEfb4HZXgtNQ/RdL6yNqCIOlk76c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Allow atomic operations in pages for
 Xe2
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
Cc: Matt
 Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 02:06:24PM -0700, Jose Souza wrote:
>Without this if a atomic operations is executed it causes engine
>memory catastrophic error.
>
>This bit was already being added in the pte_encode_vma() path but not
>in the pde_encode_bo() path.
>
>This fixes at least the 3 failures in piglit sanity and 2 failures in
>crucible.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index ea17d026546cd..6be5d92706932 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1261,6 +1261,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> 	pte |= pte_encode_cache(xe, cache);
> 	pte |= pte_encode_ps(pt_level);
>
>+	if (GRAPHICS_VERx100(xe) >= 20)
>+		pte |= XE_USM_PPGTT_PTE_AE;

I think there's a clash with doing this here and doing it where it was
done in commit 6193a2ba4704 ("drm/xe: set PTE_AE for all platforms supporting it")

There it's adding the flag  in the gpuva.flags which is later added to
the pte. However, in xe_pt_stage_bind() that checks for XE_VMA_ATOMIC_PTE_BIT
is only inside doing that for devmem. I was thinking that I might had screwed it
with my recent refactors, but looking at the log it was always like
that and the fix in the commit above didn't fix it for *all* the
platforms.

Does it fix it if you simply change that function to consider system
memory? Otherwise we should probably change it only in the pte encode
instead of doing it in both places.

+Fei, +Matt Brost, +Matt Roper

Lucas De Marchi

>+
> 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> 		pte |= XE_PPGTT_PTE_DM;
>
>-- 
>2.42.0
>
