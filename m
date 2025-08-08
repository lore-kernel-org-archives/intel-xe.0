Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6246BC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 14:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CD110E93C;
	Fri,  8 Aug 2025 14:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/sTJHx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E617A10E93C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754661802; x=1786197802;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nlnbmuSDYkcH3YpndiGP/tNst8GzswpDj+q1+QaRxdo=;
 b=O/sTJHx+fer1APRJUuCv/hNhUPKTP2/tbnRJIuMMVQogbeQoBPK0i4Jb
 YhEmln3ofjIIcxtJ7RSHgjGlRHUaA3FHAZjPMMlFdz+aHEHd0h/g+lS3k
 PjxijVMsAGICCg495A5MmkzG5j3tRp8K6Rry7iRdhUXE91yVcI3jXQ5Xb
 aEMlMYIFu+7sRRTHKc72YhkYofMafA7jdQQbB2Av/C4xGJH075ccXAYGN
 0AkUHHOdLeu3N4qDdLJMgm6c28qB7AN0ng2Ys+aLBOETBtIbe7RO3Bk8k
 Du66iOvn/jxIuF4Ti/1DYovL8vKxpPtx4WtdvmKc8usVvEIMSUg9gtpa4 g==;
X-CSE-ConnectionGUID: GjHOB3jGRL27ssqtpgtazg==
X-CSE-MsgGUID: 6GpzO6KmStiyi62GEXOVCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67279160"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67279160"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:03:22 -0700
X-CSE-ConnectionGUID: Ec/zruRfR0WKc9Z95AVvQw==
X-CSE-MsgGUID: EX1XOCA5QmK9evWbUm7t/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169793144"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:03:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:03:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:03:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCiviKulcEBhzK0WTM+d6tctS99gjEc4k6OjgWgFVrdatwtSQ5J4XoubY5AccEurT83xOA1EtAQTak7rFJG0LjEtT98Tf3/l2BCpueI3cWwamWYn4SeIcQDf9M2Dds4XtreV3eYLgxMBtp5+c8zW38ZFGQWGF6vqv/UTskas9HB1pVw+AeJ/uD/4oZuuxJHM4yOQXVauK8uwO3uqn9Qkatn5zgjw/1B8cDBi4C8xKZhRzWX9apc5pPd7o0b3Q6vdkordh2jn/qnhl8Y10KOQpI9YY0YbUFY0PjfgDTFkCPSUlER7HMIod959ymxMYVrMktkoPwWO2MnvQRUUNeVeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSCqg7hNvcSUVL6LQ9MWwE7rYp7wSmc7HCQ8x6vGcNM=;
 b=ye6QwDiz37ILQMPTIY6/PQpW1Us/39VC4IeY5vu2qtTTN4cTancdfBWTkKRUh55CwY9xuToHaG5lvabUKqjZ72HV6FVcm9SjqIb9CuYjU+MyhVcMQLC6MedQ6b63FbhtTWrspmcH02ryZqZSGOkbRn0BV0uAZW9Gnm29xLimK+Kk/oBYTneX8KV4xNS96vSY+0I4JaNbhDdSYukwqnMxOyYBcKWdA9eUO+DT2MaTSh3Cm857sykKuuDLdI7rylyc0/+wnIlQsAqBe9K0OrmluZKm4HcIj5k+Am7BWf7wNaixw/KlyKnEtXnFK6cXXAa/y3l0ZkOhAEfeRsZ3WM3r1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB7165.namprd11.prod.outlook.com (2603:10b6:510:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 14:03:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:03:17 +0000
Date: Fri, 8 Aug 2025 10:03:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v3] drm/xe/hwmon: Add SW clamp for power limits writes
Message-ID: <aJYDopiZjcosG71i@intel.com>
References: <20250807140602.3247853-1-karthik.poosa@intel.com>
 <625144eb-9b3f-4d93-860f-3b200400bf5f@intel.com>
 <13c29a0e-040e-4212-b51d-33cca1e2746a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13c29a0e-040e-4212-b51d-33cca1e2746a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac5bdd9-5828-48a4-7399-08ddd684531f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pgE5G1rkm1LU5d8M/LRfqWPBWGo+mb7CG1+B3MY9hncI5SJ257GbyNIm7s?=
 =?iso-8859-1?Q?+xfokszUH1vAEfipaZU43Tr2faJ4Gbj+C/DouyBKYAXR1ZNIdP8kSySG1S?=
 =?iso-8859-1?Q?Y90Ori3ENS6fgEiLxVjUxNNvZinxBq1bmhIWoeMGk7srxwpdDfEIm0+ZFB?=
 =?iso-8859-1?Q?OKfBNAQai3YB6LhV+ALBrpoJ4YWGssX1fs3pM8rWJds2DcvcPI2ZPMsAQz?=
 =?iso-8859-1?Q?IZUZtTiy1mxAUES1zcMoC803SyrGSuFQzakuUdnmASQWoWVOkhMxuGerMq?=
 =?iso-8859-1?Q?y3kTFV1ljGiQzn0rpaNss74Ai7AbOUFu96NFeCCVm/zQ/6ENV54kdjMn6V?=
 =?iso-8859-1?Q?K58QVqDwjO944AdrX3OCQlAgzSEPYqaqRS2ZJ6FcKauDINHwzh14T4MzF7?=
 =?iso-8859-1?Q?gJFxFWJwjcQUUekCv4V23pDCcfgE2hsd1m8T5q/am01LbqGcrrbeBOpjUR?=
 =?iso-8859-1?Q?eM/vSgXSX4WeSQdQINRYOrPVqW0Vi4j7Xs5ghayJTY1ZsVR3brzlxbeviw?=
 =?iso-8859-1?Q?J1XqOJvFuxDg2GeHqNK+vhSv2Tj5+7fYBJ1iidhCmos0ZP84bFf8IV3zs+?=
 =?iso-8859-1?Q?LMOHaXxS+pxUlejb4qcRGT0M8dLsAH7oYGhxZM9x90/3MYD1I4WY4nIZYD?=
 =?iso-8859-1?Q?4VH7RP56UwDTbSpl/yxFY2O4AN9ybN3jxtfhFRglX6NnVIPf2/H2mxESzS?=
 =?iso-8859-1?Q?s97uUwmWj9ZwEzbtSk918Yg97GmXQJ819gi/HCyLisWgVehi+yDENN+xa3?=
 =?iso-8859-1?Q?Ceu5nt95/YE04dX8lWBF+8AowlNFyMrV6DibUSm7PG6u46SGxQ87bP7oCN?=
 =?iso-8859-1?Q?PedbIkdexPHydo6irVilGRpYBxxO7JVjzD1brK664e1U2+YXoPjCc+Ze4c?=
 =?iso-8859-1?Q?TnETQJOw4rT1eKsW0FcvBo3oYgplFHo54tZmr+ugOmo4dlMRioeBCnCwg1?=
 =?iso-8859-1?Q?+x4j5mz5zhG6yddleu8HSGOKPM3V9THWfsJln4NSw5CaBXyQJu4myzZTwo?=
 =?iso-8859-1?Q?kBU4WoyW1fTjTmPkjddi5zwTNvsd985/FRfb1AIeQlTGRPpdVNesOhWHin?=
 =?iso-8859-1?Q?YTMQQcH40pBPSeSo9pfWyBNI4mtnJrZmIVZ+pY1Krjp6wvEdPF/GqqFqg+?=
 =?iso-8859-1?Q?ONawjhL/J+5wv7PXfqeIYFZzzVEWJkdgqKX4MQma3gYI6Uqdt1XgoE9zbR?=
 =?iso-8859-1?Q?e2PI+f1oheMEffghN0CldJ/Kcv0xEho9zX8wuSut9xk6FtD9GOWykgBqqH?=
 =?iso-8859-1?Q?p3sPqEQKdGSZ5smRRgyNE13+zo20PderYMU9oC2Hfb8+z3HQEdrr5pLxgW?=
 =?iso-8859-1?Q?pXB9LBqVVxCd5OsORjI9nqSjopjGbtGhKRDaAth5Un8Sb5ZPYDaKCS0K0c?=
 =?iso-8859-1?Q?/4/E9c/ldz8yzVPm1lNeKi5beuHhsEx5mXS3+h/DCsY8Ct3aWOR8TPnwTE?=
 =?iso-8859-1?Q?qpouvfOMOTF8vqnb6D0wBIu0Fzw7k2E7UbD0QuqCE0AVWVJwVgzOT6ul+j?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RZlbmlXklpPLHxbtEG2h67xq+ywdILAL7DZNShAzppQuQA7nilz6VoHquc?=
 =?iso-8859-1?Q?KWsxOdy2SXvppZQwQdMS9JNjDwIuWwKKeybb1QX7KPxTaKYIlkabon9A4k?=
 =?iso-8859-1?Q?yDxYarzPk6L7eKNAjV4zNO0nmYsWYu+DwlRUePzP8OCSzn8JZVUJ5SSpvH?=
 =?iso-8859-1?Q?IhRb6hDDBqwHWX5r3KvvpxtuXNmeFm9JjeBm/g9FVA9GcK6Dfg2gTMOtrm?=
 =?iso-8859-1?Q?aqwdL8AV2QdI/g09VzKEfar/oWVVW5f5RB6kDrGIhKqYnGt5jQhv6Rg1g2?=
 =?iso-8859-1?Q?MKJy/5MrrjuBs4GM87nW11aswPbTZCd7gWnB5wgJXZF27KUWxETfAdCs3R?=
 =?iso-8859-1?Q?8zdeUQK0FpqaHF4KgageZsrYuguBg4ts0+B3yBqGpBgK1xJnv7UxTzxb7W?=
 =?iso-8859-1?Q?oxsnl6UZQmJuKFpL3dRVbECwyB1c8lfZ+bBFJcMGt9FssjVMeViB90StQJ?=
 =?iso-8859-1?Q?+VpENMu9gCAtJ+M02ExEb//jbGoJCAfliumFJbCKW69WgYu41ASoxPmqt+?=
 =?iso-8859-1?Q?8iuH6yOKMTqgzUAADMFIvE0L0OMYScgj4Wijw+3btIZ63pc2imGbB3UH9z?=
 =?iso-8859-1?Q?YrHRKPyjYEILt9PSTY4wsTm336sYa+t91bSH4r/u8724K/JJ0G4s/SqAfA?=
 =?iso-8859-1?Q?h23kqhDidqbvbylzjGaTIawRe8nIYNK7nhfTwNSfOxWoxMfs8UXfsk4w9z?=
 =?iso-8859-1?Q?/LApvESTv9Si6j9bUme59gqRIpbcgelKBltt3aYh68GkoDHjZH+uVGdlYc?=
 =?iso-8859-1?Q?vS0i1t16IUhlNL4XKKrWBIB0/IN2nddNzPt2QEd04QGLAObwwg2nWeOw55?=
 =?iso-8859-1?Q?IXlMEcwIdWuJn6oejxe7w79Dt0IeMgv0gNJI2BIphOAoW5GW0UT64UUdzL?=
 =?iso-8859-1?Q?FBgGfs3otUG8pkb1AibtiRd6KnjVRlv0QjUa+Ksxp6DM75EwkUhGQ2lL62?=
 =?iso-8859-1?Q?HSHWtC9kiKHMzMPF9n6pKE9b3OAGAuAGWfmenVVYXi/OJDA19tb88WYaLD?=
 =?iso-8859-1?Q?xa3mUDO/NifFVs/yVE6SX2fe7i7gGuS9OOzoHMS+u2TkYQn7+GYrgkYMUp?=
 =?iso-8859-1?Q?AZLVlpbwM0/qMQa6FRRbHuUmyk2vcR/OnEmi1ODdEBTNKFcLZ00iWpdNqH?=
 =?iso-8859-1?Q?kKdzQcq8A4Ougf33xz9VS8ZemXVITU+u6x9j9b0NCV//qQ7asQkCYpNHI0?=
 =?iso-8859-1?Q?ZG2GAI1FOx+5i+BxFmPDAGhD8hHZadpJxQ563pShVFCPEt5HQtFs/kj2EE?=
 =?iso-8859-1?Q?MdPR19qZCk529MzKstqvg1R2vnCFcE3ikBzG8vgq0KK8y58D9QSzF57hes?=
 =?iso-8859-1?Q?Oca80YDWKRWegLwYcXSaGELjkZ4QdOZQ/HwSDsDgIoChjqfKKtUxgGByCK?=
 =?iso-8859-1?Q?f2qdjbl/3SQsbH3arLaklNsPV+54OWhA2hCdGlNtbb/fdgZ+uipESFo0L2?=
 =?iso-8859-1?Q?EE6hxclfz0jf9ONlIeRA/3huera2jM/BgDYMLwEAFB9p+xwg6xhf3TZoqh?=
 =?iso-8859-1?Q?K2MZH9NiSTd4oiXNx1CTgYl417/VMNCUXXNW9Y50PlNYgtppdR8xuhdIHO?=
 =?iso-8859-1?Q?lJqMdanEVf+Wk79jGb/3LbRu2tfFmO5gsWDlh7a2CWfeOkfK/DFbiZTDII?=
 =?iso-8859-1?Q?mSU9vs7piIt1dx49PRRsrDnTuE8nJHikWLDV+GH1t2ZkpgCn4vtJX6Bw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac5bdd9-5828-48a4-7399-08ddd684531f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:03:17.9158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1ojlUBlTUIX/uEpYQBNUvDhVgZFWhjVjif5NiQsCfwszLBwxIRtpC4pRKA4mmFutOrUUcN8t28B+ityaQPETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7165
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

