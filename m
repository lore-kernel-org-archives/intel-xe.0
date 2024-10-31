Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A99E68954
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 05:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B33E10E167;
	Thu, 31 Oct 2024 05:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rpd8lkC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDA910E167
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 05:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730354132; x=1761890132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d6CB3LtIr6wgFgu88GjxIZtJ9xdmTDsyCN1eKyIiB4U=;
 b=Rpd8lkC91VEWcribdJCTowPu9XC89hNlFrEX/p0UZKNlylkjlhwt2YpW
 J7xkxYQWcoWbQZy0IqoqvMf8qTOgQdWCQLH+HZQZbJACQIN4DYopFQQRf
 7b5moKyIIfJRRSiehpeQCYoRUarkePwUvh2j1q+nSLaDfLUBR46BCnVhT
 Zv9mSAwtvh82XZmVvnCRrgvnwY0K+Wqntz+s/gEmkVulfnmMpDrA26I0T
 c+oWf/J8xnRJjvDb4XDloDlbKHT+JZyM/ulKyk1UeGnHP8ue+1S8WtECB
 miIOzchagfjG/Ugaa87qLh2hwuhZf11BguPq1kMcTO7xefvZlINJsrZQ0 g==;
X-CSE-ConnectionGUID: yJb/rAg5RgK7QTN7DRfLGA==
X-CSE-MsgGUID: piCcYFWSQzOXETImsunx2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29973279"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29973279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 22:55:32 -0700
X-CSE-ConnectionGUID: Prui8/V0TgaHjI0W8rmbDg==
X-CSE-MsgGUID: GKMrn67AR0mZOkFH25culg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86462006"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 22:55:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 22:55:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 22:55:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 22:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8w3M+tERFtvIgtQv6gXLHVXqhj3HlzzJoQVK6D6+0155SzOe5fH7AAzcfPCvGroHYHiUKrnEfcxipRG759SyxQc32Eqjdg3W15BR+zIWUaQW3yAVgxrHa/PsbZ0ufUfuikp2PiPKV0qDurpicRzyq7x1QBwQnnxxIXkzHnJ6ge/3r6uqdpHWaN5Z99eO7Fyv4jSdSYa1kXKbnhH7WpDVB6uF3x0uxvxGA52u4LOE59UyUUUOnA5g8UcyrLoC+xb6UF+kjGXV5SwHDDg0IcQhOhDtrE4r3ZAJH8mOJVoU+yOxKB56eY3CHdd+wx/dR9O0gt8ABsZdKUJuMcWuNvdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtCJidFkOafVR07/zUoBydD9Ux1aQaBDgQ+zbBaJeqA=;
 b=ly63gpQOlvJu2FxduRt8jxyzOIB8LN9C26EsY//rEZvfcMQfv8Wy0azOw9fte2UAz13nKWRRxsQSybaeaLdCmiWGV4nyumoxtI50w3uPQTfm0W/D2Jth8yw4F3J3vnHOR0tuASa+eGScEfWNMN2XrA+vnHadikQi5nkc9E2WZ5OcDh3BLCh/r+9GWE61wEoD9HMhPh31T7aNhSIyJBJCmVFxx0cIucM7uaQAS0zd3NmETOAw1BuAIsthFsL5knN9BdmMsNqD33AGgbXXmxc8R7HPHI+BEPHX6v/iYm2XxLnZjJx1+KSxlpQFPCI02ZB7zlXengu05X8jHFr/ko1eQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 05:55:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 05:55:25 +0000
