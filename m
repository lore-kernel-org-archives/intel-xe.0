Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E97CD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 10:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C830B10E074;
	Tue, 12 May 2026 10:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea/q6c9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EA510E074
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778581399; x=1810117399;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=QBabNj+ddwdQ9oda+DAgPIgOpCnbW9qJt7WvVkNK910=;
 b=ea/q6c9IamvwZI2NNS+uj2iFOH86v6mIzqPozHI7jEDCWgcTYB+w40IN
 Hf3VFqHCSpGNU0H5YC8o8O3bp6si5sCpxU5ow4n9IddP4IAnyNJVQjdG2
 bLe5I2pmFOu3CTK6TbxV/Iy4By7u4RUgWDYnl2WJY/o21J6heiHBWg6nr
 1uEJZA+lruwj5JjFY/FORpKpjlGR3LlC7rHTzMab9ViQP0x1nDRRPci0Z
 jNlWvp5xsH82tuEC5zUdVeVdyk/Ay47WkEsVkTzquIUMNdAaGZyRkQdtc
 jT48l3cadtBn0VZeM3mnP31aGMIhtH36tWe/WGm+VjFtzNcWAbpZ3V93Y A==;
X-CSE-ConnectionGUID: 6LobueuqQNeuH2rfarlc1g==
X-CSE-MsgGUID: ZxGD2SLaQ0ubR/Q+KY080A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89788086"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="89788086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:23:19 -0700
X-CSE-ConnectionGUID: 1Z9nRK8MRhm7j10+pgfykg==
X-CSE-MsgGUID: cGDKS9oGRjilQfdIGSLlbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235061550"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:23:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 03:23:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 03:23:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 03:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi6MXjfIR2pbE6vwreY69bXc0sm6T0XX8CKHhc1nJxBlFzAScAPcKL/iJAukJLt5D5TvqV3sAK6tbwtxzX6a7QET8+z9MKzxy45hYw7nHcRCJ17BTJ4zlNT8kqY80L08HOyueLU11npFJmlN5McvQndXAp6vDdxH4KGfEaoPwrrGAHXWMcKLKQCEXdIv0uDQMb5Q7+beTVJZfongsRe1fKqNqXi8QpNh/ynxXiE8orqch+Nblc3awFcF0RC8s6f0o/5/9EaV9E4LQrH+ZGd/hT6Hm+lbaFr1+wutL9uGTGcvhmOPXZH1iWjoLLQEA62poduDP7EmUMfRN6B3kXYuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDDMO2Iqdq/DnoUfwxrHvJpUArQRz8VkV9kvW5DuRzE=;
 b=FoezmECdp+Iug1Q9gPNpXZYiWoRICtGkHTtAV8RLD3TM1jfxwbMDrKxuaGk6VSd1yxaX8kPsEPfhtdhLHHYnmmzp11lOzGI+IDNH7GXgZiaCX8KpvvsaS+hOMRA2EuXcLSw+AM9dUq44uPI7NHMlrveX8ot2JxnCuI+2rZn26hbSdr7lSazDxf4Ni6mWlXrYkNBW7LVjbVLH7gmK9zkyxvaqggBYw5KAG87V1KPpNxQmYjJXDlqNKxFuAGStUONkxFCfL2UOoWiEqij2N3w5hGKB1Ev2q770/4gxiJtyDg9D8csGHRPpwa6cWYjpaseewWNVHmhBCWKawBkTTiIKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:23:14 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9891.008; Tue, 12 May 2026
 10:23:14 +0000
Date: Tue, 12 May 2026 15:53:05 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: drm/xe/devcoredump: Drop a FIXME in devcoredump
Message-ID: <agL_iRQF1m1xaP4o@bvivekan-mob1>
References: <20260512055508.1380191-1-shekhar.chauhan@intel.com>
 <agLUJsi3ZoPFyc0j@bvivekan-mob1>
 <0a9d21ce-4af3-44a4-81be-dcf39d9f9cc5@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0a9d21ce-4af3-44a4-81be-dcf39d9f9cc5@intel.com>
