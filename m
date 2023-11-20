Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41364C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 16:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1A10E088;
	Mon, 20 Nov 2023 16:52:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647BC10E088
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700499153; x=1732035153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GQugsdaJUKMNgF1ks3Zk2c7lCV7UCCIGmnMEtWfl2zg=;
 b=Fs5T0Xe+QlO40bYKP8ry7xbmUJ9HgfJ5FPm4FnfCGO7Ebso9qvaPL5iU
 YHhyLupYP7hF6sOHd831h5hxXtztNhSFOpUptLoA+OlsReDmHxsqn4XBt
 ArMlONvkVSabyvCPMzqmDbiEnqU0gK+w0FzyIHrg8rxf/AnoDXJHcy7vP
 VygnyhBg9TC4wDtTygMwrnqC9SFX/0W+FuHd5P8YovbgwRpLwGKgm11/V
 9/tu0sCU7vgQT+abVgSQIu0iIhKrHvoumG4tuDgVFWrTX4UgzWI81JV3A
 XsAoDgkw1xky6DNvoMSd9T5r2WOYDl+xswGLH1ZqLou2eiWymSv0P5O0x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376695972"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="376695972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 08:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857042216"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="857042216"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 08:52:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 08:52:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 08:52:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 08:52:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsJqvfNFb+JZBdKjOZdTKYWE5+kRlZQRM5DxyzBDykYZcI7TRUBkFxDGPthGHM11JfIMCWn8QMFHC6Tek2mOlRW5dfnem2C7si3hcWnbo1Acyho+X6rfaRA2Zq8JV/AZYcSMarfbWvrxO8h0/R7nHhKKOfBEOhkd6lQAsVC2/dFKHQeuwf7abM3zO3SA75DLDvqLaBfKqf5RH6L75rotwQlcuts9cz5Q7mruA0Yoo4qls4/oPMmWbIRoS408p0kSwIEOSVywKL9ooztGcyUHNwlwCrj90KoV3QXIGjJFtAcLLtKKupqjs5AX4CuGOMT8poQiRm7DZqPYnlbWl7ZNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CQLZfgxYXgO7S2+89okVz4cpuI8Y/GBqlvaP4x+sj0=;
 b=jy2tzGh6GNAvbF/8fj74aTijYKtICuAHdXmr06ncagMjpqxPwAawmj+qo61hRxPMre9j2suScm98I2ueVYpYpzGar7x4G7GrchIQ9bYC9E5NsQiZ7pSin/sJhCQxV20Japno2h76N6KTVBJVKcoTgeTidVl1T1RPJIJ0MXqTEIy6vOBUmL/fYInlcQv3JFB55d+y1JOxkRcGBrwXY0gPxL+oob/7SlhoTlakOl0QCriu6sFojASdaa7Kq9TzFvgTno2l6MC23PyjoSuGga4nmvAoEjqkoAHmsXBKoz9Db78GM1HBSZN6sk/ougJh8j1j1guVjHhSSoMneJrbybQr9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 16:52:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 16:52:28 +0000
