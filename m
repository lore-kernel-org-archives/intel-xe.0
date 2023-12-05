Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00175C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 18:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA9F10E5B9;
	Tue,  5 Dec 2023 18:08:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3F10E5B9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701799681; x=1733335681;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lFNQSJuyrcq1E9JmDDKjWQGlztu9JwXglc/wypNb1S0=;
 b=KFNQgBJgvAJDX5t4aMdxI6sE5fVN8z6TWO5YkFbvmQNG3sPINZuF4XG1
 IxAtsMqSFMnDS6aOJld49d6b1AKIK327tzI2wBllPTO+su7os0NbbhFM4
 DslYtZTE30aurxqDwjA7WlwU02vKEUdpmLiCiuVa7Tjitkq9bPfdUbJPN
 6zqqTVkWbR47tl31QmrO38bIpotX9w9PNFY3NQ6DlDg7dzFkGt+ARXMeT
 rUZYB/RuwuvPBP7HagAnymz5bIge3UFgRasNIlYSWU+3GAxuTPWf0b6SB
 8xB7SoGPydmC696iu0Rwjr1eME9WwhQLmqQuoj12BCVUEXbEaOeUWVtjz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373388495"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="373388495"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 10:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841555839"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="841555839"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 10:08:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 10:08:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 10:08:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 10:08:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5b5IUXfHp9DU4LItwSShJdoxjwXoqaPpJHBwk/ZkSiVmRU3WJjc2jeSzWXHbPDWzUNgPKwN2GeGYFTjJWPgD6KljmaPORDKhPLTjGYpvqrcKFZGDODKS+djbZmSFrh6SGCQYTVhIu27DtDqdq6LkQ4/ZkArSI6bD0yT8yxDKs7laGegiSbcir3eYq+m/tRfSA1vX9GGrD7IrxWPry3VUOCi5SR4I+lFApRdKMmkxywhqyP5mDDQyAbLX+2J4h4GKwrAhi5VEMTRZ/tEF/9+mD4G0bXNQ5IBxmJSrHpMKGuOun5PNQJ/yCMYV4hLNPm61NhP/0/YwxycNOMRHzGRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIU6HyAH+pm3Wy4Pj6EP1KMdYcSFCP0e7PIkmghxPD8=;
 b=dEa+xPxWsAwHVJls7dsRAftL8APMu6TFI8QnywRaphCHB+yHZRB9/ovZFu2ISoLgjok4qbYsLJgp97EgYQE+1rdhqVCmeCAPzEyB8jrSXqbb/AmaV7Pz1Sr8+iYxkwMbAlV3hDeKwEUjxoarHLGOzHJ9d96r0A1AVL1uQeJbN5vglbRb7ImBFskugwP9xDa29WVHxT8TJCwEwt1g0Si0YsfhXLUfaQiAtzVhpkyLolRcBMj8u2pR4ozIxHtc6yZFrqmz2ZLT/7chKe7G1JqRhwy847dcLZ3Kvn4/AnPddjVWwMJhma6fr2XcelbEd+CeTwZsiKPkcuOlfim7x0OyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 18:07:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 18:07:58 +0000
