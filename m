Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAB9C77B7D
	for <intel-xe@archiver.kernel.org>; Sat, 13 May 2023 04:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CEA10E039;
	Sat, 13 May 2023 04:43:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BC110E039
 for <intel-xe@lists.freedesktop.org>; Sat, 13 May 2023 04:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683952983; x=1715488983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cV+shxLbdsBNf9/D8YtE+4qRdS/grwooMCd0J8W39tA=;
 b=OtgmUNh2/MBqZPTpua2sduLi3xsQKmmjQ6JdXpXl2qZOLtAs6kB/ad+z
 ElMoOywUB553YkRR0LtY7PCnKe+zHz9R9u/7Cpo+QX5XbK5yA/JOXdiky
 XMwdPK+7BydEaBnc7yrZSCsqXTKwtFs4fHBQIaa6ADgRrUwL8dDBlqfhC
 JirFwn1D6N5w8z0AVYxlyxgvGLX2ttp3JE1/PIJtvPrDFhAvbPBDZ1a1O
 8j7o6VF37zEMe58MPdBZK44mieIazjabjPJXJDhZ+PcN+lRTctiXEN86/
 9VBZMcyGH5tleaY7xGmK83TNUOfkYYsnJd5Ynwpa844qFL21PAakZmJno w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="416566951"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="416566951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 21:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677888659"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="677888659"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 12 May 2023 21:43:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 21:43:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 21:43:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 21:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCxeppZ06mcSjwLYiKt04Cw6ESE8fq6hCXJHo0pleBNDN61rLzrSPoUxN9X0P4edAOji3o7k0+F1cth9MDLTb4wpbCqAhqC95S71J7ruD0BLN9jBb8lkYz1CmuB7TDlBdqAtKxRMndQH6JecKpctvE1ItIoA90W0vr8udPZeqpZKWQpR8Yg5gLqgjTNF8i0QrXM+Zg864sJsanTbF/BNLMuARTwf57TLRLpASnmUuxUELooFboBkzQJJqjN4aq3DhxzcIyipNyO6FBuC3w/FIsQNelTAI1FzYKAb45neXR/aoJs3uI9rYDObJLn6tumvXk+HI1pTZRGCDa092H9Ulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2MefFmj6c/2yqzqZXe/XXVePeIye6L0WBCpDnojo+Y=;
 b=Bwb5grrk1gekwolzOeHk1KErouN3YNOitspcZeVkyQha3K/0H4xPk54vazni3HrLZ2I2zlaL3c6VIbqjfTuy10ugDkJRCgdi3Cou6dG+VvdRtp/GjvP6n1AeIFaq8ohwBaOLvuQsBYtK44LiPVny/OQCm3PZpycE1z4w1iksu1nIceeyDZRxAiPHWXD86fppEBg3L5YxD5b/koyt6+6cxhteG6LqvSue0PB6aZKrEf9z2Jfy55RNHGC6nw7Nx5dCQAaZ8+6jtInmAcTzoLEzxnmXXQkiQfWo79gE1J394M7OQ1ft5v8xSw4VE8YU/rfDEq26n75JIcYhMLJDjyTK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Sat, 13 May
 2023 04:42:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.024; Sat, 13 May 2023
 04:42:54 +0000
