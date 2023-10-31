Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1BFC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 19:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3F10E09C;
	Tue, 31 Oct 2023 19:29:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493210E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698780548; x=1730316548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=S5KqFiKvokzpF7JX4+hDW74znJSaw1utHxt4SHa8LGQ=;
 b=M9iDkhWT3hUwiZb34tPOQGdRgKJqD+FuhYtLG2ajBMZhLmHBwe/5P1SH
 xWZ6XKuCt9ng3kgJx3O5PixW28xL5q11sJMamUYlpaoU4kXcdngFxR5/I
 0yckRNV6PVD9XzcUeZB3Xq2EEZzJJ5mRQNXYdsoM9z23mO0fpzWCaZHnr
 lH5lTf5mWUZDTJ4W57rxIol4SvMmrh5BB1rNCJXuS9GVzzMP1CbxiQjA+
 Kb3rA6UesERpYxNpVZxo03buyws80O0of1g6YjV2HFz+o8l+0gWpBK3Mb
 jzznLvZ4mghqIpxc0T3VWeFLeKz5te49lqo6CBETerVGdcJaMZHaICZm3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1209854"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208,217";a="1209854"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 12:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="934220611"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
 d="scan'208,217";a="934220611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 12:29:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 12:29:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 12:29:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 12:29:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 12:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5LK8pfkTlTOBtSD7PF8QEmYCTyzAun90Ss6MlEizZ8sMBgbXpGJ4mjnM8C8fuATtoKiUoX25SZm9eyZckUt4SYvM1R24R2vUaj5F1s+cUCXbzBZ7QkC0n3Ee5iuT4RXy5aW8KwQ1Sh9pNDh9MDqFXK4S+hqqzJ0jTKgO/fuksN9u9izbhUEozE1AZZd12RgY2wXmLeO0AyGVu4I0BOGO/U2ZP6yyLUpxpTEoGQBKCUVwe7ykjgNbIje94qkPaKUjJfz6biHqAGaRldaf1NG++zSvavDHUpsdgHIjFboGvF6dxsJfQLHSY2c8JgHYEptxLBokkGvqXRAZ2ZHdJZRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCDXJUhC8jb4E+uQz8DtPMjMJGJOKpyyIastyaeaaPs=;
 b=Ss7k2usFHJY0KIXBtlshfIj0t8RO2I2SfGzk55ug5SOUeChwwSkCxAg+zxtS8s00H8IffCJQnhrfw7m8SPx0eo5aNAf7uzQ+Eo/X7ELpoxgqq1TItkLz+ghysoegNy3jqUNOLjH3WoYGnvxOPnwtog61T6uebKXEpRBxdP/sEVdnSPqASCrBSyKDbaEacglrLoKoNrS3Edf80tjh7+D2m26xImVUipW48ZERoCpGldgHh6gRaca1QK3a123NBIQCMn9jGPiFfPDFzx7nPzNhvHIS0g0robwzGjFmezP441QzYcRt9zrQcaGmwSTA6h8LQvNHKvxFi95L86sjX4+Qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 19:29:02 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 19:29:02 +0000
Content-Type: multipart/alternative;
 boundary="------------wb2TmZ5E93W3PkCiA0HlDZeU"