X-ClientProxiedBy: MA5PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f5bd2d-d4c4-4575-e054-08deb0107972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 2aypGDYVqBwzLE9VUIK5mAMOUnlaEQimWiq5cMQcAWc8C3Diqv8CVEkm6UThDmn7hz5/kbiqZ3npe8LMi2uYbwTiPJkkti2erZvVkGX1j3VqrdQJ6VEu8022ZRsRDtJ8Loz/+NPSq0I0ZfWnCXoU4xBFGIuh6mmXytgrY9nl1o0dD3ITuEdyzTp79fgn7o/Am+87YGg4RJvKmMo0bCmPE+fPQcsDTF/qlXRsfoF02L/vDiv0FQO/eCyZlhYWNuLTJeCCI3Oijq8J0fl1/BcmEmpMWpaWwZy7IvRS+6iPfPTrB+D7e4dnlQX2lEx3oA6sB76i3QjemRBX2reGx5S8eNePSNmbUA8tUOrNu0Xfa8RiL6zEbKb/cO9yltgr4Sv9wKaABMc3U+Y78CDBexKLFNmMbEdFdxw1FIKHvjz3hRDx8A8x26HVzhkkabLSkA9yUcIMW8Rs2UFFr7h+wxoa7a9uf+//F0XPI8ohVDBsw08sINh1L7DhwbtpFkY27UAxmFAiteN0n/iCz2D7ykv4uVZ+uLb8eR1ghuDMT/Kvn8VKjuUR9oBASx2FAnPX8/v8JPoJGYn5Z7g2OQzmrRH0LjjWyq+Z1BxEp+/rQrhsIpnNMWpr7gSjeExnyDTWITA2cQ197TT+9aiF8E+WA4JXEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmVYUlE3dWpubFhoMko3OUlUdnI3NDRFdkZxU3VGeFZLejllZ1pRN3ZwY09x?=
 =?utf-8?B?UXg2czJiNWJXQW9yaEJsa00zeSt2UnlReS9wUDJ3VU55MktwQ1JRdURhM1lR?=
 =?utf-8?B?YjMvS0gxbjNaQ3hSYStnVlRMWGJzUW9ab2dyRDd3UjFoMjcwR2kzVEp2ZUhX?=
 =?utf-8?B?b3FuQTVBL1ovMkV2RW1zRlZ3VStQa25nYUdsd0xTQXBZV0hueDNBbHFwZGlp?=
 =?utf-8?B?SG50dFpqeE4rNWR4WFlYSmpMcFEvZmk0M3QrTi9XOVZaczR5dWNKN2tiVWN3?=
 =?utf-8?B?NWJMeEhmbU5WQkp4dXc5S3RkL3oxTXlNOWt1cVU1ZmRIU1p5NU9TaXplWmFF?=
 =?utf-8?B?NG11ZkszOXRpMDAxUWswYmF1NEU0c1k0eWFzWmRKTS9xSm5oOE1yVjZTRXp6?=
 =?utf-8?B?aWd6Y1JLaGpQYTBqYnhCSFRkNWpXazk3ZkJUdHJhRUROYVBHZS82SWpTaDcr?=
 =?utf-8?B?elhMTmEzeTFFSlp3eHNjaVBlY29TamNPQkRHSlU0TzFOa3d2ZE1qVmhoWEdn?=
 =?utf-8?B?eGMwV3IzbWZWMkdITUttU2xCTkJXNllYTCtCNWJFdjRQUStjSjdOUG5aUUJ1?=
 =?utf-8?B?VEMzMENDNEhCdTVBSjA1QjVjcmVNMHdiVXIzVnVnelJ2OHpmMzVTUHMvR2Jn?=
 =?utf-8?B?MHBTKzY0TUVqak5OMk9wUVlRL2VxdENpeUtaaXZxVUZMZ2RqZFlJVkRzUVFU?=
 =?utf-8?B?VjNqdTFtM0tMY1ZPb2VFWXVISktRbC9lRXZZY0duOXNML0piZ0FOckVMbUVu?=
 =?utf-8?B?QWpSNFlSU0dyWExjanl1Q2huRCtEOVRMTEwrWEhObUhmZERjWk4vdHl4dFJN?=
 =?utf-8?B?MExBaWsxYmh3QlZ4SGZleTBLYXg2R1kxOEg1TnhvOVN6Nmc3dGxQL2Q2aWtn?=
 =?utf-8?B?MXJTK2FOYWIxUm5BNGQ4UmJuOGFJZGNGNXY0TE9DaDBCd2lWVmRKVFNnYmZa?=
 =?utf-8?B?VXlrTWtXUDdPYm5nZ3FtWk9XcS9XZGlBSCszSlg0clF4UGFjd1FwVUJKV3Ir?=
 =?utf-8?B?TWV6ZFk0akY4enBFOGExd1FibjE0YjdNTGhtNnZJVHJ0NlR0cXFVUlJMTmFr?=
 =?utf-8?B?Ym9PWTBQV1MvMGZrR2JBdXJ3NXJtbVFqRG9mTWMrendiVWZhcHFwS1J4YVYr?=
 =?utf-8?B?K0poK0dqNHA5YWc1THcyMUlVSTlwSjhKTEhaT0tTMXQwVVZWa2dqSDNSQ0Jt?=
 =?utf-8?B?OHpyUVNMdVRlemcxbW1zT3BKSHJ4Vk1Cb0NReVBlWnpNMVBGb0J4RDNzU3pF?=
 =?utf-8?B?NklCb0lkOEFRU1pJK2RWKzA0L09wTDhwMXA1S210VjJYcHF4UmRRNllLS1lH?=
 =?utf-8?B?VDhEanplY0N4R3VWLzd5SS9ad3JVOHRxU1hXTGE5emQ4b0g2MVRZSHpCWnNt?=
 =?utf-8?B?d0tRVlVrT1RvUGszTGRqK3VaTEp3RkpPcG01RXZqdDZPQmN2eU8waVE5U3V3?=
 =?utf-8?B?UHVHZU9ibUVQVlZySHdWeGp3VVc5SE1uUy9STTZoTDVwVStIY0RzbDgyZ1Uz?=
 =?utf-8?B?NEhsNnhuREJSRmhZTW5nSDZLY2NpQ3lPbUE1eXNwcTBNdWh6QVRPZ3M0SEh4?=
 =?utf-8?B?TjBKcE1FazV4dE9LbWprUTVGcWVoZVlFbGNDY05CWFRRSStIT3VhVWlWTEZG?=
 =?utf-8?B?WjMzSXFnMHhuTzNRUEhPZGNCYUh0MmpyUzEvWG02QVJobHluUHNDUWVWWFRX?=
 =?utf-8?B?RU5tYTJrNVJsZUxibWRKWTExNVhaZEVYTFNMN1NLdjd2ZEhYNHVpRDg2UXQ0?=
 =?utf-8?B?bnRKOTVEMXE0cUhTbGd3cENzbG1xNnczU0hNdVNhTm9Ccm1vd0NaLzNGemdm?=
 =?utf-8?B?VWRqQ0wrY3Zqc0plMStSZlcyaUFSMUo3NkhFWnhlSEpvUWZzdmtrR1NtWjB1?=
 =?utf-8?B?MFcveC9DWXZ6SVV5Szk2QUg4VjUzQVoreHlnVEpwYjdyeEo2NDNjMVpQTWM1?=
 =?utf-8?B?ekNSWk1scHg1SEJNL3VrUWRxbjl5VXorTWlBc3ZDMmQrMzZ3NHZOWkJGNXBl?=
 =?utf-8?B?c3RFdnMrSDZ2N0FTNU1jZGM5S1Bsa3VyV0l3SHBsbUU2UVlHZ2FtNmZDSlZW?=
 =?utf-8?B?WTlabmtzeXo1dm5GR21UTkJNczB6ekpOaURoanhXbW93cnI2aTgyRXQ5ZUJ5?=
 =?utf-8?B?VkNWdzA4WjM4c0NScWdkemRhK2czRVZvazJqVlNyQ0hvV0QyWDBEZldQd245?=
 =?utf-8?B?Zm5hdCtMZDlMcjNIY0hISGM2ZFBJVWZsNWR4Y3k0WlgyWFhOMzlwNncyaGhE?=
 =?utf-8?B?dFI2enI3YXdhQmQ5RTJHNllacENIOE5pMExnQmYzSFcvZGQ0YVFwYVhBZDl3?=
 =?utf-8?B?V0FRK0RYVTY0QWkyYjFYQXd1TDk5ZU1zeldGUk1vZ0duWGhCVXdnRFVpd3o3?=
 =?utf-8?Q?rxYlM1sCvUFztVj4xyacuEOJaDVojFGsQuNPT?=
