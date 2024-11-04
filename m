Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997BFD1BDEB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 20:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6010E4C4;
	Mon,  4 Nov 2024 20:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h23mCCPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46A10E4C4
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730751016; x=1762287016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DCNfy7zhkN+6AHHXnalXsBFfEWw3y3BF1cJ/0gr/zL8=;
 b=h23mCCPgBdA6/EP/Vwqnz/pR8RJQ4LZbNRnylkD7tbFMbyZwbJjypeyJ
 g0iHzdcFh3zUcGqisM7bSsTKb7otRpLqfIJvByT0PcmN6jMkJsCf08y+p
 +nUKF57a6OH+B2BPs+ewP1HyEjIc9YaEboHV1ZVFXHemSy81y6iCt1Zm2
 zJlJXWyOmv/LkHgmW1pVXoldn2GanWNSqdlmuvTRXO3dUJBxXLdt1GzPM
 GSW9RMqtcSSnYexZ/xOgbW6WN9V+orPLRnemCwGEUzvgDcgRdycjfeqJn
 rcgh+XLly+S93vu16PtKav1KL/AuqMhXiJDNP1NI/r6Q8tiWBH7CNDbeC g==;
X-CSE-ConnectionGUID: MT1VuciARSuY4GVNAa4vtw==
X-CSE-MsgGUID: tVnzZjWjRJGCRbtdZ0m9Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30647357"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30647357"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:10:16 -0800
X-CSE-ConnectionGUID: mBAjFOjdQ7eUravQ6w3oHw==
X-CSE-MsgGUID: EVzKtsI5SYGaNGuX+24M3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83880186"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 12:10:15 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 12:10:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 12:10:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 12:10:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yW71ohzCONYzGg205JbDevSvvsh8Soe2HSG4k24ttHizN2Unz5FT+m94XD0M7RJWMsGT35MlHkag9phHO45P1gz8Sij49r+U6GhzMk5o2grqsM/VKQhdypKuqn+nP4ZTv7xQLH1pehYL8rLAqeXTXn3ubLDKdqfOhsFsTHBcIiA+8YYA+ufmj5Gw0v8a0auwfoV5d4Bbj8+ARbxvoDkJGKgy9RLVDA8k7G5WV5Az3wq85QDVrX1OvpxIP6le3pIlBo3dKuM2EyFqDhrWuNdRR1orrDOx+siAC0UYEEX/bbNyx3R9j4ggONXZi1giQL3x4M0Taw9MBBpyfZThzgmTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgknQRSddnQiteOHMfYcF7pTl36SJD00bZ4va41yvkQ=;
 b=uqfkP7x49++63LU8Zr2XZsF+srFgqveEJtIXfYdw2AL1BPdr8pTD+/oEy52Dw2pN7jmH3+YPfy6aIBMQ30tud/mrWT+cgSxkSvkSZ/XMoNVpDJntkISjSACr9qr3NllNp6AJQc/wVHHdfYlLe+kciu/1JDTGPpl6XWlxO/Ii7h94rNPij251kYeKjrY87bbAfW+I4c18Wf45WYvzfqBLsCp0/KC0H5iAT2Kr2kU5lnWRt4tVFrhIl0JM4dLeDlslkJ8vfaECmAt4WjmSqLOGcG7qb6arF4siSwCsohJCtYNJ4l4aDI53o4g6GCr5KPOs1uRTB+7DcZ2FilXOznS9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 20:10:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 20:10:11 +0000
