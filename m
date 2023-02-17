Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D759C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 22:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0294D10E1F8;
	Fri, 17 Feb 2023 22:12:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081A710E1F8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676671925; x=1708207925;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5ZhUZS66QrbGLQN+Dd3ZGt1evoh642Y30iB31aU3uIw=;
 b=Un4BgheHEh4Kvn45QBfwioKHujZuO1pHib6/rVYBWTlJm0CflyzhzLSX
 1gs2NX6FKPsgSrFs9q4FbvcJoVcxVEAoFbRc/uWj5p2t9ACoTR8oVdyPH
 rUSydgCBChr/nWa4to4mAsMcyO2cGsJO6PGM4BNTFFjkLdTeWQdIYC5p1
 YN5EVNIGmPw5KqLJvNZbJvNrsrKLKsMWEdgLMxChFn9AgD/MNRTEM/UW3
 LFuKmY3e8bBXeHo5V6pmDCFWLvlKdHMLKQcahRIdIH7dVtM1t+hDzz3T9
 flmPrF9I6kJQd9tqnMc67CThu1UtRPGRqaZ6zwYINPMbddeby7xz2LBx1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="359553328"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="359553328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="701062879"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="701062879"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2023 14:12:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 14:12:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 14:12:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 14:12:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 14:12:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFGlXia8Uugbi1V/6w6pwQWwS7FJgtiqPhsh95vb/SyE1dV/hCmMKCPW2iFj6/D7uX5LSv1sV91v/KEDLEkmdSDTMlRDtXfFUBvH8kyDSgfbYpAhIISBOFS6Uas6pvDONSyNIVVb9ySoq0eSzJnxHvY82jAqav5U3qSCan+MH/7Rd359E9+namdB+mtXKJKoq/ruV+NhS7cJ7miSVGNEQ1IHm9EoWSIGz+hb5AJ7SOnV1+FnLBWG4Ki0s2GrGsC4aXenmzvb1aqAcvdvUHf2r/QSkI8eCB63FXGhGPBhAL3eJbF9V0oqswtcoanUFICYOIey+/RAhpCsTxwREdqnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI0NZaH4QEbnvx/ps3oBbvtwf7VSPRt37Eva9V3Urdc=;
 b=KNziSNea4ZBNiOaK9j8BDYN6GbOi9e2up55o/NoZ50NZLIzumk7kZWBL22a3QolOmvdYaYSl39azdl4kg0cJFS8J6JInQtMn3F74Dg0UpkESKtYL/pCyYQOUK0xTVrnAcXYZzml2VmKK12dFOujp9GvamgsKq8Ekeiz9SfkJwdWPMETGWPhR6rlzvLT/8tw24PVUUHG1wHXmJZrPW8uwP5Qi4YBV3DNBr7CHK1PcjYgJUq5UbjbKk/Ib4BnccxqE9seQBVeMk0rbJ7MY7F2+afoG7l7rQQmUiftsYwmuxT3cQ9HcOOB0/hRkREBK4pke/sptt6iK5S4T4UGIiSYAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 22:11:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 22:11:57 +0000