X-Exchange-RoutingPolicyChecked: i89huaGwGEQTL5esqxbUWd5UCZuxsNHduwXSlyj03ZpYsld4VopV9B28vBCaNmwaMirczFcTgWxZ5nUX2ele6l3R7BzJMve3mYtk80UJQooIenJyLFX9K2zYUqaUvwXsqzrurq1Dx1YPBQH+Rge6X6q6KflZLTuOJsz3mZLPa737zy36L9795UwOLGlfWtcgTz3Ynre0jd9lKPOxJ5pt+uFU8LK6arYxGmLizhPXzL0y3JKQajlxOTLz4jRhE+fNM80sKEKcdFx2gGIWmZ+9JwFTdeEpgj+j0ch//TNCXpHRG1n5gaWdLxgoTGFer1BJ4lF9I3l80RITehPu1hrJWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f5bd2d-d4c4-4575-e054-08deb0107972
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:23:14.1006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjsRPycMvlkFMi90qf9bGxxPWVQX83nEpUDgXsRSSA+Q2aIuEfGZN+TvOL6e/hLQ40yNdIMyivzaXQncMDfL2+8bkBNZubXntZogJqe0LvMXWHPc6wwURblzSdOoF8K1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
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

On 12.05.2026 14:27, Shekhar Chauhan wrote:
> 
> On 5/12/2026 12:47, Vivekanandan, Balasubramani wrote:
> > On 12.05.2026 11:25, Shekhar Chauhan wrote:
> > > The FIXME says that xe_engine_snapshot_print.. is accessing persistent
> > > driver data, unlike what the FIXME says that it does. Drop the FIXME
> > > since the current code is not going to access the hardware while
> > > dumping.
> > Is there any typo in the above commit message? Did you intent to say
> > 
> > The xe_engine_snapshot_print.. is accessing persistent
> > driver data, unlike what the FIXME says that it does.
> > 
> > After making that correction,
> > 
> > Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Okay, that can be done (although my initial intent was to keep it as "that"
> to signify what the FIXME said). But, making it as "the" instead of "that"
> also makes sense.
> 
> Since it is a minor change, do you think I should send a new revision for it
> or is this something the maintainer(s) can just take care of while merging?

I can make the change the apply the patch.

Regards,
Bala

> 
> -shekhar
> 
> > 
> > Regards,
> > Bala
> > 
> > 
> > > More details about this patch:
> > > https://patchwork.freedesktop.org/patch/703884/?series=161407&rev=1
> > > The starting two feedbacks make sense and the original patch is wrong
> > > in adding those changes, but the last feedback is the one which
> > > highlights the point.
> > > 
> > > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_capture.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> > > index bc49e40165a3..21f7caf9ea08 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > > @@ -1841,12 +1841,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
> > >   		   str_yes_no(snapshot->kernel_reserved));
> > >   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> > > -		/*
> > > -		 * FIXME: During devcoredump print we should avoid accessing the
> > > -		 * driver pointers for gt or engine. Printing should be done only
> > > -		 * using the snapshot captured. Here we are accessing the gt
> > > -		 * pointer. It should be fixed.
> > > -		 */
> > >   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> > >   							capture_class, false);
> > >   		snapshot_print_by_list_order(snapshot, p, type, list);
> 
> -- 
> Shekhar Chauhan
> Linux Graphics Software Engineer
> Intel Corporation
> 