Date: Mon, 20 Nov 2023 10:52:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <6guwvql3sqzb5xjpqnlcweg6hcdpcerkdmjmta3joo3yw26dia@2qwqmihslbak>
References: <20231117174049.527192-1-lucas.demarchi@intel.com>
 <20231117174049.527192-2-lucas.demarchi@intel.com>
 <20231117182231.GY1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231117182231.GY1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: c4daaa0d-6132-4a59-cfc0-08dbe9e91442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMwdaW679y12EpkxdXksqTTtA8Gzc47U52e6FVrTfErFSrWa+GQkeGZAGJzK3pwQtlRgqtZfIZ/8CPA0xOkWCD9/vgZ5+G4mSAJtbvzXMjBOD3XYBnPB3ul9VUytC+0f41N2Am48sv0SVz6dc2JrX4KDfLpVhrmOPplKiX4cCJS95erKkhWTGk+7bhIiDqviHUVmwiqBSwD+aLWkBRC8d9ZVgBoD5TeRLQs3cOtM6Hck7brs34SV9uWvKK9mETe0XTs++KDTaQeqkbxshKJ+BLeoBL7fCuQgvo5SIl4WgQ+9/KWPKTF13X5A6loBe+SCUmffPNphtsX33Tv5zZ9qKuc3YB88s2kd0FTdFNfkt++P2+J2EGuhNTedj4FnYePr+LJly5aa7l1JuNJ9E4/JyfHcbJgeSrfKz7612zteYEsb8VGdwk25wSH+vuI6tFxfBKChqWkBkJ7e2x5GXtiKQrqoA1dXw4oCYZlG1tanJ44Z3u+3Ox1zxupIkmC3+tBPadr+foKo3EYj8dqqbFYm9pzWvLleXdn17JY5HFyyKo+gfysHrb+rqUsuo1pUS1xM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82960400001)(86362001)(38100700002)(33716001)(6636002)(316002)(66556008)(66476007)(26005)(66946007)(478600001)(9686003)(6512007)(6506007)(5660300002)(2906002)(6862004)(4326008)(41300700001)(8676002)(8936002)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUQBZEY8iSlaGU1xQUasc2HJC8CH9HT5rClzc5rVm6cFLn+08CsT5tLdLaPN?=
 =?us-ascii?Q?rGBwFGROcnZ3GOPFhOOKoSe0cHyhe8TA5EX/XGooBkkchLGOtBN50G4KMDtr?=
 =?us-ascii?Q?PDebtFHxY+JC1IYuMh+XbIF0kvlAxXuJPiVQYPAtwYj+kkHyZOo3GBjG4JZz?=
 =?us-ascii?Q?rOcldPn0NcgY5bG3V+fiLJnGWUeFgaaQuoAUvlXXrBFsNsvwplUVGBhlfaPX?=
 =?us-ascii?Q?mC51r8XO55jGjsvdpWd4FOElOSmRRltvCCIyFXyrUc/ZHP8FXnZksVi4iaSJ?=
 =?us-ascii?Q?kHCzWib9f4q3nl+ke4Bfpsdezbw4AnJNbb/5QxmKDWdPbUe8xPQrRC1oxp3n?=
 =?us-ascii?Q?JTmvjEaSYdC3jNlPqeAuJhtSNLLXmTnxRx21KO1QOEdWrscdtWcpx4JPRV1+?=
 =?us-ascii?Q?PgNciKpcILfOK8UhjOGNvq77rS4l7xVGtGQ7HSIyrlznZNM96aI5M/W99XyV?=
 =?us-ascii?Q?WLkCv5DmKvUrUXYlq9ms9vqQjDNX5K5mSMbJBUC8V+EdBNHa7qaB08ztPOHt?=
 =?us-ascii?Q?evyDE6pm4/wUIqkAhTjmdsXkhb/a0yINkSWvpXTnwCzMdrPn+1gPGk/p0vYL?=
 =?us-ascii?Q?iUPbsT/oCbBw8dk+rsLki4kLxuSNjb0Vf3usS9VjvYDjvp+UzqMHW5NKjOCf?=
 =?us-ascii?Q?gkfdrKLtuvlqz9hhemQ+vaQFndX317MPWTiVLefV91oAs769eby/1lVVDTHa?=
 =?us-ascii?Q?Er6b8kuG004jBLPHRva78qv6rGohK0pKlGvD3i58QREmInbTJHCNyMXpRiF7?=
 =?us-ascii?Q?xFfr80hVIr25sVkCcIL2Xpn9evjuv4+f5Rz0mVXCj1TtjWRRonWBzoYWWDQC?=
 =?us-ascii?Q?A2oObwIaE0z8gLbEwMknrbDp/bE+pFkuH6P9MF2vWELRQ5Q6cWKbL5w6kAQ2?=
 =?us-ascii?Q?uAEFXheF1wN+SlRXagkg8Y4WmhGvemDSALmKd0XKFIA89ew35dWO3PUrBekR?=
 =?us-ascii?Q?uHfhxy6P+9rbWleU0T2vDSteg9eZKXPXO7fyp0jnQjJ9d/GyKciP5QIiSVEI?=
 =?us-ascii?Q?XqBCz5/doOtgIy0zGcu8Zl2ctd9ORsa7Rq84TVSBiExHCThF2++G/oRiSR0o?=
 =?us-ascii?Q?J1DpcM5okv2LoEhiOzsBWXK1qGC0cyH+j+u7nOW9JP0l4A1Zk7Dk6nEBqg0Q?=
 =?us-ascii?Q?4dgOkWb/ySON3JCe5JelLKSHjpYSIxow/E1F7+D2q8AN3/6r98zRYYL1Pknp?=
 =?us-ascii?Q?xre7NoTGjfuC+QOrdT1/ejRmzk43HqNULB4myqpt0xO2wnNj/EPyGsMeKXXu?=
 =?us-ascii?Q?3Xf4f86ZJ8cCotl1XM+1WkYs38WQpnveCveapjcN7B9kxIxCpa31fL8Z4aOJ?=
 =?us-ascii?Q?nduQuTy3zEKBfVMG/par7TtSa2DwZ0gc+FwLG9e3MX0VBol9JqGNUmkTxwOC?=
 =?us-ascii?Q?D1IJkuB1GeEE034+XpoOZkBuz35gz4cF80J4doEWAS+r+q5JVsbWWpBdDt+Z?=
 =?us-ascii?Q?6/jNWgtvJnZVmmG2ioKxR58aWPI+XKJ1Pw3c7pitDkbEotzCH5svg35n+cG/?=
 =?us-ascii?Q?OgyIqQmj80ttEsbKHuxpHkXTq521HxiFcyz9a2QFA6MCu75pMFuLOPwZaSja?=
 =?us-ascii?Q?2tNb94xxN3oyKL7pzw2kJ8nJdkqL8ECXzEXgqCPMrmVQ/Dd2f8HcvQsSoqRI?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4daaa0d-6132-4a59-cfc0-08dbe9e91442
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:52:28.1093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ffzYE1kS/DHCdjz0x7rT+xi8jPG3/VJcmrHV0ubRU+QO8eVEk6XQ3hiWQXPrVhxMUCCvw5q6kp73YvHmw0ROKS/pTbMUSZRTCZP83gMv+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/mocs: Bring comment about mocs
 back to reality
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

