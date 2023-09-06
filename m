Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2492DEB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 09:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDC710E5B9;
	Wed,  6 Sep 2023 09:47:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713A810E5B9
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693993674; x=1725529674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ocyMS4yezyo1kMIWRPv3S2SjHj5AyGUAvJGWot40/9o=;
 b=cb9x86kYHKuMv1V4dVq7eejcKZkGnlDKVGaZVhK/E1REWSYDvZqLlqa0
 EweWTXRMR7XFi79N0zfjn007CaPqKrOecaNjzt5pJqkt8bmj3eVFqPRKN
 Sa6ul57jB7jtlkK9vzHkLUtPsDxdMy/zHGJzmJG9kPM4f15ep6KGyfY76
 pWBH9WEM+Ddz+Uxt4gctt9totxCtR9/Xkz8gQZxPFCVq6Ew7V/SXZwtcy
 EjCne1vHP2ujzZ8jeR9Z6LZfXinL2JobV2XIj/+E1ZnY52mnrrk1GNEhE
 q+yZisyGYF3NfvuycrI/vQZBYurKsm1VYP4teJkaMJVDtqP9R+8ulXrcZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380821710"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="380821710"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="741471897"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="741471897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 02:47:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 02:47:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 02:47:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 02:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMT+y13b1Tq/xY2Gp/3epjjq+nLP3FM4OWGqF6kiMZOEZa+ekZilYUz+XySs48m+jkW5v4HhhY3GtAuJFBtVe36dmWyVyCeAhPFPaCAdaD9ZozZjwyppGeYYHmBOUzb4z0jbPRqWbWPoUMF5Sx9iiUWw1neLoUEyyQiEwNN6PHFeq/dZGLQWiVPoUS8oAGH3A7kRvWeRaouAIJdgUlJx9nk5kt8OAGk/Fc1I/MGTQTjjJ0aKtdepqa7cKgPJWPs0t+8slr77yBTrJbZvDX/vf0VTYucsUz9gIAgbHumi8BukUlx3TXMJfbgONkT3gPQIp9iaySBbcdzFuVLa4OLCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRoEUkv17gJBOpuqokwMB8FWrGv+VBTyJUdyMUNagUo=;
 b=JFdyGdPk7mVuRBAizKUxzQTdCZAElExjaSIUSu3jiakBNqlE9ARsXSaUsQ5HAWcCSkrnIVtLBe/N3PiUa718RGuW7xQQSzzLFdkbO9g1bwe1V1EBu4yfZcFLIg1yfJShP4307zu04wmSraDAa7WrOpCbS165av4gziVXNHlxE8APYWyoO7sLoHADiblIjkS5U14pzf17VDC2m3Kf3VY14650Y/rg3Vdm7sZBkUud5bdE4+xI8iKbZkFNabCPZCO0055OTuaSJN9FWzKcPxTE87t/H08561JdGOP41EHUFI16w7pLdUSHZlggC4cTuNf8NV0Ba1Z3qEWICJzLO4k0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5631.namprd11.prod.outlook.com (2603:10b6:a03:3ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 09:47:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:47:49 +0000
Content-Type: multipart/alternative;
 boundary="------------IkWuBJHKOQxApQOEHAJIdB1X"
Message-ID: <f02954b6-ad66-4040-bc24-ac1035d345c7@intel.com>
Date: Wed, 6 Sep 2023 15:17:39 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-5-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN3PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d9aa87-ed1a-476c-31a2-08dbaebe547d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLBRGd5Is4Scpm5Oj7QdQYkhQpzVU6wUdAlnSRbZ6Jh2vLCtgDzLyII4gMGkwioGaxeZhNRZtfLKywjsZbb9F4tmJNG6NLqq8aCBfVoCBM0xMOqC3xtGWFTUY34+LQrlHPhTGhzrqicGknxnaLMQQFB1mx49oxDifQczOXm0QXWHJSa19Xo7lwOYm/1KqUN3biq0mupUQcrGUvr/VIM7m9uN/5tjg29zMfvUtFQwC1F7oF+KEm2vhFjTuFslW0OhtD2oed21z6E3MBWb3XqxUGXLEoTubaQW0Ol3hnuPIOUJ05+z5btXVtnCgHAAMTvN4CbursqknHpfAR4rACT0b7QH75R1R0sxwFdycyAJFYncpdjGAbmUMp2/LgF+flBV1FrzY4BlKTVcygS/nSPI4yzV8ESDQPhE6fFwmilrE3tWE/U8A45E+Z2aSRlgboE10STXJarBlBTb/STkNYcXSlgtQsVovrBC2F+5q1mGSoTTvqCvPIk4oBeA7VzPPD2kIe1gpf1zGAhso5C8qoiM2r4xssuaoo68Ds21WuFQxXqv7PqMdkdvqdTq8731nmXM+OXI1gXMAClTnlFPR8oxNc8hZ8n/m3C3DJFiPIzs08cdw5xcWYZ8/cfGtB9cNL4JN98HNvknpx2cyq/Ebd6qRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39860400002)(376002)(1800799009)(186009)(451199024)(2906002)(38100700002)(82960400001)(36756003)(31696002)(86362001)(107886003)(8936002)(4326008)(6666004)(8676002)(53546011)(26005)(5660300002)(2616005)(66476007)(41300700001)(66556008)(33964004)(66946007)(6506007)(6512007)(316002)(6486002)(83380400001)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHM3V1hDVk5nVEJTYk1FQ0R4NTJPVm9rL2taVk9RYkpZbXphYTJCWm45WTZz?=
 =?utf-8?B?ck0zNFo2cERVTk1iODhMZnBjSVdTSDVuaUYxd0J1U3VobktVZFlGRElFMTJS?=
 =?utf-8?B?Ymc0b2xsY2I1Z3hCZGIzZm1ZTWVVZDZTOXhFOGdMc1ZjMkdtczVzL0RDN1Nx?=
 =?utf-8?B?aVZBOWZQQmhxRWV2Z05Hc2ZOY3dvTDRDcjZGT2ZiMUVZZnNzQ0Raa1FFemlC?=
 =?utf-8?B?NTV2L2wvOU8rcW5FZ0haampJbC94eVowYmRlOS95cnFwSW1heXd4SGoza0cz?=
 =?utf-8?B?cHVtYS9YcGNHWEI2RGI1T3J0TzdLZm1yWGhhSWlzcitCcWg0Y0pYRU9MNktp?=
 =?utf-8?B?VEdTdHF2VFZEdm4yL3NtRFFnR1NTQTR2UCtCNWFGUERCRlp2d1NzRFFyekls?=
 =?utf-8?B?RVN4NHAxWWlsWXBiSDZjdWJOcUxNNFlIMlhpWXFyOUVzVlkvU1NBdVhUL3B4?=
 =?utf-8?B?Tysxc0g1c3E2a0ordU80eE1xVXA5ODY0NjZybk1MY2oxMzMyZVNLUEJoeEx2?=
 =?utf-8?B?Q2hlZVBxdUNMQ3dVWHQzcWtlQktsZUxPOXJpOTQ2azM3Nk9qNjFiL2p5WGVG?=
 =?utf-8?B?bjVsZ1JjNDlWRzV2elFyV3VnU1dPMDlBaTlFdGlvRlljeXB5QkdHaHE2clhM?=
 =?utf-8?B?RXhxRlY1VGdZbC9GY3VlZ01rTmF5MkhUbHhueG12ZDdLOTJETmZTanpiQ2lD?=
 =?utf-8?B?OTl0cTFZc2lJNUhDNlp6U3BiMk9JbTV3cnRkVUdSMGI2L0p2NEdYWFlYeTdU?=
 =?utf-8?B?TzkwTksrMzFNYUlvcDRodnZjT0N2eE4yRVpEaW5wUGxVd044ekREZTdMSHll?=
 =?utf-8?B?OUYvbkcyT054c0I0ODlSUlRKMmVSYmdlQmY1K2Zid0JGTEFSNFFjQ2VqdldU?=
 =?utf-8?B?Smg1UzVGMlV4c2xBNnk2c1pheE5DUWdjQVV2S1Q0K1FKVE9HYVZETC9yWUJU?=
 =?utf-8?B?ZHZxNlJ0bFVvNkY2Mk4rR0pySkdUWXcxUjA4NGlKd010dmV1azhxMnQxZ24v?=
 =?utf-8?B?dTZLbmk1cmcyNW84ZjBLVEVXNC93a0lxTXU3WjFhcloySVpYTDRiQ29YNDUr?=
 =?utf-8?B?M2F0YmZqNjVRZk5LUFo0Wm9kMmJIb3ZocUZ3ZDFENDBpRXFvOVVmUzBidkF2?=
 =?utf-8?B?Uy82YTR0U1RmM1NvQmxSbFVsSGVEeHN1enM1elhYQ0xVUkFJMjdMa2VJYmUr?=
 =?utf-8?B?aDh0bElNM1B5ZUdVRlVvTUZmQmZCREMxbCtxNVorQlFOUFREakJZWHBOcjl6?=
 =?utf-8?B?Yk9IRTBQd1Qxam1tcm1kUFhORWRwSDBQVG9HWnYwQnNrclNMeUJnTHNiakdv?=
 =?utf-8?B?QUtpZHVSbjl0UDNnQ3FRWEY2d3RWQXdSMmJ2WGZGOFhIa1liaU1KR3BoeGh4?=
 =?utf-8?B?MkhINHk1bWordjg3a1pnNEtkOWUyTFFkaHM4NXVuZjlNR1VLQjYwbUVqT0Yv?=
 =?utf-8?B?UjNYa2FSOWRaaVgreUJGM3lwUGJPd2pKbzd4WitVaXRPK0U2dHF4cjlaQ0dJ?=
 =?utf-8?B?WVZubGQzM1lzUyttaFBPdTJISDFxenNxY0d6blhMUDhGU0MvUVpROURnazgy?=
 =?utf-8?B?UVNHcEFGbG52QXFwOXlzbFJxSGNwNjhkbmpZN2ZBb2gxSkY4eWlwekdlckps?=
 =?utf-8?B?NUhMcSttK1lXZ1grZDgrQXpjbHFwZnNScGhXWlBSM2J5bUNTZTBBbCtXL09H?=
 =?utf-8?B?VHBlcjFaTmxaRzh5TlZlY2pKVFVaV2Zybnc3cXJzc0ViQXR2TS9zemRtd1dm?=
 =?utf-8?B?czBvQVlXZFBrMEJSQjFYbkEzb2hPelY5MjBwa3RoTU56UXU0VlpzK01yb1Mz?=
 =?utf-8?B?MGV3VXRhV1dLWGFKVlhDQ1ZGTWZvK0JuNUVuTU4wZmFGcUdsci93Y3Q0Nk91?=
 =?utf-8?B?a25xbFZYQlkzVFFUOHo5R1NWcnBwSk9qYlo2T2UvLzU4ZnNOaWdLN3RVNkxh?=
 =?utf-8?B?SC9JOWVKMDVYaGVPU041c1E2Q1ZzeEdGTGI5SmZJdS9PUUQvazN1Z21lQ252?=
 =?utf-8?B?QkZ1bmY3Q3F2S0VJMERMcWVjbjhDaU5abGhrL2l4bjd6RTJDVjBORW13OE9W?=
 =?utf-8?B?VG5CN0wzaXRUZEVtY3VYYmNkSTJvS3NZdFBpc2JCSnFCcUlCcHFiNGJRYWU2?=
 =?utf-8?B?U3BQNGtEUmxjZ3N1SGZUaUJBaHdUd3JVSW5ZVjg4ak5EYzhtMkdsREd5RVpV?=
 =?utf-8?Q?vj9j1VIdBl4rbYVCjmx1yOs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d9aa87-ed1a-476c-31a2-08dbaebe547d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:47:49.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyCJQ3/CeGbmvr6vn0FcYYyVzc87Q6eGsVMhitb/k/Fpvg9aaeSa0hmr3LxKmOPUQCFEZVo5kHxOZjm1hTHtceC+xm418G81s5w/VFEPehI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5631
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe: Record each drm client with its
 VM
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