On Fri, Aug 08, 2025 at 05:15:29PM +0530, Poosa, Karthik wrote:
> 
> On 08-08-2025 11:07, Riana Tauro wrote:
> > Hi Karthik
> > 
> > On 8/7/2025 7:36 PM, Karthik Poosa wrote:
> > > Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
> > > powerX_max, to the maximum supported by the pcode mailbox
> > > when sysfs-provided values exceed this limit.
> > > Although the pcode already performs clamping, values beyond the pcode
> > > mailbox's supported range get truncated, leading to incorrect
> > > critical power settings.
> > > This patch ensures proper clamping to prevent such truncation.
> > > 
> > > v2:
> > >   - Address below review comments. (Riana)
> > >   - Split comments into multiple sentences.
> > >   - Use local variables for readability.
> > >   - Add a debug log.
> > >   - Use u64 instead of unsigned long.
> > > 
> > > v3:
> > >   - Change drm_dbg logs to drm_info. (Badal)
> > > 
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical
> > > power")
> > > Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> > > ---
> > >   drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
> > >   1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> > > b/drivers/gpu/drm/xe/xe_hwmon.c
> > > index f08fc4377d25..a43bc8b91fea 100644
> > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct
> > > xe_hwmon *hwmon, u32 attr, int channe
> > >       int ret = 0;
> > >       u32 reg_val, max;
> > >       struct xe_reg rapl_limit;
> > > +    u64 max_mbx_power_limit = 0;
> > >         mutex_lock(&hwmon->hwmon_lock);
> > >   @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct
> > > xe_hwmon *hwmon, u32 attr, int channe
> > >           goto unlock;
> > >       }
> > >   +    /*
> > > +     * If the sysfs value exceeds the pcode mailbox cmd
> > > WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
> > > +     * max supported value, clamp it to the command's max (U12.3
> > > format).
> > > +     * This is to avoid truncation during reg_val calculation below
> > > and ensure the valid
> > > +     * power limit is sent for pcode which would clamp it to
> > > card-supported value.
> > > +     */
> > > +    max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power)
> > > * SF_POWER;
> > > +    if (value > max_mbx_power_limit) {
> > > +        value = max_mbx_power_limit;
> > > +        drm_info(&hwmon->xe->drm,
> > > +             "Sysfs value for ch %d %s exceeds limit; clamped to
> > > supported maximum\n",
> > > +             channel, PWR_ATTR_TO_STR(attr));
> > 
> > Why semicolon here?
> 
> Used it as I've joined two statements here. This should be okay.
> 
> > Expand ch to channel. Unnecessary to mention "Sysfs"
> 
> Line was length exceeding 100 chars, so kept is as ch.

What about
"Power limit clamped as selected %s exceeds channel %d limit.

?

> Sysfs is a comestic change, I shall take care of it during merge.

We do have some exceptions, but we should always do our best to avoid changing
while merging. Taking the patch directly from CI ensure that we won't
accidentally introduce build issues (yes, has happened in the past) and also
will preserve best the history.

Thanks,
Rodrigo.

> 
> > 
> > With the above changes
> > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > 
> > > +    }
> > > +
> > >       /* Computation in 64-bits to avoid overflow. Round to nearest. */
> > >       reg_val = DIV_ROUND_CLOSEST_ULL((u64)value <<
> > > hwmon->scl_shift_power, SF_POWER);
> > >   @@ -739,9 +754,23 @@ static int
> > > xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
> > >   {
> > >       int ret;
> > >       u32 uval;
> > > +    u64 max_crit_power_curr = 0;
> > >         mutex_lock(&hwmon->hwmon_lock);
> > >   +    /*
> > > +     * If the sysfs value exceeds the pcode mailbox cmd
> > > POWER_SETUP_SUBCOMMAND_WRITE_I1
> > > +     * max supported value, clamp it to the command's max (U10.6
> > > format).
> > > +     * This is to avoid truncation during uval calculation below
> > > and ensure the valid power
> > > +     * limit is sent for pcode which would clamp it to
> > > card-supported value.
> > > +     */
> > > +    max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >>
> > > POWER_SETUP_I1_SHIFT) * scale_factor;
> > > +    if (value > max_crit_power_curr) {
> > > +        value = max_crit_power_curr;
> > > +        drm_info(&hwmon->xe->drm,
> > > +             "Sysfs value for ch %d exceeds limit; clamped to
> > > supported maximum\n",
> > > +             channel);
> > > +    }
> > >       uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
> > > scale_factor);
> > >       ret = xe_hwmon_pcode_write_i1(hwmon, uval);
> > 