Date: Mon, 4 Nov 2024 14:10:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Message-ID: <7oytlp4kzqudiwpkj4pf6yna2qoqinjup5viv37v6vdh4ihl46@2b4njwu7htzd>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-6-lucas.demarchi@intel.com>
 <ZykcsyXx7qkGxDQI@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZykcsyXx7qkGxDQI@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:303:86::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 830d1101-dab8-48b1-6e76-08dcfd0cafe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TuQSVVkhQVVYgonePvHAqMfwDl77VkdCU/zrEwWn4EMF2z2vLyMYcaA2rgea?=
 =?us-ascii?Q?9iSSiFTYeK4jnVBoCeBiwqrGqaLT5EVKnNYo4SIQG9pk0ZDpUBbXkobS9hQp?=
 =?us-ascii?Q?lWIm0dfTFh3sj+kcojzKr13nrN0vwckcR3IiHUgK2MM405g5pW0HEnhmDzXS?=
 =?us-ascii?Q?IeHli6zO1rWyGS3Hcseh5ysIhsLP6gDVlyGztL1PqjpP4TyR9JZsFhME4ocD?=
 =?us-ascii?Q?d1U232Hg3ndIc8320iOgmzljD4IZZVI6nytBLZR02aV1FWOYRtQLXfqxIxSZ?=
 =?us-ascii?Q?HfLgzLY4WWKW29JHPLEKBXr6dOgMr/kkjJOiK6JQBSD4fPE59KBC14Lgpghc?=
 =?us-ascii?Q?/K2U2V50ixOjbIKTAClL6vtbhG0vtYy43A0TGSg0dMpyXCTfOnJd6BGC6lgj?=
 =?us-ascii?Q?9GUmfIuqVuhcDSLg6g3gNN9N60PCj6DGIrw87P7GlJXSGB69aJ/nUV3hl7Kb?=
 =?us-ascii?Q?T2OK38kC1DGKEu+MZ8P6dnZ4NMBNNecmgrZTgmYF1HzBs6wjTigPAPNkNY36?=
 =?us-ascii?Q?yAtwrmKbOCCZwcxMa7LEGYpn+4qEYw5jRAoovevKacrWU4tkotsC151KHHt4?=
 =?us-ascii?Q?v7UahVD7UJEr4LU+I5XF5A8UlV0mbNQ4JrS4Ju/6+nwAApPy6cbdcCyehwet?=
 =?us-ascii?Q?FuCdc8zRs5xYiMzxemZ/XGC3/1cPJ2Vkz0cB1ueuB1kq2mXcByCxrHYDy8a9?=
 =?us-ascii?Q?Pxh00OelBragw6rT7CX9ihPwvNj+dn2HTCHnZl3YzIeP1+cB5ILoE/wvrI2n?=
 =?us-ascii?Q?L+N1rxG8n10JDw9jJx4feUfa4YuZc4lt2GrdwqrTd01jX5KLaultr/VtUIWc?=
 =?us-ascii?Q?aojmNGOs1PN/hGwfJlJy823OJfmSMw81zxujZSU0T7STE9909/3k6epLLbif?=
 =?us-ascii?Q?PVGT5/ddTsKhgvWQjFfAZPMfFctnzndPxC/BtwLA3cXLeyy4vz/FELWHtLBE?=
 =?us-ascii?Q?T8mAy/TqjpvHRhSFlfpKWSbfPNhhXpLZ9wS472/+jEEuObVESk7tWdcsr68f?=
 =?us-ascii?Q?OyK99R9yTcLQuL2DYgIXmpxJnTrKXDlFc52lS2EEymhDSYpBPSGLyMVjhA3e?=
 =?us-ascii?Q?wmPwynjFts9CYh7ES2177l1et7JFu0aa8sECDg0Lew0zhiYGbhg3GuD+yixq?=
 =?us-ascii?Q?dwfbFqEhymuOgN9X82sFo47F0VJ4kK/wuh2OP6GTy4zujT16e2+Wo1vz+cev?=
 =?us-ascii?Q?wS0K8QT5yxeZQPy4JdMyRJLcKFUhjxa/gWUVZnbkpKu06yTFhxBHcxlnAU+N?=
 =?us-ascii?Q?HPZc1HJ1j37clY+ewK4ePqNMwe0YcS6SOWELj+AFJr1sF3/yC4vz2ijidRCv?=
 =?us-ascii?Q?qN1T3xfPrKg33pI3983wTa0w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xsGimNmrSnmfPxX6SISibzxKRQLYthK3Hrli0oCYXJeJ82eZVlim98V1GYbP?=
 =?us-ascii?Q?xjKrBmh5Opff2JX3tnnlprvkw/J1zs8ESGb02KnHxpMrHCR78sZbT63eFFy0?=
 =?us-ascii?Q?rUoiW2ajvravA6EOAR1JEzmOCbtbdSpeWrXJwqFIn1vnme6Gs2fGzNXXg7UL?=
 =?us-ascii?Q?P9gPX8UFfO/b1HV+hzZ4mtwtUMYTxjQsloeKYP5WGlsRvA+FY+sueOMK09l8?=
 =?us-ascii?Q?wEHpe6JTTHswPufrNwv5rnStW9TVaD6DQbFlZIsv0ASExkim1tsQgyZVonRv?=
 =?us-ascii?Q?0qdCb6vY71ZxVic8GKdNu5wtKBEmR6k+/w5S9lFhuFplP+rmJXabmbX732Er?=
 =?us-ascii?Q?kQv7uinKh8uDxg/SCtlWO054GUhkDye1A10F/Q3vJ+dt9EuwlYelYNp+nukN?=
 =?us-ascii?Q?6BqeT17IpvO1POL70YH5jFI8HSTeb2padsA8DwlTErbLOHXFP+jmPu0YNITv?=
 =?us-ascii?Q?BNHWRJejNJIxzh+0amCmGCQFk63NMVmjFlLT9Q8ItAGS61z3CkmYkdLVg7Px?=
 =?us-ascii?Q?pthALfjOUYc+ojQslMx4mnzGfeeCbRHThfVnRgmyzG6rTWgukbqObo8f0BBs?=
 =?us-ascii?Q?F6zYVmiqX01D0easg+84CFFEpwNZrIm2NbPjKYCE9Z5Qq9fyH5AFSjDv2rT4?=
 =?us-ascii?Q?1EDUBnvrous0HbNWcvqTnxFwN3pkWs0qv/Uh6orbvU9uzM7uudy0sWUueQb4?=
 =?us-ascii?Q?5XlFDNwwBlMQpopgejui/Ac954vw7axAFeZl+m6YgyMQavxx3RMJ3gngdBhI?=
 =?us-ascii?Q?9GPSssOVu6oa2MaEduhOIfwo4crUlmou/6iSJTZZzGBfZ0Xk1gnzv5paW9ag?=
 =?us-ascii?Q?NqyWARtnV6xxFw8RCXWHTplACDUEZLempXzyumGN30Na9Klf813N4J1jf56h?=
 =?us-ascii?Q?73SShCBj6IvafBgT1g+l0cQdBhv6oOkt3IB8uiTtWAmvyB6yj5epMqDbFl4q?=
 =?us-ascii?Q?N/dnPsIgI3O/q+g6cQCabVQ1XKbJuj88796XGSUanvU95+IZEX11b7NIAA4E?=
 =?us-ascii?Q?gsxU1uWwKEp34ew8+y432tZsa8eOczfgSYaNJwKIrfBRJI12lioz5+6StwUg?=
 =?us-ascii?Q?vvU9gVusSkz4NG/yqDmIg257qqtrMc4iZNKA3TBzV0L5BUWXGZk0mN5fS1O1?=
 =?us-ascii?Q?y6avweV8Xo88Fg53cUd2OEAn5r0QQG6sxopgJQ4E5//OPhsQPz72io4ir8vx?=
 =?us-ascii?Q?9djNkyDhlp6kISSkdvpPTVX6+9BAEWl7RxeuVebAGe702DrQrGYxmlDFnoxa?=
 =?us-ascii?Q?T9m9C/OCpNp3pK2PLJLkXQp3NpW4TSE2pJz++tmwfxdAudtClYDJyHSHkwZH?=
 =?us-ascii?Q?/89+k+zgecQrFB/uBvSckmGK88/703v/SB04tzAgwhD26iztsgF6g6R2El2w?=
 =?us-ascii?Q?+45+k9eNFt+5Fno+3qns9wTq0UyNMXjsNprq0eaL2R0mjwuje4OCgNgfl5JH?=
 =?us-ascii?Q?jmwM7Zl90sVGNGraNCwAZJUtlwoBzJ409jK9NEZCcL+OVc5TJ2AwMb30/jQR?=
 =?us-ascii?Q?W0GA64YxYQ/Ifi1VnGywVZwYYwohh8eXQyBVEH6bIc2zr7iGLsnhLSpFEk5Q?=
 =?us-ascii?Q?PyVe7gsJKO6S1+1AleOfSfpG/+oPGrWAt0P0YXGqWOtYork6h4SpxYUldw/b?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 830d1101-dab8-48b1-6e76-08dcfd0cafe9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 20:10:11.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCw5kDc8/8cP2THzAflnp0S0fH5tm/cYIBXLXwoWprafBjtnbhNl8Q1EVA8SnrHhcOg+SSMKu1oIw8A18Bmb61JYw8nEqfHjvW3i/jUc9vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On Mon, Nov 04, 2024 at 11:12:51AM -0800, Umesh Nerlige Ramappa wrote:
