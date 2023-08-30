Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C67C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CCF10E5D8;
	Wed, 30 Aug 2023 21:07:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD1110E5D5;
 Wed, 30 Aug 2023 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693429652; x=1724965652;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rXFumTk0s/XFcE+2OrU0tqN1OTP9l9QE2SX4hdRAlIs=;
 b=J8i6wkTXU+822zjwasZ6AzUftB/zNGpeBrZ0GJz4oGrrh/5d8NsMJmRq
 pjkmXBBw/WYZ5FUx0vgwsmiwJhXgJNQzEhXF+XmxfTTA7l6v/WjQMAEYX
 zNdozm5xzrVaFrpxN6EafTiqBASVOeDDeBrtBlN1mVaC+ZCo3QYgp1BWB
 Anvn/2kmJjt1pJbXRGpyItysLVGB5aRx8ZrH1K3nyYqlhwS5P3+Fs5kTo
 HezxCmoFi9VyCpU80KoX1BtJfVesdpiOvTdjbjKTCEYtooUMvgwklytH6
 YYAujM5wAeYur9fTxNbeoN7wDm56AGzONt8mq9FSnjO98mXylXbDZ88hz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356065999"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="356065999"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882883050"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2023 14:07:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:07:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:07:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn1o9QT7GrnbPbbtH7H5lzg/ZtnFc1A2dB2ACCIQUm5fqYTFIiuU7lfCPqH9td/T8KqHGsW7Kpp1E9haPa9/dW8c2QjH4D5TcgHA5ODqy/DPsJqPocrhmi7Wq4tAlJ6kKPHEH57eWXe49ovM8TNx83BqdyT7N4xQruu+ob6k3Ie6451cE2pFbIrmXaPHOfXCdFemekkY0juP4JFraUu9Zy7XKUxzPeNgt8nzTQzEat6+BwSAoZKlrSng4IhgWEb5RklEjJ1tBV6/n3mDP4L4OztYMzs4FYRZ6/2S2+uTUqnmWVptzCU+KAS1xJJlbN2MZ/dMI4wdm5debJbCRmEtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w84eRhKiBeWwv+h5j8iePkiJb0EwNgVpJg1jH/8JjF8=;
 b=eZx1g+qdUrpqDM4qcSr7HoYeXRJeGM0ghhGp8ex90zLhYD/+6dYH9iAnhZCtg18C0PeC4QLWxtA6vr1zMpjh4Bqf1u53ftjlZKo7TCbMhP+0yEhD+cTza7Z9WHIDBN8N+GBl2RYtAbeMCvUGWfJQOs9bKN8ddXhwXJ7EZI/MQqLnFCAMUwhV6pRhI0gGOpkNvmdwqFaQMDmvd7CG5tRkwUHKIE/ofsaSra6PRm+6r9HKfLiAfDACLq3J5vtjLaW5ByK/I8AcKW1Kn3H2EZEilk+vcqeF11l0LoEtFAc2sFa0rJVV+XPrIESJrfEJ1rCtVAXGnVcUPeqTuc2kisjj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 21:07:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 21:07:28 +0000