Date: Fri, 17 Feb 2023 14:11:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230217221154.cijqndqk4nzchyr2@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-10-lucas.demarchi@intel.com>
 <Y+/iLu7iKuC1jMDb@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y+/iLu7iKuC1jMDb@intel.com>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a10902-ec4e-48a2-2c05-08db1133fbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiocMdvkhPYSn7YlmZ0U1B68UP87PaNfFgRw3J9Za0oJPOgnI4sE4rudU8+w7MyGJ3p0BSKDRC4bFUiVdeVENe3/gmmN9HF817dtgCZbZIkjHIRZKJ6zsP38b0JoHpwrnNg7kQNrsx18DV010xgrGIQFNEE1yRfl8x9c2TeuYM4/kPXEjOJVUnME5zavy+WHecMF4NTq2iOG78nEvOYhfGmttZ6Zd4D7+5Pci9ANgIrGgCEDx0imK4hTjU2sbaG0Msgc/LP/9X+4UR9orX2EdfZBQhQ8pfWTpBIo6O1F9/ol5nuMCHHWc3gl8CM9XJSGk9gKy0Ms6AQRzlMkV5zJHFWMEZxh2vwLEtZBF5bzqqDt+2Ddvuh6E4FLS7NHTJC6Pd+otOaNIG0yqFH+6oQJFtpWBnW/1+KTynRBZzd28ukS0leOhtl9soCfbb6+XNiUuzv+VKGWoQ7nL5J6hCKkzx56TeohUdRO2rSPU2dxGq8+tlsXKD4R3NNzfDLF19YFDEFkWzxkq+tlBSmKL01cAuu70AkwQSo95gzyWbb99NXMM+0dHP6F6U470+BGxbiNWliSK70oPFIGnw6LIgnINbaksg0UIPyy9q4yB59UAAQ2AH1sP2bev+Vmdi7COm5nlMf7bfzqPKU62aUNCGPD8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199018)(2906002)(36756003)(86362001)(83380400001)(82960400001)(38100700002)(66946007)(66476007)(8676002)(66556008)(54906003)(6636002)(316002)(8936002)(41300700001)(5660300002)(4326008)(6862004)(6666004)(6506007)(26005)(107886003)(1076003)(9686003)(6512007)(186003)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zkSS9rnIfJ5CXikvB3n8RMGhf/guHhpRaxKCl6FEfR6aEB5eZNxcJEhcxqqX?=
 =?us-ascii?Q?KaHr5qzrMwEvL6OE5jvEMPvDG5+ztuoKqEx1BvccDOvG4m0CpQGjcoD6HIC2?=
 =?us-ascii?Q?XS8Y7qme2TD2BApgJQJWe2Xi5bSpSX6CQIlfJieEs9R+2uoj2sJRc8mOpsTy?=
 =?us-ascii?Q?llg76kUoSjmtV/XQ2fZ8f6rZBGSKx1SyuP54CIiuaJbZVK9SeubsKYRNukU+?=
 =?us-ascii?Q?mYgkXPMKVY8J7WKs6StCZFBivppMyhpEBCsYAOP9Ud/RuvvLDbhE1qlYd+qY?=
 =?us-ascii?Q?vUVH00rHoyEJ79wUaQDehbknGfVOnKvyN8ABWB7izytOgqVTIY2TJ9GnqHrt?=
 =?us-ascii?Q?lV9kin873HidCOcHzOYDnGBMxzZ6rFUjGZmQtZZCiD1KQWBVBw2hrsj0N6pc?=
 =?us-ascii?Q?wsV9UDZen7r/zEYablulkj2Y1A6AoKTl7rxjSV92kiis55K1+aK2lS15gW+v?=
 =?us-ascii?Q?AmGKTnGvaZztuudPIMD6/8Ne7L61BIrz1r8y0UqmNPh5Si3x7plmDPOZKdNe?=
 =?us-ascii?Q?zM+H2fFC8zA1njWbsTa4E/c0HoP0tDonumH/PuMnsbRhK5rVERqjv5BFhG51?=
 =?us-ascii?Q?7j1zGFz6Ha0aczt9SjbJRtwxcxY3jSVEDcs1/3EuMKRWVTumyBggQ5ofj866?=
 =?us-ascii?Q?vE1u3kht8Aw/InxtgMaOnxbhlF+N7t6K0h6pGyTY6PawRI1COEGwLxowahXm?=
 =?us-ascii?Q?sCQCFeJkDYOEjFiw3w8OuJOk0mvCt/YvGj9wkLFjHIpniy9cSUjHfglSyFju?=
 =?us-ascii?Q?x39no4X7LkD1Zi2jqN+/3UncY8oHyEU6rEjlE9NGOWOgOAoPBD87BeoXIrM5?=
 =?us-ascii?Q?y6M1TXSEuOoW91F7t2Iu5JjRXlP7+sjIMFHHOkTQZ6IW0vVVXckXht7EDd5Z?=
 =?us-ascii?Q?IYUvWUH2csc4v+hKBHz9wll5AZlhO3vzyB6ZalSPUAgT94BXsvlbSmnxLzPY?=
 =?us-ascii?Q?5lGy5yFnIdeWC21ncUz+5wSy1fkbMcVniBMp4wRRu07YE8rjW5iXQkUSJrYT?=
 =?us-ascii?Q?e16JosMl1rhK39kSe1J42RDSvM38bCBE1GSB8nxzZYd3K+Xv2QA20/sY9RKJ?=
 =?us-ascii?Q?TrR+nxkhuhHU8uJzwczTX4482XdZZtoTJFZI2vJLtsuwlWtL5DnX2YRSUHGk?=
 =?us-ascii?Q?yehHBlFssE7tfyEmFVyRn4hKOU+HXCvZCaQsoAY0sV7RwhINMaJvqYbjyfoh?=
 =?us-ascii?Q?sZila1SnWmWxtfpC9ATyJ2x5EFG+GKHUUFz8yIn/dYx2bQbEHJRE+BWTzuF9?=
 =?us-ascii?Q?ssZtlCXgaE7JLpYovQQDJ1OkYM1bZTa9kZxMXDpmYCJlJZwPczqrpZuEDbtw?=
 =?us-ascii?Q?F0VUete+iIEkR/r6A+uO2m4ARCCrBmkXm9tLfJ5gn1oMnt1wBY/ennazkoTj?=
 =?us-ascii?Q?fhNamDfwT1jSSVcgt8O1R69vcT5sQM5Zr4idTnFA1BPYd9EOkDc5/9iXsEPw?=
 =?us-ascii?Q?y85WjNnRsGQrnBT24Fl+I8QuH2QcknTTvEO8CwaVju5KacUAcAa3oTpvBOMS?=
 =?us-ascii?Q?EHeD1yYslvdd+V66JKaIRHpFGVnrSo3aWcdOLh2xW5iqy8vgWbtXkgz1o9oM?=
 =?us-ascii?Q?57EU40KYgrVXp6pPoMEFcGf2ttZE99xI+GI4BVR8kwAgHR7K5OX1brcGqfmI?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a10902-ec4e-48a2-2c05-08db1133fbda
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 22:11:57.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM6KitWyXkF7OwO+UPEARU61Bdh16EJk1LKAkgHxCH+oea1LjqDWXNEv1TD03YXsZ3eHFMOvKrwTHA+BgFAT1BV+oFwR4QWGR9VF2f709gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/11] drm/xe/guc_pc: Move gt register to
 the proper place
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 03:23:10PM -0500, Rodrigo Vivi wrote:
>On Thu, Feb 16, 2023 at 04:52:24PM -0800, Lucas De Marchi wrote:
>> Move a few defines from xe_guc_pc.c to the right register, now that
>> there is one: xe_gt_regs.h.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>>  drivers/gpu/drm/xe/xe_guc_pc.c       | 6 ------
>>  2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index da40133252fb..ab8c9e51f62e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -186,6 +186,7 @@
>>  #define   DFR_DISABLE				(1 << 9)
>>
>>  #define GEN6_RPNSWREQ				_MMIO(0xa008)
>> +#define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
>>  #define GEN6_RC_CONTROL				_MMIO(0xa090)
>>  #define GEN6_RC_STATE				_MMIO(0xa094)
>>
>> @@ -242,6 +243,7 @@
>>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>>
>>  #define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
>> +#define   RCN_MASK				REG_GENMASK(2, 0)
>>  #define   GEN6_RC0				0
>>  #define   GEN6_RC6				3
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 0df82defa7e4..3465236b0b49 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -30,12 +30,6 @@
>>  #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>>  #define   RPE_MASK		REG_GENMASK(15, 8)
>
>I don't like this getting split from the rest... but I don't have
>any quick better recommendation and the movement below at least is correct
>by itself. So,
>

we could add regs/xe_mchbar_regs.h and move these there. Although if
there is single compilation unit that needs that, we may as well leave
it there. Eventually if we agree on autogenerating the headers, then
we'd have everything unders regs/

>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


thanks
Lucas De Marchi