>On Mon, Nov 04, 2024 at 06:38:15AM -0800, Lucas De Marchi wrote:
>>Move the force_wake_get to the beginning of the function so the gpu
>>timestamp can be closer to the sampled value for exec queues. This
>>avoids additional delays waiting for force wake ack which can make the
>>proportion between cycles/total_cycles fluctuate either to more or to
>>less than the real value, depending if the delay happened in the first
>>or second sample of a top-like application:
>>
>>	sample 0:
>>		read_exec_queue_timestamp
>>					<<<< (A)
>>		read_gpu_timestamp
>>	sample 1:
>>		read_exec_queue_timestamp
>>					<<<<< (B)
>>		read_gpu_timestamp
>
>This is inevitable in sampling where 2 values are sampled in each 
>iteration and a ratio is taken. Since you are trying to reduce the 
>delta between the 2 values in each sample, this patch does address it 
>compared to before, so this is
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Although, I do have some concerns/suggestions which can be addressed 
>now/later.
>
>1) gt timestamp is theoretically allowed to tick at different 
>frequencies for media vs primary GT. We could run into a compatibility 
>issue between run ticks and the gt timestamp at some point. I would 
>think q->class and gt used should be compatible.

this was considered when enabling it for the first time, but this is not
true in any platform. In theory it could be different for any HWE and
we'd need to read it again, but there's no point if it doesn't
correspond to reality.