Date: Wed, 30 Aug 2023 17:07:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZO+virfAA5GrPPHE@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3b122b-2d7a-4e3f-ae76-08dba99d1d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGd0JYKMgMdhaXMnAsssBn2Vjc1vDYldDQ2Byk1ADPk1GorIPwShcABrBQ0LJVgR2DgyKjJ51OYKckhbIXmVDH950xhZgBNFeyoD8CjP4I11K+yfBzYoibPoaOPV08jphXtFAi65+s4ihgGLqgo1vgR8N/QbCYeTY/4hPdeWoVDe/Ou4itFRqBd4eHdNLTGhqE4k6SX3JZxBwfgP0k+2GRPPtT3CZcUVBK1avknYb3nyl2Gxg6/FnPJgAOrm3wVF10jSn9NHBo+LkRL6IFxuWxzXJ/Y+Ksq4H6m/zesTHIxfMNM1CvpBNMeoKLj/O730XVi8vCfw5IXSMaN0WvMvSNMEoCgvBku89v6sdcUeM0sFix1Y3cCDpEW+xoAoh6imsiM6G7RJJ0LJGW68xB1cJCQYlXVB+LrtuYte83uI8NoqMRuTT74k4mikjGKusHrHV4Tpkl5+ZwiU/+ZqT5YLaO/Gp+1H2RGOQc5mqPMrSsrUyEoClr7yTXT395OmXGRf1qU43CIbx/vULNk8e25jy/nszxKmMgw8Xkfl1M07HXRJgzexoV76zFMnSmKDUKnND9Y48DCzUdVORTOjz4uMiiSwrZ5qkssqD/oquVZpohM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(186009)(1800799009)(451199024)(41300700001)(26005)(6666004)(86362001)(38100700002)(83380400001)(478600001)(82960400001)(6512007)(6486002)(6506007)(2616005)(4744005)(66476007)(66946007)(37006003)(2906002)(36756003)(316002)(66556008)(5660300002)(6636002)(450100002)(8936002)(8676002)(6862004)(4326008)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pDbTl2UmhKZU05aGJDNjdmb2Zzc1Q1NEhuZnRKVE5ieFN3MHhHcUxtK2dq?=
 =?utf-8?B?aDVVYjNwUmRUVDE4aXR6bU82cVhaWENyUzhmZ2ZjSnhUcWs5Zks1bmk3OWlR?=
 =?utf-8?B?eTdxb0hCTE56ckkyQlZxQjNYOWgwMEQvOUFvT3hhYTk3VjF6VWhmT0dxU2pk?=
 =?utf-8?B?MHJpTWRUZWtFU0ZueUNkUE9tMkhtdlF5c013bnFWWnFkOHdWaFZLalVYQUVw?=
 =?utf-8?B?b2QzTWRBbjZqTkdVY09aek9zOFNtUzlnN0ZLK1FJdlJNQmVvWEhpMjAzVEZQ?=
 =?utf-8?B?UXJxWkRNci8zd1BIVjRsZzl4Y1JTRFIvMHdYMlA5U0RaR2VUNDhiRndDR1Nj?=
 =?utf-8?B?V09kZHJsNzlnR3JwaGhNN0NLcFhkZndTUXJ0TGlmQU9KWm5vc3hRYno3NHJp?=
 =?utf-8?B?c0lTVEd3akpWTDBLVFhZTDRTSy9nTHBUaHRJdzV2VDM4N0tNMy8wdXJjZU9E?=
 =?utf-8?B?RU91VGFNd2FNb2RUK3dKNm9rcjUxUlkvVmFRcmJldnFPMlRBclpqZE0vN0Yr?=
 =?utf-8?B?V09OT0dJZDVIZmNBVDk4MnhPd3lYRENNYkxSSjVLTmNieTIwM0pueDd6aE41?=
 =?utf-8?B?dUJhakRKWFNHMU5GbE9yN0wvQ2NKTVFvaUFYRS9ULytQcTA2M0loL2RCa3lO?=
 =?utf-8?B?bkRWN3ZiSGZnODFmTnVFRGVGTlRFOTFubU9PeTVXVFRxNStRQ0c4RFhUWmxY?=
 =?utf-8?B?dUJFTnNJcGI2NUl0VGxHckdRczJ5N2V0UE1oYlZYY0dGOEtDVTJhOUlUZ1ox?=
 =?utf-8?B?SXlFZk1TUzlLUGVYb1c5YUdCdEo0M3pQSUoybksweGhoOEdlTnY5YURiVVpu?=
 =?utf-8?B?V3lxeTB4R0xYbGRvUjVsanR0a0ZhbG40MlI0YVp2QWlFSCsxdDdvQUduUndG?=
 =?utf-8?B?Tys5TkVHTnhUZXF2S3l3dXF0bFQrQ29ZTGpjNFN5OEszSUdRQk12aXlPckE4?=
 =?utf-8?B?c0w3RG1vU2l3ZmNEY1A4UWFGWHdKeTBXdlBoRktwNVN2YWVuVCs0dDd0WHhH?=
 =?utf-8?B?VVN3UEJaZnRPVG9GZkdtUVlPUkI0Vk1qTVhDdGxzZjd6UWNmVEFnS2NCZ2Ey?=
 =?utf-8?B?ajVUb2wrQ0dkL1VLamRHV2VnUitVZ0xtZlJSNFlTY1dVU3pGcGpXSmNvUjJt?=
 =?utf-8?B?bUxrMWp4K1UxcjZXODNzK1MydlVoK0dWREZZS1VaOVFaMVFXWXNhZVFKZERl?=
 =?utf-8?B?VlpzaGpDSjVsd3BJbjVoK0JvRFdCTUNBU1VEaGRSbEJzWm93enByKzJjeUYy?=
 =?utf-8?B?ekQ4THVnSmxybmlKNEUrQm14S0RnaTU0R1VFUkpiUDVyNmZRSVp1Q3pISWdZ?=
 =?utf-8?B?d3NyaERid0FhcTJnZGJINHlNaUFMYUo2VHBpdVhZTG9iOS9GNUFuN0x4Z2pM?=
 =?utf-8?B?ampUTHhNdDdMLzB6c1J1dUZJaTE2ejk2MDUxMEUyZzFNSWxnMi82bVluK1NZ?=
 =?utf-8?B?UmpyOHZKRDgwRFdxTjk4czBaRjNOQjhtb0I1Kzg2RVFiN1BzTVhWUlZ5eG85?=
 =?utf-8?B?ampvTGlFQzhPQW9hZ1dRTHlJNlZQLzZCMVhRcjNjaWpWbkJFemRNREhUOHM5?=
 =?utf-8?B?NXlEWXp5QVdyUjFOaHFod2tYSWh3RC84aWtiRWlkSlgyejJNTUptTWw2RHNJ?=
 =?utf-8?B?RW15LytlR2tLdnRxeFFYQVUybHY4NUx3aVF4Tjd5b0FhT0E1bUJZUnlqVE55?=
 =?utf-8?B?QnZtMXl2YlV6VGo4R25LZm1SQ3Q3VWt0VmdyTmpYUE8xdHp6ZDF5VndqNWc3?=
 =?utf-8?B?OFhqcThmNkVzVTRjaC85ZEk5elRVVXYrcWhpWlhXTVNJVm5YN2xTZG1HL3Jy?=
 =?utf-8?B?VVR1bXlrY2szdFlSa2lRcW1yb2VSamFSVjltSHAxNXNJMGJsV1l0VUdVWkxj?=
 =?utf-8?B?aVR6QUVSME9PRlM2YU9KVFVjR0VySnVTVWpjc29VeDJ3akc4WjI4MEQrSTJp?=
 =?utf-8?B?dkxCNUVPWTl5S1RndU9TTCsxS1BGdDhucC9tbzAzZnBlYzh3UzFkenlta25t?=
 =?utf-8?B?T2pIdFIxTlZQNURDZnp1ME9GbktSZ0FiS3poeEdTYmhJZXZ6amRHTEt3c0NC?=
 =?utf-8?B?elFjeDNvQklnSGUvOCtDZHFZWHBJZXhnd2JuNU9ablVoT1pRWTVWOUxuRFAx?=
 =?utf-8?B?RTBNSkV1bTRZanEwbVBjUkNXdmVERnJUUUkwZERmU2hWQWdvOHYwRitobkhZ?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3b122b-2d7a-4e3f-ae76-08dba99d1d98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 21:07:27.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1+IBxeMwT0PC72TWQT1qsHLywM39T/ng2F6S99GMS+dR3SEA0OC6a+iGIqC1neF5xrQSblmLYxH48d22Sq3iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 0/4] Add LNL support to xe tests
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 07:11:03AM -0700, Lucas De Marchi wrote:
> Add Lunar Lake support so xe driver can be tested. This brings the new
> xe_pciids.h from kernel since now the PCI IDs is not going to be added
> on the i915 side.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
 for the series

> 
> Janga Rahul Kumar (1):
>   tests/xe_debugfs: skip page table level check for Xe2
> 
> Lucas De Marchi (2):
>   lib: Add xe_pciids.h
>   lib/intel_chipset: Add Lunar Lake support
> 
> Zbigniew Kempczyński (1):
>   lib/intel_device_info: Add blitter cmd info for Lunar Lake
> 
>  docs/reference/igt-gpu-tools/meson.build |   1 +
>  lib/intel_chipset.h                      |   5 +
>  lib/intel_device_info.c                  |  14 ++
>  lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
>  tests/xe/xe_debugfs.c                    |  23 +--
>  5 files changed, 248 insertions(+), 10 deletions(-)
>  create mode 100644 lib/xe_pciids.h
> 
> -- 
> 2.40.1
> 