Message-ID: <fa6e05ff-aca2-44d8-a5a4-4a6a5c76329b@intel.com>
Date: Tue, 31 Oct 2023 12:29:02 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-10-daniele.ceraolospurio@intel.com>
 <SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d60cd4-289a-4e16-dc25-08dbda47a391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYrf1nabBUpwOqE5og+X++4utyLdxj/3mEQTzDjeLq2aa1jnzV4CDHsDvz6/ruJLWGiFJwHyepUiXVjCM2Fc9mXo/Y9sAfEp1ComYAjqYQpEzJCuCBj690q+f45HluecGSGT+w+vK5i2z0McN2NMzkCuhnS5ja1zF4TQkOJmWrh6GObsW+K69yoGclZnFCf+i52P8wgYoVZe0ueQ8z91/3sQdEyzRN0MRlp0B0vPQRPFjewOlY1cP3F/cSdVMGINy5JKyD0yE+GklB61LurwJPTVlQv6rYaQ3xO7xUQQHmCxIyh+8ccBIXNzeRQINIcUcDzA35gfQBDDDz9uODWqXi2qa/9Ef5VjwwGoEu7TURVYvfaac4m+GbIw08iGNtvEhikVU6/BsJp3YqQ3rUxkXuxkCgjNejTClR0LDJzyCI1VMglLs018zs18oT44d1elB8Uf01G601+s8H2d0ux5E7eBogBu8QXQKd0ByViaID138pSLKwALHvRlyHSJIaS2eIpU/FRkT6S/THtm0uuPXoPxwtXJOqyi0148P+PQJ6sNRi3LOxdK4YKupULofjya+m/Ek/cwOcjxuse8Mhf6kopx8npVemI1vTxiINQ6I3C0/htH/5qUboCuGvWojkLlXmDiApWfc5Bv45hX8ddNsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66556008)(82960400001)(316002)(66476007)(38100700002)(2616005)(6486002)(33964004)(53546011)(110136005)(478600001)(36756003)(83380400001)(66946007)(2906002)(6512007)(107886003)(6506007)(26005)(5660300002)(8936002)(41300700001)(30864003)(8676002)(4326008)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEtlSmFDY09ZbjRDMTFvNlJvbTh6L21hdThvenBRWTJXOEdLWldLOWpNYnl5?=
 =?utf-8?B?STBxTFdHVU9tSVJtSytPeUdCbUNqTVJCdE1uTFBpVVl1WHlpSEFROFA2NWwr?=
 =?utf-8?B?bG8wZFBTNXdsVm5TR1d3WW9ubXhwcWhOcUUzTDBENVJLamVwL0tWMWxrUHdB?=
 =?utf-8?B?SVpWMG5jc05SK0JLc21UT01zaXRzaU5pZXpBRUJNU00veG1vdUVyVDVMZ3pl?=
 =?utf-8?B?Z1loYzZTQ28ydHpJNitsaE96Q1JOSUJXYWdRSkpBNHQrNmpETERWcjB5aklH?=
 =?utf-8?B?VHJBc1JlTENNZURGVzhSUTFMVDBlbTFDZ0xRTkx2aDhCS1BVMTRvUG95OWlB?=
 =?utf-8?B?bWdpVEVmdEVsTWx2L1dPdGlpd3ovb3ZyeGZ1cTN2aktnM0tNRVlYZVlpMnZr?=
 =?utf-8?B?VGJZNURWZXQzanJVeGJVRVpRZlBvalM2UHovWkNHTnBTcVM2MmVyY25VcDdK?=
 =?utf-8?B?RVMyWDBHSFhNSDNaQlRnUWNwaytCdDJnd25ZeFYxc2t6VU0zcjEwc2pBa1Vn?=
 =?utf-8?B?VE5Lb0JhU2gxL2pkRWdpd1Z1TWNOaVlGN0MzR3JIUEV0dVJic0ZyNS9UVW9Y?=
 =?utf-8?B?S056NCs0YU9mZFltVURnYnhRcGxCNHhBLzV2aFAxdCtKbk1NZWVxTlFrR1Rp?=
 =?utf-8?B?dHlrL1p4T2VmL200RE9iTWtUQXRJZTVjNHBKQWpDN05mNFQxOTJ4STlpWWE3?=
 =?utf-8?B?K3ZBZGRNR2FwbERQUDBFWmxxdHE1R3JGUXpoQ1ZnL1RoSGQyYkdLY1M2UXho?=
 =?utf-8?B?TVRpallUSDJ3ZzVWcUF2aVVUNTE1ajNhdmxaWS9BZ3BkYURMNDlFa1VERFNu?=
 =?utf-8?B?RnRmL3pjdFZqRFlQUmtHZEpEa1V2dmhiUC9lemZ3UklHRTN0VmJPUzBaYVpD?=
 =?utf-8?B?YVV1U3VKdUFGc3d4aGpyT0ZKbzI3Z002V1o1UHhwRm5WNzVUZ25BbDdFQ0pa?=
 =?utf-8?B?N2ZjWUJPNGFoYXI4bTVJVktPc0xlQ3FGV0JBUHNaaTJqeEgzN1N5YUFiZGtR?=
 =?utf-8?B?QThiU3RyZ2MyeUg0WG4yR1BwVzBuWlJZZ1dHTDRuWTFQS3R4ZnpuSDJMTDhW?=
 =?utf-8?B?OFRlRXlBVitIVGNGcFJxOGg4N1Z4cU90NlZON1Q1MHMxcGxkOXZWVUU2OWdW?=
 =?utf-8?B?dnFsRmp5cHA2SkhvdG9jT3RiTVM0dThXTGlQZFUwY3NGQURFdDFuL016Nmtq?=
 =?utf-8?B?UDE4ZDk3U29RYlYxTEdBVUd3cFMzc2dhNXF6NFFDSnV2ZG1NM1dkNDg2SzVN?=
 =?utf-8?B?L250WFJDcjRTQkM3Tm1Yb25aSTlrRXV6U0xCVFYyUUpvejJDZERwcFpSSisw?=
 =?utf-8?B?amNqMmJTQ25VUUVnOENxeDFjM0RBK0Z1MlJ1Tm1FNVBnTUhGSCtJQ0R4akxB?=
 =?utf-8?B?ZmVXaVZhUGJJMFRCZ3g5UFYyM0lZUndpeXZlTVEyV2lyRnNldktud255NmtB?=
 =?utf-8?B?ekoyaGxLazdFZ2Y1b2VDOVFSMDFqbE0vc08yK2hRL0dtWC85T1REWkhUWkt3?=
 =?utf-8?B?STBkQXJMcG9RSlRRWWxpdms1bWlCMnc1bklyQkYxR1lXcXpCZmZWUFFkZVdW?=
 =?utf-8?B?VEJqRmtOT2JVTHltTjl6aU9aeCtrOURqbUg1WVBnczZLMktuTHB3cTBWRG5t?=
 =?utf-8?B?R245TmZpTTFKdkJmVGxLUkJXZEgwbzZZa3NKQnVMc0NEYzVHbTNVQUhPenUy?=
 =?utf-8?B?Z0NZM3pmWHkySW1hWWUwcDB5UFFuV0NnSFRJK3pMS3RyNlcxRnR2RVg3Zk15?=
 =?utf-8?B?ZkR6YXVrY29PYnZoRFpWMVlRdXU5dTJkNkp0cy9QSkcxT1dCL011cHd2Z0M5?=
 =?utf-8?B?N0g2V0xoVUE1cHFaYVo3TUFHTWZvNnV6akJCbnhXelhOcDg2QW0wUkduTjZm?=
 =?utf-8?B?OStnTjJXYkRyT3FTb1BWUlU2YTA3eTRYd0YvdkFSTlRCVDB4amRPWnQrWDBp?=
 =?utf-8?B?amllNlllcTlGcCttT3RBbjY4c1Vub0lqekFWemo4QkdsSkYwSEVScUxTYzd6?=
 =?utf-8?B?aFkvaWdId3lncGcxNDB2OHA3WkZMWFhsMDREaU15dkhqZkJTQThlbGtqU3d0?=
 =?utf-8?B?V041Q3BoSGRocndvb3hwbUpCTTF6ay9oSWk2TXNtUzFNOEZWSXNpUjBtRUVv?=
 =?utf-8?B?OGFoZitKKy8zd01lUUFhVmN3SllmU2xaNDVxQ1ZaamF3enFNdndLb1Z3V05i?=
 =?utf-8?Q?ns6jwuJMjcXHiSrXutKAgt4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d60cd4-289a-4e16-dc25-08dbda47a391
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 19:29:02.8337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSPiUBNn6CkftcpweTivClbab3l5hOOR4J8G7NaxjQGvlLUH0GwvlpUmZ3qjm+PeQMK8d06mc9PTwRI0yjuSAEo1VBVRG+ppqlCRbv5LJIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/12] drm/xe/gsc: Add an interface for GSC
 packet submissions
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