Date: Tue, 5 Dec 2023 12:07:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ekkvdie6ymvosnnijgjgivz7jta6jykcgbtbwwfy4qt5uphqxq@ur7a2hakv3ns>
References: <20231205155820.2133813-1-lucas.demarchi@intel.com>
 <20231205172803.GV5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231205172803.GV5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 539cece9-72eb-412c-90d1-08dbf5bd1c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoGaomWtn+uuYR7jnRX/zUSoKYk/KVZpYS4UL0ocW1bS7qmuzosH3bXP5K6SQ07UUPXsyNQ8kdbus2+Xrt/FavGwOT3p4KxV4yTCRZsCm/y71TXyH94P+POlEvIaAoCiqJvcZ0MMeO0XNo1/jojdjbIFnZ/u6fOmLG+W2APy8mrU4mFPni2AHQ4qlcwsP1f8UoPqkUxiytF/73qKpAE/eeFV40M7V4raA/PPQsOQ9FeHCcqMENQcj9OvzFBunWhBPNmPx2DKsJh4hhcMO/T0bkO3+kB9qHo5+kqDU/Q4V/MOt67jm5vZMMsfONLZFG2lMKRzuOpPM0irF/gzCUdktByxXMBViYSJakJwb3R3ocwHCUh/tkLoULFiD8Wbxb8H1DxMxurGxPz+9Nq908yZWuIZWyuOz4vu39S6AafzuT33EIIKZsLnz8rK9uXUt78Hx5Sw1lBCh7jjSvv7WtfBM5EBiO1E3cgqo1aZhvBix+i3qYBdbaPDZOsjPaH00UIRKJuk5SKzf+vpuU5+m8S9AuCJFfyfX78HHGpS9q84iQD+ny8XjbTD/yrAyyhnGiEK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66946007)(66476007)(6636002)(316002)(66556008)(41300700001)(6486002)(6666004)(478600001)(5660300002)(33716001)(2906002)(4326008)(6862004)(8676002)(8936002)(86362001)(83380400001)(82960400001)(38100700002)(26005)(6506007)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6TNUCBxHOv1b65uRM/a/3ex94Kp/kKbtBsoMeLwzDfLs4q2ZqdrvhsS9XtTz?=
 =?us-ascii?Q?pj37mVBqfo7NRXl1BVy278G1VN/iYw0ygxHPr5PQwzM/h2Z+9f5WZ/MWDPiS?=
 =?us-ascii?Q?brHK56iXvnsCxYwhIAkQbKnmBwDCHPSQU/xxReDZ/XJNN1y7R+HFObv+TFpI?=
 =?us-ascii?Q?AkPA5zcGRIMgYcthVZf9ensvstfgf5201aNmYaOZYzVns7CzX/TfJRV6lFSt?=
 =?us-ascii?Q?qJQiS4GYRhcMsV9mK4px2Spa3tANOk+ay00BEjSj4lVaZvteOwd9NBsAqmCd?=
 =?us-ascii?Q?M4Vvf7cJSF1K+jEKut9/FThBwsrJn0QP9fkW+Dx+ddds1kP9lpNsB9GehMDz?=
 =?us-ascii?Q?ykjEEqM68N2Pjlc9LXTtjn16A59cd2J76lspAiO2mjpI7SSUpOA65VgZNJUN?=
 =?us-ascii?Q?WsA/aAfT1dP60ksVj8mVAxWJF8vvQtzB6sg4Jd6V7C3JoWDKDonT8Wg/p0FP?=
 =?us-ascii?Q?+pyrbO4NxaYfFONhRyPFtRNigRureUEBH/UfPZFkDmTM2PdFScyTeTUPyu04?=
 =?us-ascii?Q?1UeJZjYlY8+mij7904QtFyk7e2rts27qubg6nDVZqDT9gxKfZK9sQiUFNbYt?=
 =?us-ascii?Q?RFaBJ9eeo5bismMMDLAthDJPPESA0Ps2YNptQsKzoq6jn5/i+8mIp8qyp3iF?=
 =?us-ascii?Q?MV4mzEC5j9r9cHYiKGf0FBd7VqJ+/m4luTqaQpF/c072j1ARtYzveGlKP0lZ?=
 =?us-ascii?Q?Ver5TAc0Hx5aJxAHNMcuX5ze6ua2ktEO0bwe9qMeNBOHAOL5rst14KtPH0pP?=
 =?us-ascii?Q?nw/tD1iUseY++hiRxzANUXIdGlmCaDubzlLhdJCd9gK66u4H5D/Fo4WTMNd8?=
 =?us-ascii?Q?8xaapCqJ5qwHFvk+rIRvYo1pM/xxmaUekraMaoOO/F2w8rZ93o4+0EQvxpEM?=
 =?us-ascii?Q?C14y0fuH5YQrq5QdzUSpFTofXfHGTE4uUEaPkmMCdLbybvDZzvpH5gUxd7Cn?=
 =?us-ascii?Q?X4r1zknQ3ISYPpEsocvTkfEhnePcS3KogRahKxvmbgA3BnCI5jNdarunWpTM?=
 =?us-ascii?Q?ydDgpjm7j0pNXjysTZQVruzIhtiPtLhJjb1T95hJ0kdRjG7izO/SaHg2RqGu?=
 =?us-ascii?Q?YMbSHjdV4KRPvgodQFystC2s2I3kT3kuvi42zcljheRnQJzJUnTxUyoFnSoq?=
 =?us-ascii?Q?wIEiTf0B48x/j8yCBid3HayMgEpGTsATX8/YzrXOPfBvEO4LEAkz1aMJyYCd?=
 =?us-ascii?Q?OTa7ezg0QShHQ3njmOy9u+aIYoO/XeTDOb6lMYKx9e1oGl0fgaQi72qBpAe9?=
 =?us-ascii?Q?Wr3z2wzasuIArCOT4UPsBGEYdd4o0wQbd7L0o7xIRMi1bxWB4dGu6hSAxWg8?=
 =?us-ascii?Q?roFa+syMeLP2LtzI8Dqp4FlPtT38OjlewdPUhl+80WzW04TLB6XsUMKrQWfA?=
 =?us-ascii?Q?OqrikrLlvrWhbTHqvwlf75qVgCCkl2/tar5TC2AhP30ezW1CaKp5OddAboOb?=
 =?us-ascii?Q?jp9ODeaAejulnUgY29zPHlrMYvIM0Ug9ktoB0tlZUa6KAdKj0qQshCcIZacJ?=
 =?us-ascii?Q?MBrzc5RLJQ1C4hxSLAwDETHIVLzTOK8RQlvHnhsQ841bPu6Vr0NbGZvxKDUO?=
 =?us-ascii?Q?4SClU2xkLG4+eq2bFQHe+ZsCfzAnw30JwtfURPBkQV7ycPqQcopu1g+x85J+?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 539cece9-72eb-412c-90d1-08dbf5bd1c80
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 18:07:58.0298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZHYOyyx6brzoShiPww2YMDF3wzid9bNds5dJi1Tz2jOTlxnJqwhQN0ykhGJ+5u/U3Qlvq1veqckcrDt16R+Ry3BLHPjjPuIbC7gZrCILn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Expand XE_REG_OPTION_MASKED
 documentation
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

On Tue, Dec 05, 2023 at 09:28:03AM -0800, Matt Roper wrote:
>On Tue, Dec 05, 2023 at 07:58:20AM -0800, Lucas De Marchi wrote:
>> Expand documentation and add an example to make clear this isn't about
>> generic masks in registers. Also, fix the doc regarding read operations:
>> the mask part has no effect on them.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> index 6e20fc2de9ff..c50e7650c09a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> @@ -60,7 +60,16 @@ struct xe_reg_mcr {
>>
>>  /**
>>   * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
>> - * read/written bits on the lower 16 bits.
>> + * written bits on the lower 16 bits.
>> + *
>> + * It only applies to registers explicitly marked in bspec with
>> + * "Access: Masked". Registers with this option can have write operations to
>
>Unfortunately, this notation isn't always consistently applied in the
>bspec.  E.g., FF_SLICE_CS_CHICKEN1 (0x20e0), documented on bspec 55934

It shows "Access: Masked(R/W)" for me. Same thing on bspec 45921 for the
same register, different platform.

IMO if any register doesn't have the tag, it needs to be raised as a
bspec bug.

Lucas De Marchi