Date: Fri, 12 May 2023 21:42:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Message-ID: <x22jz3dyopov6n5kuvpwp4yxsnduutgygd3ehtaqt3ooruu4wp@dogalf3yxn77>
X-Patchwork-Hint: comment
References: <20230512233649.3218736-1-lucas.demarchi@intel.com>
 <SJ2PR11MB7715FAC48407AC06DAEB9C65F87A9@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB7715FAC48407AC06DAEB9C65F87A9@SJ2PR11MB7715.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1604c72c-5bc5-4f08-5d2d-08db536c83a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEAP+IYroU3T/hwy/HzUkhPm2cR692P60UNw8dDWS+M+3LNjw0hMxlBgDk9znrxtLwo+KnzgzJ2+p0ixx0HLr40HWgKRT9a1/Znb+mf93hpfTxWAHMPWhtE6/tBuUSK6fXSZkR7iTzPTA429X3A5P72CeIquw9bHZXYKF+GWMPw7F2hymK8hq/RWakZYwo8sQ6SR4yMtujVbJfXYTLklNXwl+pQiOMphDHSaVqNmiVcwEpP+dWOlAZrAm2/VKoew2OEtIkG65fFdwR+2/cYcy/ohLeM/gjTYX51/+bO7wHihn6ZtMyNkgaN5QVUc2mU5XKw6CIdBB/xOE6g03VeN/dSs7BUJUDmiB7ig22K2epBR4ApFCA20CsW3pkCpoB206gwSHK/H+6Url0D8pNRZYwWazSbWidip16SagB8QHu0DYsAXRiZHs9he+ZH8WkUSJn7/WVv4l09B3JlpPnehUuNwI2+cIycg5GHqMYJSLUhsRQswNBewkSFAGLKo58BVR+8lf0/Gl7MYTE7ko3sRGv5TxnNKgyCVCO1D9Y5yDDcv/l+cuDOJaeOCthC1sEnJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(478600001)(8676002)(8936002)(6862004)(5660300002)(86362001)(2906002)(33716001)(4326008)(6636002)(82960400001)(66476007)(66556008)(66946007)(316002)(41300700001)(38100700002)(6512007)(9686003)(6506007)(26005)(53546011)(186003)(6486002)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mpHNlcBE5C8exAOXfnScyM5RqTlObIqskg4Jg5bJ04mogO5aJEdk7z0TNOSX?=
 =?us-ascii?Q?Hu9Rbeu3BQVHr12Q3ZMaISsAcAa+lfGaxj5iM9GMrG5TZg8EgUqLH24po0ub?=
 =?us-ascii?Q?eid2Ut9GdIMk3QTTe0DMpk+u0LC/dc3iOk+RcridfsKAk9qUktBXaYmybTBp?=
 =?us-ascii?Q?srXH4r+DIRPR9MF13G2BsFqvdtSq8ioQ+bT/coWJ3s1eiYmhmWjcXYl2WRB8?=
 =?us-ascii?Q?QjaCSDZPNfVAuh82j4zd7KRflel2UthFjPi7x+8lGyhRvbCQR2DMrvQMK4bw?=
 =?us-ascii?Q?ph0N53QKdfVQJuDOD/ZmtrRrLJX163Cx57YK5+t8+vMM/862jGcHwUaMAuEO?=
 =?us-ascii?Q?wJkLsHEi4e1nFdDzjERuGxrsd1pQCRYqmp7zIERn/crY6DAoQ9GUYqlpxfEw?=
 =?us-ascii?Q?a7Hvbpg9OacSQg3F/UxFI70FsvtHjeplIO+PEl5d8sqJxZY5069NDPCWwwvR?=
 =?us-ascii?Q?+Z+AGagHadt4j0q4wwjXlGMBN2rsYmymynEisZHnLGq3s2lJUZkt/9i2SfPa?=
 =?us-ascii?Q?G0ABqB30070k65EQs3dws1aEHB81+2MrC2DkzFs9Q8vREG+pz3baEO8AhDPy?=
 =?us-ascii?Q?oijnVjWfO7MPycDCWP40lUyLuwy55pzQhYlSqmhIxAnxiMwfZcOY0/QgmegS?=
 =?us-ascii?Q?issMKSpejacKni3oWaiyKxA9bl0iDonPBTo5+/hKb+yZcEzmvLFyl8GIDSvY?=
 =?us-ascii?Q?R0txn5DrSW3PCKXJVQuALi4sB3m7a7Ytf+SQhd+cHBQ90OPkiNYQgCaxtUun?=
 =?us-ascii?Q?BVIYTtrYbS+/qv79lVKXx471ZL5qK86raUuiYFdQRH+zoM078HDhavHOT4P+?=
 =?us-ascii?Q?M+eD5kltSaSqfXU/306lCMtGrkbIgoS5Czrw17+RvCITgDwOUig3JdZTPEW6?=
 =?us-ascii?Q?WquOVRdqmMaOeZTw0JulwLCqOhdK6JVKcQQ26Ni96gJXapjRA/X3HT83Jj3l?=
 =?us-ascii?Q?qhIJObkKxfHNVnfqu5l+7sSGR/CM2OlxsrgDg4HqND+x2tvKBthOSvkISMDI?=
 =?us-ascii?Q?oS0Eg1RByZxyl79o6tV/DSdsCuz+I6cqiMCYwx7SRPz5gqkGkpjIe7sZ6gmo?=
 =?us-ascii?Q?Ft7Mxs5WtZxQSlTotIashjDAPSsBLUAPMQ20Be+yO6R5/Oy5WBp/2lZMSQG0?=
 =?us-ascii?Q?suNtcX4Gzb9eX0oxn6cyFJJIagCCpTcawVJj4TKdpLCkbUsD5vPwg0Z2rXWW?=
 =?us-ascii?Q?FTMCjg1EX156iW3u7VTfKTq6cx3Wj+hUN3Bzdbu0caJpLShd1MG0XWFVEPt7?=
 =?us-ascii?Q?FQ+HKQkx7VHBZrvS9v3wcLl9pxYGlPfn92QnWZXslix+0yWS8KuIgCgYfWTs?=
 =?us-ascii?Q?fs/wS981Fa41HaT2py7O3BWPGNH5DMWW4q3QE9+Uuh/36GhNlG53chYnA9/r?=
 =?us-ascii?Q?j36KGz2y3lb7+6euTlOV0wlM1SapJNXybohU6sIugd5cxwmQzdmq7W4DXXZX?=
 =?us-ascii?Q?inq8xYNxJG1efBHXqcNSAfl02vrh1lOa3NG8AJaw/XgG931Pe5iODm3HG1zm?=
 =?us-ascii?Q?b8wMt2Y385tY+8yyu6/tk+L7bm5R+6pnrKC5+v3IYJLlgUzcZilElbIBM3VM?=
 =?us-ascii?Q?uHG+UbFoMVTFOSUYthunY04/4HiNbRdc60b/4fy263EOca/vOtMBX/KTXCgm?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1604c72c-5bc5-4f08-5d2d-08db536c83a0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2023 04:42:53.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMkt56dNCx2IfKSrHBe0I6bMGlft1EgzWeqr/w+019XtzqTuI/Dj07XD+KExRFa47A1wqLkILwfSd8R/7hdJIUpkjDqjhVx/zikc02tV8uM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Load HuC on Alderlake P
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, May 13, 2023 at 02:52:30AM +0000, Anusha Srivatsa wrote:
>Thanks for the patch.
>
>Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

applied, thanks

Lucas De Marchi

>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Friday, May 12, 2023 4:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: [PATCH] drm/xe: Load HuC on Alderlake P
>>
>> Alderlake P uses TGL HuC and it was not added together with ADL-S, because it
>> was failing for unrelated reasons. Now that those are fixed, allow it to load HuC.
>>
>> 	# cat /sys/kernel/debug/dri/0/gt0/uc/huc_info
>> 	HuC firmware: i915/tgl_huc.bin
>> 		status: RUNNING
>> 		version: wanted 0.0, found 7.9
>> 		uCode: 589504 bytes
>> 		RSA: 256 bytes
>>
>> 	HuC status: 0x00090001
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 305e7f8992ea..317c541753fb 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -111,6 +111,7 @@ struct fw_blobs_by_type {
>>  	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>>
>>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)
>> 		\
>> +	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))
>> 	\
>>  	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))
>> 	\
>>  	fw_def(DG1,		no_ver(i915,	huc,	dg1))
>> 	\
>>  	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))
>> 	\
>> --
>> 2.40.1
>