--------------wb2TmZ5E93W3PkCiA0HlDZeU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 10/31/2023 1:08 AM, Kandpal, Suraj wrote:
>
>> -----Original Message-----
>> From: Ceraolo Spurio, Daniele<daniele.ceraolospurio@intel.com>
>> Sent: Saturday, October 28, 2023 3:59 AM
>> To:intel-xe@lists.freedesktop.org
>> Cc: Ceraolo Spurio, Daniele<daniele.ceraolospurio@intel.com>; Teres Alexis,
>> Alan Previn<alan.previn.teres.alexis@intel.com>; Kandpal, Suraj
>> <suraj.kandpal@intel.com>
>> Subject: [PATCH 09/12] drm/xe/gsc: Add an interface for GSC packet
>> submissions
>>
>> Communication with the GSC FW is done via input/output buffers, whose
>> addresses are provided via a GSCCS command. The buffers contain a generic
>> header and a client-specific packet (e.g. PXP, HDCP); the clients don't care
>> about the header format and/or the GSCCS command in the batch, they only
>> care about their client-specific header. This patch therefore introduces helpers
>> that allow the callers to automatically fill in the input header, submit the GSCCS
>> job and decode the output header, to make it so that the caller only needs to
>> worry about their client-specific input and output messages.
>>
>> NOTE: this patch by itself only adds the interface so it does nothing, I've kept it
>> separate for review but the plan is to squash it with the follow up patch before
>> merge, so that the interface and the user are introduced at the same time.
>>
>> Signed-off-by: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
>> Cc: Suraj Kandpal<suraj.kandpal@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++++
>>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |   2 +
>>   drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++++
>>   5 files changed, 249 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
>> 4a442dcf4d79..876c122ad63c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>>   	xe_force_wake.o \
>>   	xe_ggtt.o \
>>   	xe_gsc.o \
>> +	xe_gsc_submit.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>> b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>> new file mode 100644
>> index 000000000000..a4c2646803b5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GSC_COMMAND_HEADER_ABI_H
>> +#define _ABI_GSC_COMMAND_HEADER_ABI_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct intel_gsc_mtl_header {
>> +	u32 validity_marker;
>> +#define GSC_HECI_VALIDITY_MARKER 0xA578875A
>> +
>> +	u8 heci_client_id;
> Also during adding this is i915 we had decided to add certain defines
> As seen here below may be add them as well
>          u8 heci_client_id;
> #define HECI_MEADDRESS_MKHI 7
> #define HECI_MEADDRESS_PROXY 10
> #define HECI_MEADDRESS_PXP 17
> #define HECI_MEADDRESS_HDCP 18

Before answering the specific question here, let me explain why the 
design diverged compared to i915, as it will be relevant for further 
comments as well. One big difference in Xe is the way memory is 
accessed, which now requires the use of xe_map_<rd/wr>_field (instead of 
doing direct access via pointer dereference), for which I have created 
the mtl_gsc_header_<rd/wr> wrappers. This lead me to wanting to make 
sure that all accesses to the header are done in this file, so that we 
don't need to export the wrappers, as that would require including the 
memory paths as well and make things complicated; consequently, I don't 
want other files to have to include the gsc_command_header_abi.h file, 
as they should have no need to do any header manipulation.
If other files can't include the header, the client-specific defines 
need to be moved to the client-specific files. For example, 
HECI_MEADDRESS_MKHI is defined in gsc_mkhi_commands_abi.h in the next 
patch. I'd expect the other defines to also go in the respective _abi.h 
files.