Date: Thu, 31 Oct 2024 00:55:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Set mask bits for CCS_MODE register
Message-ID: <q5td3vovazx4hiev2k3kik4ywa4pqacnzpoihekpwn2xqbhayh@66fvbyxyhavl>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-2-balasubramani.vivekanandan@intel.com>
 <ebjfdpufgjiby3sv7jc4kogtv2jtvdgi62i67dsoo2ujxkevit@rdjbimol2nb2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ebjfdpufgjiby3sv7jc4kogtv2jtvdgi62i67dsoo2ujxkevit@rdjbimol2nb2>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 53893797-f11e-4507-9f84-08dcf9709d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TRBYrGTo6J0NNbnr4MYWldPT3QiceDtiWt9nAoufAAjI3nC/pXagZwSgWw2r?=
 =?us-ascii?Q?6jmw5EKw6G9WBtTTTcMmh9Zlre88DD013cHF2aiWFQTbTV5f597ji+wLAokh?=
 =?us-ascii?Q?8ab27Akhj/vqJraxDr+gqDV7XFdCH4N8BI5z9xkgO9SPBrMV8sZo95AOj2jD?=
 =?us-ascii?Q?PQ4zOfByjo49nf0xr+jjTv1bHIcQnicWYNQqqNyqYRcPLBa34p20yNO00XWt?=
 =?us-ascii?Q?EkQHEI8//f4SGrYQlosTIZJLf6VBEyLPRLE7RciBm17FrKwxvRkK9AEoR5aT?=
 =?us-ascii?Q?y3E1lORr/+D8gLIUPnhH/1WQPTuni1SaUmz3J6TAvQzWBGzmgRCpA9tpg/TQ?=
 =?us-ascii?Q?RFviZeEDyo/+QY8WO/Tuz6ij48pR5b2HjbksDJDwbVxXEeINoZxpwzXRGEke?=
 =?us-ascii?Q?EGUrcsHAHTgvzmvlX846KmpNYqFvtV9Xja05K4CkJjjBtpK5VZF3Vw4d7X0G?=
 =?us-ascii?Q?u2IWWcsH30pdodfVrwuls6yMvtCFzFj/GyXIiCPKMga6UceXyuAQpST4URsC?=
 =?us-ascii?Q?h+0uXIa2e3JVc5sD6HtBaPGmNx+LX0498O9WbVZMRVRHNQy2xfs7dZf/pGmh?=
 =?us-ascii?Q?LO9FSzZrSVJpok/G5kZedJ9H2nCFu0PvCWJ6ZZmdPi+Z4Vct1Rp1TWUqpyup?=
 =?us-ascii?Q?jksHFvx+/Zhct46Y8Wd9W1k/9rUHNmrA99pL1MluLCChKlThYSd193cMgqpg?=
 =?us-ascii?Q?MljySOHQgbyWP1xgNt14TQfJHjMXRf/81cVRu5jh2ZpIEW7FbbNE3yyxxmHI?=
 =?us-ascii?Q?YKfI37AT40a5bic0tCY3IfT6qlWR/Gpb/leLbo69tqqRm4kBQa2d6ePXRb2R?=
 =?us-ascii?Q?U0N76OrOhxFmv3LMHLFS00QZtFIQwExOQN9P3d7NqFLWx8oNVesIqiUXKjnm?=
 =?us-ascii?Q?ZO4mvnlFf9soju+U4/2UnUVhLMY5vAs1NtaTLVY+GDs1GvGUx5Z+vZMgQIds?=
 =?us-ascii?Q?iVJmAK1DlS2hOxlgYK/iWRWikP4gG0V7/QicjMn0AU7tuVm2TB043zoPSdz0?=
 =?us-ascii?Q?/+DdWFfXurhINDbUBvpUKXtbOzJtOJ7U6Nn6Rnd0ChCcNnaW5/8jXT6DezVp?=
 =?us-ascii?Q?SoDibWKdWNGkC8qTNqYUnlXOPxOlRWVLrP5B+5POS45BTS51FsLEhS3HPtS6?=
 =?us-ascii?Q?RR1IUvHthQ18NGZ9ijOqdSR3QfqfWh1j+wA2ohPwO8fjLmOLrPYmOqg0s9ij?=
 =?us-ascii?Q?QfWWLGj8VxeTcVseDcIeqUBwLxAS7cWHgDMLmPrQUim6zX5ZMGzwrhIPqklu?=
 =?us-ascii?Q?9YHa3nQKghO6snR40detM5n0oT+LIki8LwXkW2Pqr2ZsXzFyJjZLJBmK3mYA?=
 =?us-ascii?Q?ElhmL25SfU2RgVpA5fX1syQF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bXupcJk93YnlaoX7PJ/+nrqTSZxbS9pGFcqZxd6KMvdF5cvYV3fT+jGRcs/?=
 =?us-ascii?Q?y5aYXof3QDrmFCJETZZ2PNCeWiuR/zy3GCu4AH2pmFUJjc34TOXN8M2IYzIB?=
 =?us-ascii?Q?mT3TpS4tJYmCZcOmdvjhIU/kUQCTKs9th8jmubpzzPe+RM7/VeWKCFUZGncZ?=
 =?us-ascii?Q?4o8a0E58hwxEz/A4Oe9Z0LhIud/jwMhXe0Oo8WMecM759tVhnZ0Ni/IS6lQC?=
 =?us-ascii?Q?QSAdRnQqvpanSn+0hiFAm7K1BtpfJvbAPG02XTQpN5w11urUwdE0UuzjcdAs?=
 =?us-ascii?Q?s9sc7iOurzOFZP9HgxlUfFOjEoWVDPTezKIbWOVSLLo1uaqm7szH6oKDwB4z?=
 =?us-ascii?Q?9U4iG+z8EoPcSZlX9n0iIvL2kc/nc6koJk8TVHWw3oQrQ3gxxYMGmA7ySakS?=
 =?us-ascii?Q?32gh7OPJ7px3RpcTvIUIsGPtPfZCJnY0TTJZAkLh9o4ASLEe4RcCK0tKE+Yg?=
 =?us-ascii?Q?MM1huDk5NTUEAWEa0x8M34eB1rpwsol1jNAEpCM1kXpqYpo4vfJev11zFx60?=
 =?us-ascii?Q?dopkBvFlzEmhA5WM9idHUS4e7Ra/IPBQaF4qVWSPL52MqbAQ1DTvMbsjTnf8?=
 =?us-ascii?Q?LC3C4Fy90IHmkYszMBtb6y9mAE0bceKQjfptbIp0WtcIMErN8FYBRKQWNlOr?=
 =?us-ascii?Q?G3Jwubk+9S+14P//na4ZF/X+NEUxyEOKOnwShDnSOCXX8Ex5uZfB0F/pJgai?=
 =?us-ascii?Q?sqLMHiVGxghjqxGvaMEM1GNA1F1ITMSV3/QBvfE8LrisA5hKdwwIn9oHL7J5?=
 =?us-ascii?Q?SMa7JPuMy7KUlFL2szpwaAI9kNO5yVzGwu3IJKtevWazDWUujD5wy1VzNvix?=
 =?us-ascii?Q?9X01mnuxWUqEFSY7Oy86RiLWKO8AMKx71criQQxoJmiq0lIRX/GNFm7k/GeZ?=
 =?us-ascii?Q?MpL+7DGgEq3MRVHjL3Jo5Jh8s9cFNCmawOMrrAl4N6vcUhA/tiqt5/Nnw3l3?=
 =?us-ascii?Q?xeWRyNM2iMeX3XP1iz5ltJh3D6zgIQzKwp7dG/F6rzGgdo9cGP6unt27H4Ej?=
 =?us-ascii?Q?/BoDFo+bA6mdFLhsumEps88CpyW4+pnyLTZBm4x5cfUESkfUbvCms3Xiw8kI?=
 =?us-ascii?Q?wqfRzBCSbsLVPm+iiZoIcb/KETDW72GzBWyKW5nU0KOG8kxFh58mlTwZ8axh?=
 =?us-ascii?Q?KQfKFTiCBd4q+wUdr6nG6NIdgOaGiA5lX9jMCo0dOu81HhCyS8JYmwzN9Bx5?=
 =?us-ascii?Q?aM8n8zRtoneFDbOz9s+7xGVog3LEPHMrI+Omnx0epm1QOyhjYEwDrepp1sHj?=
 =?us-ascii?Q?76jlhBWC2ZH5ywWhUNEA5S3fWQOMa64oP3vOhCRe5CXshifETzZb5UzikBWo?=
 =?us-ascii?Q?HqQthmEf/afiNQb5I1KpEDHVdAjWUTUFfbq8QmEfEEXHlOn4l++Q98eGnFGs?=
 =?us-ascii?Q?K0yfgPYBIiHkN7dNKn1vvlH0zw25fKnsY7iCDDlCP73vbzfTFsBje4O1ASYs?=
 =?us-ascii?Q?tfVJgOlAaTCL9WIKYGyZD9hlhmEqIj3VtFjpWYIgvXy9djv/wFAqUPyqO65Z?=
 =?us-ascii?Q?4MCnxBrChNpZCOsuCDVNK/D7q+S9m5yeQuBPcM4Jrl0zFcOXp4OCXnl9oDLd?=
 =?us-ascii?Q?Wsh9ndWgvS4WyCioOXAERcqMSSI0zllvpRv7M2Vrrdc6M5WuLYhWBeXbWAI8?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53893797-f11e-4507-9f84-08dcf9709d9c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:55:25.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY9A+Y3UCEolA8fCAJPm2lke6n0bxBiRuevpH8LtIx3CS8DQyi42hJNoafjrsr9cnv1/6EuaTGQwiR9258LaQUf6LfdmHC7VWg8uR+aWB68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
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