On Fri, Nov 17, 2023 at 10:22:31AM -0800, Matt Roper wrote:
>On Fri, Nov 17, 2023 at 09:40:48AM -0800, Lucas De Marchi wrote:
>> The mocs documentation was copied from i915 and doesn't match the
>> reality in xe. Reword it so it matches what the code is doing.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_mocs.c | 30 ++++++++++--------------------
>>  1 file changed, 10 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> index a072fbccc693..daf5f2a8c40a 100644
>> --- a/drivers/gpu/drm/xe/xe_mocs.c
>> +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> @@ -123,30 +123,20 @@ struct xe_mocs_info {
>>   *
>>   * These tables are intended to be kept reasonably consistent across
>>   * HW platforms, and for ICL+, be identical across OSes. To achieve
>> - * that, for Icelake and above, list of entries is published as part
>> - * of bspec.
>> + * that, list of entries is published as part of bspec.
>
>s/list/the list/
>
>>   *
>> - * Entries not part of the following tables are undefined as far as
>> - * userspace is concerned and shouldn't be relied upon.  For Gen < 12
>> - * they will be initialized to PTE. Gen >= 12 don't have a setting for
>> - * PTE and those platforms except TGL/RKL will be initialized L3 WB to
>> - * catch accidental use of reserved and unused mocs indexes.
>> - *
>> - * The last few entries are reserved by the hardware. For ICL+ they
>> - * should be initialized according to bspec and never used, for older
>> - * platforms they should never be written to.
>> + * Entries not part of the following tables are undefined as far as userspace is
>> + * concerned and shouldn't be relied upon. The last few entries are reserved by
>> + * the hardware. They should be initialized according to bspec and never used.
>>   *
>>   * NOTE1: These tables are part of bspec and defined as part of hardware
>
>s/of hardware/of the hardware/
>
>
>Aside from the two wording nitpicks,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I fixed the typos and pushed all patches to drm-xe-next.

Thanks,
Lucas De Marchi