>> +
>> +	u8 reserved1;
>> +
>> +	u16 header_version;
>> +#define MTL_GSC_HEADER_VERSION 1
>> +
>> +	/* FW allows host to decide host_session handle as it sees fit. */
>> +	u64 host_session_handle;
> Also during adding this is i915 we had decided to add certain masks for PXP and HDCP
> As seen here below may be add the as well
>
> /*
>           * FW allows host to decide host_session handle
>           * as it sees fit.
>           * For intertracebility reserving select bits(60-63)
>           * to differentiate caller-target subsystem
>           * 0000 - HDCP
>           * 0001 - PXP Single Session
>           */
>          u64 host_session_handle;
> #define HOST_SESSION_MASK       REG_GENMASK64(63, 60)
> #define HOST_SESSION_PXP_SINGLE BIT_ULL(60)

Given the greater separation of layers (as explained above), I don't 
think we should special case the common code based on the caller. If we 
want to set part of the session id based on the heci client, then we can 
just encode the whole heci_client_id (see below).

>
>> +
>> +	/* handle generated by FW for messages that need to be re-submitted
>> */
>> +	u64 gsc_message_handle;
>> +
>> +	u32 message_size; /* lower 20 bits only, upper 12 are reserved */
>> +
>> +	/*
>> +	 * Flags mask:
>> +	 * Bit 0: Pending
>> +	 * Bit 1: Session Cleanup;
>> +	 * Bits 2-15: Flags
>> +	 * Bits 16-31: Extension Size
>> +	 * According to internal spec flags are either input or output
>> +	 * we distinguish the flags using OUTFLAG or INFLAG
>> +	 */
>> +	u32 flags;
>> +#define GSC_OUTFLAG_MSG_PENDING	BIT(0)
>> +#define GSC_INFLAG_MSG_CLEANUP	BIT(1)
>> +
>> +	u32 status;
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>> b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>> index c7a833d7f965..f8949cad9d0f 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>> @@ -28,6 +28,8 @@
>>   	REG_FIELD_PREP(GSC_OPCODE, op) | \
>>   	REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))
>>
>> +#define GSC_HECI_CMD_PKT __GSC_INSTR(0, 6)
>> +
>>   #define GSC_FW_LOAD __GSC_INSTR(1, 2)
>>   #define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c
>> b/drivers/gpu/drm/xe/xe_gsc_submit.c
>> new file mode 100644
>> index 000000000000..e96336ac4728
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
>> @@ -0,0 +1,170 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_gsc_submit.h"
>> +
>> +#include "abi/gsc_command_header_abi.h"
>> +#include "xe_bb.h"
>> +#include "xe_exec_queue.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_gt_types.h"
>> +#include "xe_map.h"
>> +#include "xe_sched_job.h"
>> +#include "instructions/xe_gsc_commands.h"
>> +#include "regs/xe_gsc_regs.h"
>> +
>> +#define GSC_HDR_SIZE (sizeof(struct intel_gsc_mtl_header)) /* shorthand
>> +define */
>> +
>> +#define mtl_gsc_header_wr(xe_, map_, offset_, field_, val_) \
>> +	xe_map_wr_field(xe_, map_, offset_, struct intel_gsc_mtl_header,
>> +field_, val_)
>> +
>> +#define mtl_gsc_header_rd(xe_, map_, offset_, field_) \
>> +	xe_map_rd_field(xe_, map_, offset_, struct intel_gsc_mtl_header,
>> +field_)
>> +
>> +static struct xe_gt *
>> +gsc_to_gt(struct xe_gsc *gsc)
>> +{
>> +	return container_of(gsc, struct xe_gt, uc.gsc); }
>> +
>> +/**
>> + * xe_gsc_header_write - write the MTL GSC header in memory
> You have define xe_gsc_header_write up in comments but the actual
> Function is still called xe_gsc_emit_header one of these names need to be changed

will fix

>> + * @xe: the Xe device
>> + * @map: the iosys map to write to
>> + * @offset: offset from the start of the map at which to write the
>> +header
>> + * @heci_client_id: client id identifying the type of command (see abi
>> +for values)
>> + * @host_session_id: host session ID of the caller
>> + * @payload_size: size of the payload that follows the header
>> + *
>> + * Returns: offset memory location following the header  */
>> +u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32
>> offset,
>> +		       u8 heci_client_id, u64 host_session_id, u32 payload_size) {
>> +	xe_map_memset(xe, map, offset, 0, GSC_HDR_SIZE);
>> +
>> +	mtl_gsc_header_wr(xe, map, offset, validity_marker,
>> GSC_HECI_VALIDITY_MARKER);
>> +	mtl_gsc_header_wr(xe, map, offset, heci_client_id, heci_client_id);
>> +	mtl_gsc_header_wr(xe, map, offset, host_session_handle,
>> host_session_id);
> Also We OR the required host_session_handle with the appropriate mask
> Dedpending on client id as seen below:
> host_session_id &= ~HOST_SESSION_MASK;
>          if (host_session_id && heci_client_id == HECI_MEADDRESS_PXP)
>                  host_session_id |= HOST_SESSION_PXP_SINGLE;
> any reason to move away from this as it was decided we will have it here in a common place

Continuing from the comment above, this could become:

#define HOST_SESSION_MASK       REG_GENMASK64(63, 56)

xe_assert(xe, !(host_session_id & HOST_SESSION_MASK));

if (host_session_id)
	host_session_id |= FIELD_PREP(HOST_SESSION_MASK, heci_client_id);


That way we can identify the client that generated the session without 
having to special-case. Does that work for you?

Daniele

>
> Regards,
> Suraj Kandpal
>
>> +	mtl_gsc_header_wr(xe, map, offset, header_version,
>> MTL_GSC_HEADER_VERSION);
>> +	mtl_gsc_header_wr(xe, map, offset, message_size, payload_size +
>> +GSC_HDR_SIZE);
>> +
>> +	return offset + GSC_HDR_SIZE;
>> +};
>> +
>> +/**
>> + * xe_gsc_check_and_update_pending - check the pending bit and update
>> +the input
>> + * header with the retry handle from the output header
>> + * @xe: the Xe device
>> + * @in: the iosys map containing the input buffer
>> + * @offset_in: offset within the iosys at which the input buffer is
>> +located
>> + * @out: the iosys map containing the output buffer
>> + * @offset_out: offset within the iosys at which the output buffer is
>> +located
>> + *
>> + * Returns: true if the pending bit was set, false otherwise  */ bool
>> +xe_gsc_check_and_update_pending(struct xe_device *xe,
>> +				     struct iosys_map *in, u32 offset_in,
>> +				     struct iosys_map *out, u32 offset_out) {
>> +	if (mtl_gsc_header_rd(xe, out, offset_out, flags) &
>> GSC_OUTFLAG_MSG_PENDING) {
>> +		u64 handle = mtl_gsc_header_rd(xe, out, offset_out,
>> +gsc_message_handle);
>> +
>> +		mtl_gsc_header_wr(xe, in, offset_in, gsc_message_handle,
>> handle);
>> +
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * xe_gsc_read_out_header - reads and validates the output header and
>> +returns
>> + * the offset of the reply following the header
>> + * @xe: the Xe device
>> + * @map: the iosys map containing the output buffer
>> + * @offset: offset within the iosys at which the output buffer is
>> +located
>> + * @min_payload_size: minimum size of the message excluding the gsc
>> +header
>> + * @payload_offset: optional pointer to be set to the payload offset
>> + *
>> + * Returns: -errno value on failure, 0 otherwise  */ int
>> +xe_gsc_read_out_header(struct xe_device *xe,
>> +			   struct iosys_map *map, u32 offset,
>> +			   u32 min_payload_size,
>> +			   u32 *payload_offset)
>> +{
>> +	u32 marker = mtl_gsc_header_rd(xe, map, offset, validity_marker);
>> +	u32 size = mtl_gsc_header_rd(xe, map, offset, message_size);
>> +	u32 payload_size = size - GSC_HDR_SIZE;
>> +
>> +	if (marker != GSC_HECI_VALIDITY_MARKER)
>> +		return -EPROTO;
>> +
>> +	if (size < GSC_HDR_SIZE || payload_size < min_payload_size)
>> +		return -ENODATA;
>> +
>> +	if (payload_offset)
>> +		*payload_offset = offset + GSC_HDR_SIZE;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_gsc_pkt_submit_kernel - submit a kernel heci pkt to the GSC
>> + * @xe: the GSC uC
>> + * @addr_in: GGTT address of the message to send to the GSC
>> + * @size_in: size of the message to send to the GSC
>> + * @addr_out: GGTT address for the GSC to write the reply to
>> + * @size_out: size of the memory reserved for the reply  */ int
>> +xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
>> +			     u64 addr_out, u32 size_out)
>> +{
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_bb *bb;
>> +	struct xe_sched_job *job;
>> +	struct dma_fence *fence;
>> +	long timeout;
>> +
>> +	if (size_in < GSC_HDR_SIZE)
>> +		return -ENODATA;
>> +
>> +	if (size_out < GSC_HDR_SIZE)
>> +		return -ENOMEM;
>> +
>> +	bb = xe_bb_new(gt, 8, false);
>> +	if (IS_ERR(bb))
>> +		return PTR_ERR(bb);
>> +
>> +	bb->cs[bb->len++] = GSC_HECI_CMD_PKT;
>> +	bb->cs[bb->len++] = lower_32_bits(addr_in);
>> +	bb->cs[bb->len++] = upper_32_bits(addr_in);
>> +	bb->cs[bb->len++] = size_in;
>> +	bb->cs[bb->len++] = lower_32_bits(addr_out);
>> +	bb->cs[bb->len++] = upper_32_bits(addr_out);
>> +	bb->cs[bb->len++] = size_out;
>> +	bb->cs[bb->len++] = 0;
>> +
>> +	job = xe_bb_create_job(gsc->q, bb);
>> +	if (IS_ERR(job)) {
>> +		xe_bb_free(bb, NULL);
>> +		return PTR_ERR(job);
>> +	}
>> +
>> +	xe_sched_job_arm(job);
>> +	fence = dma_fence_get(&job->drm.s_fence->finished);
>> +	xe_sched_job_push(job);
>> +
>> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
>> +	dma_fence_put(fence);
>> +	xe_bb_free(bb, NULL);
>> +	if (timeout < 0)
>> +		return timeout;
>> +	else if (!timeout)
>> +		return -ETIME;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.h
>> b/drivers/gpu/drm/xe/xe_gsc_submit.h
>> new file mode 100644
>> index 000000000000..0801da5d446a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.h
>> @@ -0,0 +1,30 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GSC_SUBMIT_H_
>> +#define _XE_GSC_SUBMIT_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct iosys_map;
>> +struct xe_device;
>> +struct xe_gsc;
>> +
>> +u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32
>> offset,
>> +		       u8 heci_client_id, u64 host_session_id, u32 payload_size);
>> +
>> +bool xe_gsc_check_and_update_pending(struct xe_device *xe,
>> +				     struct iosys_map *in, u32 offset_in,
>> +				     struct iosys_map *out, u32 offset_out);
>> +
>> +int xe_gsc_read_out_header(struct xe_device *xe,
>> +			   struct iosys_map *map, u32 offset,
>> +			   u32 min_payload_size,
>> +			   u32 *payload_offset);
>> +
>> +int xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
>> +			     u64 addr_out, u32 size_out);
>> +
>> +#endif
>> --
>> 2.41.0

--------------wb2TmZ5E93W3PkCiA0HlDZeU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/31/2023 1:08 AM, Kandpal, Suraj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Ceraolo Spurio, Daniele <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Sent: Saturday, October 28, 2023 3:59 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
Cc: Ceraolo Spurio, Daniele <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>; Teres Alexis,
Alan Previn <a class="moz-txt-link-rfc2396E" href="mailto:alan.previn.teres.alexis@intel.com">&lt;alan.previn.teres.alexis@intel.com&gt;</a>; Kandpal, Suraj
<a class="moz-txt-link-rfc2396E" href="mailto:suraj.kandpal@intel.com">&lt;suraj.kandpal@intel.com&gt;</a>
Subject: [PATCH 09/12] drm/xe/gsc: Add an interface for GSC packet
submissions

Communication with the GSC FW is done via input/output buffers, whose
addresses are provided via a GSCCS command. The buffers contain a generic
header and a client-specific packet (e.g. PXP, HDCP); the clients don't care
about the header format and/or the GSCCS command in the batch, they only
care about their client-specific header. This patch therefore introduces helpers
that allow the callers to automatically fill in the input header, submit the GSCCS
job and decode the output header, to make it so that the caller only needs to
worry about their client-specific input and output messages.

NOTE: this patch by itself only adds the interface so it does nothing, I've kept it
separate for review but the plan is to squash it with the follow up patch before
merge, so that the interface and the user are introduced at the same time.

Signed-off-by: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Cc: Alan Previn <a class="moz-txt-link-rfc2396E" href="mailto:alan.previn.teres.alexis@intel.com">&lt;alan.previn.teres.alexis@intel.com&gt;</a>
Cc: Suraj Kandpal <a class="moz-txt-link-rfc2396E" href="mailto:suraj.kandpal@intel.com">&lt;suraj.kandpal@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++++
 .../gpu/drm/xe/instructions/xe_gsc_commands.h |   2 +
 drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++++
 5 files changed, 249 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
4a442dcf4d79..876c122ad63c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,6 +58,7 @@ xe-y += xe_bb.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gsc.o \
+	xe_gsc_submit.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
new file mode 100644
index 000000000000..a4c2646803b5
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _ABI_GSC_COMMAND_HEADER_ABI_H
+#define _ABI_GSC_COMMAND_HEADER_ABI_H
+
+#include &lt;linux/types.h&gt;
+
+struct intel_gsc_mtl_header {
+	u32 validity_marker;
+#define GSC_HECI_VALIDITY_MARKER 0xA578875A
+
+	u8 heci_client_id;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Also during adding this is i915 we had decided to add certain defines
As seen here below may be add them as well
        u8 heci_client_id;
#define HECI_MEADDRESS_MKHI 7
#define HECI_MEADDRESS_PROXY 10
#define HECI_MEADDRESS_PXP 17
#define HECI_MEADDRESS_HDCP 18
</pre>
    </blockquote>
    <br>
    Before answering the specific question here, let me explain why the
    design diverged compared to i915, as it will be relevant for further
    comments as well. One big difference in Xe is the way memory is
    accessed, which now requires the use of xe_map_&lt;rd/wr&gt;_field
    (instead of doing direct access via pointer dereference), for which
    I have created the mtl_gsc_header_&lt;rd/wr&gt; wrappers. This lead
    me to wanting to make sure that all accesses to the header are done
    in this file, so that we don't need to export the wrappers, as that
    would require including the memory paths as well and make things
    complicated; consequently, I don't want other files to have to
    include the gsc_command_header_abi.h file, as they should have no
    need to do any header manipulation.<br>
    If other files can't include the header, the client-specific defines
    need to be moved to the client-specific files. For example, <span style="white-space: pre-wrap">HECI_MEADDRESS_MKHI </span>
    is defined in gsc_mkhi_commands_abi.h in the next patch. I'd expect
    the other defines to also go in the respective _abi.h files.<br>
    <br>
    <blockquote type="cite" cite="mid:SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+	u8 reserved1;
+
+	u16 header_version;
+#define MTL_GSC_HEADER_VERSION 1
+
+	/* FW allows host to decide host_session handle as it sees fit. */
+	u64 host_session_handle;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Also during adding this is i915 we had decided to add certain masks for PXP and HDCP
As seen here below may be add the as well

/*
         * FW allows host to decide host_session handle
         * as it sees fit.
         * For intertracebility reserving select bits(60-63)
         * to differentiate caller-target subsystem
         * 0000 - HDCP
         * 0001 - PXP Single Session
         */
        u64 host_session_handle;
#define HOST_SESSION_MASK       REG_GENMASK64(63, 60)
#define HOST_SESSION_PXP_SINGLE BIT_ULL(60)
</pre>
    </blockquote>
    <br>
    Given the greater separation of layers (as explained above), I don't
    think we should special case the common code based on the caller. If
    we want to set part of the session id based on the heci client, then
    we can just encode the whole heci_client_id (see below).<span style="white-space: pre-wrap"></span>
    <br>
    <br>
    <blockquote type="cite" cite="mid:SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+	/* handle generated by FW for messages that need to be re-submitted
*/
+	u64 gsc_message_handle;
+
+	u32 message_size; /* lower 20 bits only, upper 12 are reserved */
+
+	/*
+	 * Flags mask:
+	 * Bit 0: Pending
+	 * Bit 1: Session Cleanup;
+	 * Bits 2-15: Flags
+	 * Bits 16-31: Extension Size
+	 * According to internal spec flags are either input or output
+	 * we distinguish the flags using OUTFLAG or INFLAG
+	 */
+	u32 flags;
+#define GSC_OUTFLAG_MSG_PENDING	BIT(0)
+#define GSC_INFLAG_MSG_CLEANUP	BIT(1)
+
+	u32 status;
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
index c7a833d7f965..f8949cad9d0f 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
@@ -28,6 +28,8 @@
 	REG_FIELD_PREP(GSC_OPCODE, op) | \
 	REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))