--------------IkWuBJHKOQxApQOEHAJIdB1X
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> Enable accounting of indirect client memory usage.
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 1 +
>   drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
>   2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9cbf2f63d641..f5f832c8ed42 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2057,6 +2057,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	args->vm_id = id;
> +	vm->xef = xef;
shouldn't it be applicable only if |CONFIG_PROC_FS is enabled ? |
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>   	/* Warning: Security issue - never enable by default */
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fd2178dbde3a..db8523d81d0f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -336,6 +336,8 @@ struct xe_vm {
>   
>   	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>   	bool batch_invalidate_tlb;
> +	/** @xef: XE file handle for tracking this VM's drm client */
> +	struct xe_file *xef;
Same comment as above.
>   };
>   
>   /** struct xe_vma_op_map - VMA map operation */
--------------IkWuBJHKOQxApQOEHAJIdB1X
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31-08-2023 14:35, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230831090536.2949934-5-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Enable accounting of indirect client memory usage.

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9cbf2f63d641..f5f832c8ed42 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2057,6 +2057,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args-&gt;vm_id = id;
+	vm-&gt;xef = xef;</pre>
    </blockquote>
    shouldn't it be applicable only if <code style="padding: 0px; tab-size: 8; white-space: pre-wrap;" class="hljs diff language-diff">CONFIG_PROC_FS is enabled ? </code>
    <blockquote type="cite" cite="mid:20230831090536.2949934-5-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fd2178dbde3a..db8523d81d0f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -336,6 +336,8 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+	/** @xef: XE file handle for tracking this VM's drm client */
+	struct xe_file *xef;</pre>
    </blockquote>
    Same comment as above.<br>
    <blockquote type="cite" cite="mid:20230831090536.2949934-5-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 };
 
 /** struct xe_vma_op_map - VMA map operation */
</pre>
    </blockquote>
  </body>
</html>

--------------IkWuBJHKOQxApQOEHAJIdB1X--