On Tue, Oct 08, 2024 at 11:34:59AM -0500, Lucas De Marchi wrote:
>On Tue, Oct 08, 2024 at 01:06:27PM +0530, Balasubramani Vivekanandan wrote:
>>CCS_MODE register requires setting mask bits from Xe2+ platforms. Set
>>the mask bits unconditionally, as those bits are unused for older
>>platforms.
>
>xe_gt_ccs_mode_enabled() doesn't agree with this statement and
>we do use PVC and DG2 for tests.

I actually misread what you wrote... I thought it was about not using
ccs_mode for older platforms. However this is about the old register
having unused bits in the upper part.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 6 ++++++
>>2 files changed, 7 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>index 9dd70934ca15..e136b663af98 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>@@ -562,7 +562,7 @@
>> *   [4-6]     RSVD
>> *   [7]       Disabled
>> */
>>-#define CCS_MODE				XE_REG(0x14804)
>>+#define CCS_MODE				XE_REG(0x14804, XE_REG_OPTION_MASKED)
>>#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>>#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>>#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>index 9360ac4de489..246190b3e2bb 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -68,6 +68,12 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>		}
>>	}
>>
>>+	/*
>>+	 * Mask bits need to be set for the register. Though only Xe2+
>>+	 * platforms require setting of mask bits, it won't harm for older
>>+	 * platforms as these bits are unused there.
>>+	 */
>>+	mode |= CCS_MODE_CSLICE_0_3_MASK << 16;
>>	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
>>
>>	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>>-- 
>>2.34.1
>>