+#define GSC_HECI_CMD_PKT __GSC_INSTR(0, 6)
+
 #define GSC_FW_LOAD __GSC_INSTR(1, 2)
 #define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)

diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c
b/drivers/gpu/drm/xe/xe_gsc_submit.c
new file mode 100644
index 000000000000..e96336ac4728
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include &quot;xe_gsc_submit.h&quot;
+
+#include &quot;abi/gsc_command_header_abi.h&quot;
+#include &quot;xe_bb.h&quot;
+#include &quot;xe_exec_queue.h&quot;
+#include &quot;xe_gt_printk.h&quot;
+#include &quot;xe_gt_types.h&quot;
+#include &quot;xe_map.h&quot;
+#include &quot;xe_sched_job.h&quot;
+#include &quot;instructions/xe_gsc_commands.h&quot;
+#include &quot;regs/xe_gsc_regs.h&quot;
+
+#define GSC_HDR_SIZE (sizeof(struct intel_gsc_mtl_header)) /* shorthand
+define */
+
+#define mtl_gsc_header_wr(xe_, map_, offset_, field_, val_) \
+	xe_map_wr_field(xe_, map_, offset_, struct intel_gsc_mtl_header,
+field_, val_)
+
+#define mtl_gsc_header_rd(xe_, map_, offset_, field_) \
+	xe_map_rd_field(xe_, map_, offset_, struct intel_gsc_mtl_header,
+field_)
+
+static struct xe_gt *
+gsc_to_gt(struct xe_gsc *gsc)
+{
+	return container_of(gsc, struct xe_gt, uc.gsc); }
+
+/**
+ * xe_gsc_header_write - write the MTL GSC header in memory
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You have define xe_gsc_header_write up in comments but the actual
Function is still called xe_gsc_emit_header one of these names need to be changed
</pre>
    </blockquote>
    <br>
    will fix<br>
    <br>
    <blockquote type="cite" cite="mid:SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ * @xe: the Xe device
+ * @map: the iosys map to write to
+ * @offset: offset from the start of the map at which to write the
+header
+ * @heci_client_id: client id identifying the type of command (see abi
+for values)
+ * @host_session_id: host session ID of the caller
+ * @payload_size: size of the payload that follows the header
+ *
+ * Returns: offset memory location following the header  */
+u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32
offset,
+		       u8 heci_client_id, u64 host_session_id, u32 payload_size) {
+	xe_map_memset(xe, map, offset, 0, GSC_HDR_SIZE);
+
+	mtl_gsc_header_wr(xe, map, offset, validity_marker,
GSC_HECI_VALIDITY_MARKER);
+	mtl_gsc_header_wr(xe, map, offset, heci_client_id, heci_client_id);
+	mtl_gsc_header_wr(xe, map, offset, host_session_handle,
host_session_id);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Also We OR the required host_session_handle with the appropriate mask 
Dedpending on client id as seen below:
host_session_id &amp;= ~HOST_SESSION_MASK;
        if (host_session_id &amp;&amp; heci_client_id == HECI_MEADDRESS_PXP)
                host_session_id |= HOST_SESSION_PXP_SINGLE;
any reason to move away from this as it was decided we will have it here in a common place</pre>
    </blockquote>
    <br>
    Continuing from the comment above, this could become:<br>
    <br>
    <pre class="moz-quote-pre" wrap="">#define HOST_SESSION_MASK       REG_GENMASK64(63, 56)

xe_assert(xe, !(host_session_id &amp; HOST_SESSION_MASK));

if (host_session_id)
	host_session_id |= FIELD_PREP(HOST_SESSION_MASK, heci_client_id);
</pre>
    <br>
    That way we can identify the client that generated the session
    without having to special-case. Does that work for you?<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:SN7PR11MB6750F624A761ECCF415FB9B1E3A0A@SN7PR11MB6750.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

Regards,
Suraj Kandpal

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	mtl_gsc_header_wr(xe, map, offset, header_version,
MTL_GSC_HEADER_VERSION);
+	mtl_gsc_header_wr(xe, map, offset, message_size, payload_size +
+GSC_HDR_SIZE);
+
+	return offset + GSC_HDR_SIZE;
+};
+
+/**
+ * xe_gsc_check_and_update_pending - check the pending bit and update
+the input
+ * header with the retry handle from the output header
+ * @xe: the Xe device
+ * @in: the iosys map containing the input buffer
+ * @offset_in: offset within the iosys at which the input buffer is
+located
+ * @out: the iosys map containing the output buffer
+ * @offset_out: offset within the iosys at which the output buffer is
+located
+ *
+ * Returns: true if the pending bit was set, false otherwise  */ bool
+xe_gsc_check_and_update_pending(struct xe_device *xe,
+				     struct iosys_map *in, u32 offset_in,
+				     struct iosys_map *out, u32 offset_out) {
+	if (mtl_gsc_header_rd(xe, out, offset_out, flags) &amp;
GSC_OUTFLAG_MSG_PENDING) {
+		u64 handle = mtl_gsc_header_rd(xe, out, offset_out,
+gsc_message_handle);
+
+		mtl_gsc_header_wr(xe, in, offset_in, gsc_message_handle,
handle);
+
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gsc_read_out_header - reads and validates the output header and
+returns
+ * the offset of the reply following the header
+ * @xe: the Xe device
+ * @map: the iosys map containing the output buffer
+ * @offset: offset within the iosys at which the output buffer is
+located
+ * @min_payload_size: minimum size of the message excluding the gsc
+header
+ * @payload_offset: optional pointer to be set to the payload offset
+ *
+ * Returns: -errno value on failure, 0 otherwise  */ int
+xe_gsc_read_out_header(struct xe_device *xe,
+			   struct iosys_map *map, u32 offset,
+			   u32 min_payload_size,
+			   u32 *payload_offset)
+{
+	u32 marker = mtl_gsc_header_rd(xe, map, offset, validity_marker);
+	u32 size = mtl_gsc_header_rd(xe, map, offset, message_size);
+	u32 payload_size = size - GSC_HDR_SIZE;
+
+	if (marker != GSC_HECI_VALIDITY_MARKER)
+		return -EPROTO;
+
+	if (size &lt; GSC_HDR_SIZE || payload_size &lt; min_payload_size)
+		return -ENODATA;
+
+	if (payload_offset)
+		*payload_offset = offset + GSC_HDR_SIZE;
+
+	return 0;
+}
+
+/**
+ * xe_gsc_pkt_submit_kernel - submit a kernel heci pkt to the GSC
+ * @xe: the GSC uC
+ * @addr_in: GGTT address of the message to send to the GSC
+ * @size_in: size of the message to send to the GSC
+ * @addr_out: GGTT address for the GSC to write the reply to
+ * @size_out: size of the memory reserved for the reply  */ int
+xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
+			     u64 addr_out, u32 size_out)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_bb *bb;
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	long timeout;
+
+	if (size_in &lt; GSC_HDR_SIZE)
+		return -ENODATA;
+
+	if (size_out &lt; GSC_HDR_SIZE)
+		return -ENOMEM;
+
+	bb = xe_bb_new(gt, 8, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
+	bb-&gt;cs[bb-&gt;len++] = GSC_HECI_CMD_PKT;
+	bb-&gt;cs[bb-&gt;len++] = lower_32_bits(addr_in);
+	bb-&gt;cs[bb-&gt;len++] = upper_32_bits(addr_in);
+	bb-&gt;cs[bb-&gt;len++] = size_in;
+	bb-&gt;cs[bb-&gt;len++] = lower_32_bits(addr_out);
+	bb-&gt;cs[bb-&gt;len++] = upper_32_bits(addr_out);
+	bb-&gt;cs[bb-&gt;len++] = size_out;
+	bb-&gt;cs[bb-&gt;len++] = 0;
+
+	job = xe_bb_create_job(gsc-&gt;q, bb);
+	if (IS_ERR(job)) {
+		xe_bb_free(bb, NULL);
+		return PTR_ERR(job);
+	}
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&amp;job-&gt;drm.s_fence-&gt;finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	dma_fence_put(fence);
+	xe_bb_free(bb, NULL);
+	if (timeout &lt; 0)
+		return timeout;
+	else if (!timeout)
+		return -ETIME;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.h
b/drivers/gpu/drm/xe/xe_gsc_submit.h
new file mode 100644
index 000000000000..0801da5d446a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GSC_SUBMIT_H_
+#define _XE_GSC_SUBMIT_H_
+
+#include &lt;linux/types.h&gt;
+
+struct iosys_map;
+struct xe_device;
+struct xe_gsc;
+
+u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32
offset,
+		       u8 heci_client_id, u64 host_session_id, u32 payload_size);
+
+bool xe_gsc_check_and_update_pending(struct xe_device *xe,
+				     struct iosys_map *in, u32 offset_in,
+				     struct iosys_map *out, u32 offset_out);
+
+int xe_gsc_read_out_header(struct xe_device *xe,
+			   struct iosys_map *map, u32 offset,
+			   u32 min_payload_size,
+			   u32 *payload_offset);
+
+int xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
+			     u64 addr_out, u32 size_out);
+
+#endif
--
2.41.0
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------wb2TmZ5E93W3PkCiA0HlDZeU--