>2) can we cache the "any hwe" early on at driver load and also 
>whenever it changes at runtime? The fact that we find the hwe on every 
>fdinfo query seems unnecessary.

good idea... maybe I should do that already instead of this patch, so
the function we extract is actually the helper function to select the
hwe. Then the force_wake get/put becomes trivial and we don't need to
extract it like done here.

I will prep something to see how it looks and update.

thanks
Lucas De Marchi

>
>Thanks,
>Umesh
>
>>
>>Additional delay in (A) will cause the utilization to be bigger
>>than it should. Additional delay in (B) will cause the utilization to be
>>smaller than it should.
>>
>>With this a LNL system that was failing after ~60 iterations, get to run
>>to 100 without a failure. This is still not perfect, and it's easy to
>>introduce errors by just loading the CPU with `stress --cpu $(nproc)` -
>>the same igt test in this case fails after 2 or 3 iterations.
>>
>>Although not perfect, this could be viewed as just extracting that ugly
>>loop to "find the forcewake for any available engine" into a separate
>>function, and at the same time improving the results a little bit.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_drm_client.c | 63 ++++++++++++++++++------------
>>1 file changed, 39 insertions(+), 24 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 24a0a7377abf2..874c2157baf49 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -269,6 +269,40 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>	}
>>}
>>
>>+static bool force_wake_get_for_gpu_timestamp(struct xe_device *xe,
>>+					     struct xe_hw_engine **phwe,
>>+					     unsigned int *pfw_ref)
>>+{
>>+	struct xe_gt *gt;
>>+	unsigned long gt_id;
>>+
>>+	for_each_gt(gt, xe, gt_id) {
>>+		struct xe_hw_engine *hwe;
>>+		enum xe_force_wake_domains domain;
>>+		unsigned int fw_ref;
>>+		struct xe_force_wake *fw;
>>+
>>+		hwe = xe_gt_any_hw_engine(gt);
>>+		if (!hwe)
>>+			continue;
>>+
>>+		domain = xe_hw_engine_to_fw_domain(hwe);
>>+		fw = gt_to_fw(gt);
>>+
>>+		fw_ref = xe_force_wake_get(fw, domain);
>>+		if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
>>+			xe_force_wake_put(fw, fw_ref);
>>+			return false;
>>+		}
>>+
>>+		*phwe = hwe;
>>+		*pfw_ref = fw_ref;
>>+		return true;
>>+	}
>>+
>>+	return false;
>>+}
>>+
>>static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>{
>>	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
>>@@ -282,6 +316,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>
>>	xe_pm_runtime_get(xe);
>>
>>+	if (!force_wake_get_for_gpu_timestamp(xe, &hwe, &fw_ref))
>>+		return;
>>+
>>	/* Accumulate all the exec queues from this client */
>>	mutex_lock(&xef->exec_queue.lock);
>>	xa_for_each(&xef->exec_queue.xa, i, q) {
>>@@ -295,27 +332,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>	}
>>	mutex_unlock(&xef->exec_queue.lock);
>>
>>-	/* Get the total GPU cycles */
>>-	for_each_gt(gt, xe, gt_id) {
>>-		enum xe_force_wake_domains fw;
>>-
>>-		hwe = xe_gt_any_hw_engine(gt);
>>-		if (!hwe)
>>-			continue;
>>-
>>-		fw = xe_hw_engine_to_fw_domain(hwe);
>>-
>>-		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>-		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
>>-			hwe = NULL;
>>-			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>-			break;
>>-		}
>>-
>>-		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>-		break;
>>-	}
>>+	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>
>>	/*
>>	 * Wait for any exec queue going away: their cycles will get updated on
>>@@ -324,11 +341,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>	wait_var_event(&xef->exec_queue.pending_removal,
>>		       !atomic_read(&xef->exec_queue.pending_removal));
>>
>>+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>>	xe_pm_runtime_put(xe);
>>
>>-	if (unlikely(!hwe))
>>-		return;
>>-
>>	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>>		const char *class_name;
>>
>>-- 
>>2.47.0
>>
