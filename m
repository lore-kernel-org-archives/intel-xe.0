Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78CC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D9810E009;
	Mon, 13 Nov 2023 21:13:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD72210E009
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 21:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699910017; x=1731446017;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gI5JtX9UnNPvLosroYqu4ZrHgtn/2jLztJ0rsujW4Yo=;
 b=X+VxosbcOh5Cib/gEpEKykj/deIje0/kEWL+gaWjcUvj12T2waSWF/bp
 1w5Iu+US+UYUFb4xHME8c2JEQgJIRHIcDkWJHxpK2Ut9kw/r20UtixMLF
 wzmxtCA5XwhlTh1O2rLGDKXk4jUd+1e1dl1UvgQx7Da1JX008U+cH57RR
 vxKODgnupVax+gmIXo5PY07zl2a1tkXgjIKXVPcGUbHGLWPSrPMUOTmD3
 xxNYmdzavtxEbkBi84umaSFzlyZ4FAoqVlifR4gdJiprrThjGKqc901eV
 8YtLikSyD8PtiOjJM9VQ2SablCImk9SycwyDmndkvH9HQ7DldyKuHDu4E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387679269"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="387679269"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 13:13:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1095864280"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="1095864280"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 13:13:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:13:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 13:13:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 13:13:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8hIuZo3A9hYDbnM1uyi5MdFGT7yhlSQg/lVQKZ/jWRMOlyy8kuVMgnVJ19RV6WqOmB37J2ixbbBxsurNfXApN9Q+iuOo4Zn1/K+akcBxXe+cwshvcnJwsxIJumgpwLu7UdXci0z7dONQuzwrFmtZZWXTuXxZ5SgZeVjXE4700Jyp7N1Fj9bxb+H2gdIYIVQhVB/XAb1+NSivI4uHFSZiuEFvTKqA5craCGFys2WZWc8pJKMLOx9JIRhEL668OogIJ94t1CKOt4yRQ1qPPcVuOSByymsEDSK1jNl1gXq0OfK7BmTcRkfNMcY/EkI4m05/uvHcmjv3P4Nicp8J+1Niw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K8IGFPU0YJ+RHjDh+JwqT84tdG7a92Sep8cU51wViw=;
 b=Fq/vMed2EcyV4FAa29hRRbQlkoJJxnPqVlsGv0XMf1eFSe9MNW00PlWyR8D1zJBANMiRxVCLxeK51bfwXMbii7dHUMk5yVG+Aja2xMTUK46v4ix2miqdv9yJZAcFQlaSuvJ1iCIkcUHMkJcd3uL2rncpQhvYfP6Alw/vqWsQ7gvCVFhYEtX2sKP/zZRVt5Ml7B8lFFae1aZkRT2qw66wDFxPwD/IIAi/ikyC8CMtCMtnJuWa+I0ld03Dezdq5Ph2aEbO8m8kyxeDYsohVH3RKOWzAyHMJaA4t/SnoTlSWA1DAENaByKROumpvZC8ZqBT6X2/C7szFw3HENU7j7V7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 21:13:31 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 21:13:31 +0000
Message-ID: <19126e51-9ecd-4ae5-8b2c-714a9b2ba57d@intel.com>
Date: Mon, 13 Nov 2023 13:13:29 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-xe@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <169844600642.19711.12449247381862472728@emeril.freedesktop.org>
 <e97a2cce-2b78-4b59-9b72-561ca24a58b3@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <e97a2cce-2b78-4b59-9b72-561ca24a58b3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: e2de0803-76a8-4277-d5ac-08dbe48d637c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q/RElWU62oj35zDURihLkIhobJ6bv4Y71Ij9xR1nlOue6Tq8d/pPpld6oreH6NbXGWtPC/RCoC+mhpSJb+WAC4RBax7/Qjj3/m4huGOe7QRLr6dH+hi+8abJ+WjJEjTJII5WhiORTnSMn054zBkX0uwOapKi4PIVlsRf1o3vLVWpAOwZ2q3W6yGmnZ9dZ6pQqqsK0NQEzcGolxYXQq8xXO6c1AKMIXkP7yiT+eaqEb7+VqANJoccrwAxygi71Eonb7w8yG9z2pFvDxd20ZT/IYL3RaqGNV6v4Lx2pXxtO9sz2k2q7G+Rw7ObnR3B21bLKV6F8JoFHtPLu6qkh6UbFsbjVRTXdLVYpLpkK/DpUjZRJkd4tVUt58HjW3WAvvwWmnwiSQprp2EaeCdiDLwA83mH22E/6tZgqBJO9tW2iaKQvXSNGl0uct+89nZ2P4BCMW4UdlfOWYYEfGtCqpr6tjKdQZ1d8EsNx5EcBCbNRphFYkS6vPZyAV9UUwFXY1zLM/jyFpxLbYRX27NSoXRQ/tE7jqW7qRhZL1jRVSj6CUbIjgmM+KHoseD9SN1hs9RhFxHdEX5nAUPYAuW55gxws17BzYhZkwJwHLJc1Ph+FyuhUi6gH5gX63Y2DiWZccZu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6506007)(53546011)(2616005)(6512007)(83380400001)(5660300002)(41300700001)(8936002)(2906002)(966005)(6486002)(316002)(478600001)(110136005)(66946007)(66556008)(66476007)(82960400001)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWNpRVpqZWphT0Z4WW03cVZ1NStQczZ4dGMzZnJ0K1Z2Q2FFWW1qMXhiTmNS?=
 =?utf-8?B?UUpORXdYTEw2azlhR0lNZmR1cnM2TmNqT1FmV21MNytxV2UrZG04KzU1YWRk?=
 =?utf-8?B?TVRLeHh1NHBITkNwQnVQbGs4YmcrMmVPQ1lQYmNXK2Evc3pNU2h6Z1M1b29R?=
 =?utf-8?B?V3dGd2xldHI3dHJiQ082ckJhcnJjNjF0blQwRERxZUNqRFVhN2FzdC9mMldU?=
 =?utf-8?B?ZVpHY0VhSmJMbmFDN0RhVFlTSmtIQjFlU0ttNWROTjYveW1UTXRSNXJKNFFS?=
 =?utf-8?B?RmMrR2VzZEYvSjdwdk92RWhyN1Q0ZjJraytPbE1DWGo5YXFwQUZ2TEZVUzVE?=
 =?utf-8?B?dzJ2R1d5OUR5RFNsQTNrZU05Q1Q1MDYya1MxbUhtYnZSRCtHR050Wmc4RzZ5?=
 =?utf-8?B?emVkdkZDcUtlVzJNbTNJVTkrTEUrcFdzYlg0YUZvMEpmNWhSNVVGVS8raSs3?=
 =?utf-8?B?bittZEJ1aTJnS0k0UGhSTkdDRVowVGlIdmNIbmhLV3RRZkYxa1VGV3ZBQ2Iv?=
 =?utf-8?B?MzdlOEhrK3FFWjJYZzcrNzU2TnJpN3d1ZnNveVpXOENFYUZGMWRqeEUxR0dD?=
 =?utf-8?B?MG0yMUg5cXY4bUcxUDJGTm1DTWExcTNvTm5pT2JoUW81Y1lSMm9vc29ieHlH?=
 =?utf-8?B?WjBFenBrV0RYUHJ6OHpMOXMycEw0a3I0bUFDME9aeVU2NisrZVliRWpMUTZF?=
 =?utf-8?B?andabnRKM2RMcVNDZDFRSjlZbTdjdnJ3U1FHN2xpdXMzbVRtcmQ2VndrUndy?=
 =?utf-8?B?ckoyVjh3MU40QnlZWHBNdno3Y1RjN2hVTjQ4bnl5V0o5dXI5ZXJUVnJwVDdS?=
 =?utf-8?B?cnA1UnJlZGh1d0R5RXlNSWhpalQvUGxFSGpkOElZS2c2M2Q2ZUl3dFN4YnpL?=
 =?utf-8?B?emp5MlZrVTgxTVBPWS9kbzdGMjRMa0NmeXpuc3VnWEFXd2JvTU9UV2tJUkNU?=
 =?utf-8?B?U3psZmpZS2xST3QxcVErU3ZidUNDWGkyVy9oVXRkalZHZnM4cDdIcnA3WGs4?=
 =?utf-8?B?czFJUXVnNVd2UzIydi9sOENlVk53OUlMaS8xQUkyU0tTajJidFN4RVljU09l?=
 =?utf-8?B?cEFPTlM2MmIxdjlKRE9meFUwYzlxRjZGaEo0WXRrSUlHZDJ2SElRTEthNmRl?=
 =?utf-8?B?Z09UcnZQUU1aZmFncVRHVzR3YndOMGdHZllwQkFJKzdoWXJkSkJ4Vzd0OE9P?=
 =?utf-8?B?Y0dxekRKNzZMTC84Wk11VGlReDVia3lEQytpaTYrNHhrMDh4TGJEcEtrTUlJ?=
 =?utf-8?B?NTIyaUNQc21VMVpNZThsdE92cmJ5Mjc3Ym5WUk4xa1A2VkVxYVd3S3RQaDlF?=
 =?utf-8?B?Q0s5bk1Rb3pVUHhpRHBLMFFVdlI0anJjYjZkMFk0UVJYVmpSa1JPUWU2eWtW?=
 =?utf-8?B?aHI5QTNaNGsxb2lyTmhBWGdyeDNWZnM1YVppc2Y4bEZrRWFPNFlOa09jbGgr?=
 =?utf-8?B?TkQ1YVNBdEptUHJ6VVN5OWJOMys5QVZRaXhMeXFIV0ZwY3dHQXFJSEtxRnAz?=
 =?utf-8?B?bmxpZCtFLy95eXZSeWRhOWkyeUxpcHBjZTBoMDVYYWJkVCtwM1NjQzNpSDhC?=
 =?utf-8?B?Mk92RndGdVh4ZnUvQytaZkpHN29QU3ZnUEl6cHVEem9BdlRMNkJmbTBpMVo1?=
 =?utf-8?B?bUphcnp5cERzdFNMelpMbHlFbFFGMUd4RHdsN2dOYUE0VlE0Mm9ISlFNSnBh?=
 =?utf-8?B?N0FkWjJpKy81UGZUSk45NVdMZmVnczhUcWxEU09sOXgyblMwRjVZQ1lQYi9j?=
 =?utf-8?B?NjlmanZ3SFRnek0xR3kxTnFRcTEyaVFzNThCaTY0eFVCbDN3Vm1FTHpQTkNq?=
 =?utf-8?B?VERSSjVpMVdnTVVOdU12RkZNakEvL3piKzV6MjdzdW9YYXE0U1NGOExRTVNU?=
 =?utf-8?B?U09tNkhhQjBJcisvcWg4VmtRUjBwamNyRTNOZXl0WGEzMnNPeC9CR2VqL2Q4?=
 =?utf-8?B?TjhFSzJMYVcyT3BtL0lncGJ4RktpK3NONStOVlpUakNpU3BkUFNjeGtrRnVS?=
 =?utf-8?B?WTZDRXVqYWVGMjBZSTZJQU91ZnEzSjhKU2JwZEhpRGRuZFE4T0JMdjNRb0Yr?=
 =?utf-8?B?SHJTNXVlUWpnQ1pDL0NqaEJtV3NZR1p4NitSbk10K080a3NUM2VaeGcrek82?=
 =?utf-8?B?WnozWDVuajFib2pMTnZOTWtGYVJkcXE2c0lBMmplT2xQWE5RTWZzU1d6dE1X?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2de0803-76a8-4277-d5ac-08dbe48d637c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 21:13:31.4961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNFgRXdumO1hX5ZQQlupRXc+Uolw0Z2sT3nJZIg1GBo0BF52oRkJZEO7hb+QLBe/bmrFGntz3kS20GPcimX4D8YvVQTena/fTixjirY4A30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_GSC_FW_?=
 =?utf-8?q?loading?=
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



On 11/13/2023 12:30 PM, John Harrison wrote:
> On 10/27/2023 15:33, Patchwork wrote:
>> == Series Details ==
>>
>> Series: GSC FW loading
>> URL   : https://patchwork.freedesktop.org/series/125717/
>> State : failure
>>
>> == Summary ==
>>
>> + trap cleanup EXIT
>> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig 
>> /kernel/drivers/gpu/drm/xe/.kunitconfig
>> stty: 'standard input': Inappropriate ioctl for device
>> [22:32:58] Configuring KUnit Kernel ...
>> Generating .config ...
>> Populating config with:
>> $ make ARCH=um O=.kunit olddefconfig
>> [22:33:02] Building KUnit Kernel ...
>> Populating config with:
>> $ make ARCH=um O=.kunit olddefconfig
>> Building with:
>> $ make ARCH=um O=.kunit --jobs=48
>> [22:33:23] Starting KUnit Kernel (1/1)...
>> [22:33:23] ============================================================
>> [22:33:23] ========================== xe_bo ==========================
>> [22:33:23] [SKIPPED] xe_ccs_migrate_kunit
>> [22:33:23] [SKIPPED] xe_bo_evict_kunit
>> [22:33:23] ===================== [SKIPPED] xe_bo ======================
>> [22:33:23] ======================= xe_dma_buf ========================
>> [22:33:23] [SKIPPED] xe_dma_buf_kunit
>> [22:33:23] =================== [SKIPPED] xe_dma_buf ===================
>> [22:33:23] ======================= xe_migrate ========================
>> [22:33:23] [SKIPPED] xe_migrate_sanity_kunit
>> [22:33:23] =================== [SKIPPED] xe_migrate ===================
>> [22:33:23] ========================= xe_pci ==========================
>> [22:33:23] [PASSED] xe_gmdid_graphics_ip
>> [22:33:23] # xe_gmdid_media_ip: ASSERTION FAILED at 
>> drivers/gpu/drm/xe/tests/xe_pci_test.c:45
>> [22:33:23] Expected mask == 0, but
>> [22:33:23]     mask == 67108864 (0x4000000)
>> [22:33:23] [FAILED] xe_gmdid_media_ip
>> [22:33:23] # xe_pci: pass:1 fail:1 skip:0 total:2
>> [22:33:23] # Totals: pass:1 fail:1 skip:0 total:2
>> [22:33:23] ===================== [FAILED] xe_pci ======================
> I assume this failure is not related? Not seeing it could be connected 
> but GSC is media tile specific...

It is actually related. The kunit checks that no unexpected engines are 
defined in the engine mask for the GT, so it needs an update to mark the 
GSC engine as expected on the media GT. I'll include it in the next spin.

Daniele

>
> John.
>
>> [22:33:23] ========================= xe_rtp  ==========================
>> [22:33:23] ================== xe_rtp_process_tests ===================
>> [22:33:23] [PASSED] coalesce-same-reg
>> [22:33:23] [PASSED] no-match-no-add
>> [22:33:23] [PASSED] no-match-no-add-multiple-rules
>> [22:33:23] [PASSED] two-regs-two-entries
>> [22:33:23] [PASSED] clr-one-set-other
>> [22:33:23] [PASSED] set-field
>> [22:33:23] [PASSED] conflict-duplicate
>> [22:33:23] [PASSED] conflict-not-disjoint
>> [22:33:23] [PASSED] conflict-reg-type
>> [22:33:23] ============== [PASSED] xe_rtp_process_tests ===============
>> [22:33:23] ===================== [PASSED] xe_rtp ======================
>> [22:33:23] ========================== xe_wa ==========================
>> [22:33:23] ======================== xe_wa_gt =========================
>> [22:33:23] [PASSED] TIGERLAKE (B0)
>> [22:33:23] [PASSED] DG1 (A0)
>> [22:33:23] [PASSED] DG1 (B0)
>> [22:33:23] [PASSED] ALDERLAKE_S (A0)
>> [22:33:23] [PASSED] ALDERLAKE_S (B0)
>> [22:33:23] [PASSED] ALDERLAKE_S (C0)
>> [22:33:23] [PASSED] ALDERLAKE_S (D0)
>> [22:33:23] [PASSED] ALDERLAKE_P (A0)
>> [22:33:23] [PASSED] ALDERLAKE_P (B0)
>> [22:33:23] [PASSED] ALDERLAKE_P (C0)
>> [22:33:23] [PASSED] ALDERLAKE_S_RPLS (D0)
>> [22:33:23] [PASSED] ALDERLAKE_P_RPLU (E0)
>> [22:33:23] [PASSED] DG2_G10 (A0)
>> [22:33:23] [PASSED] DG2_G10 (A1)
>> [22:33:23] [PASSED] DG2_G10 (B0)
>> [22:33:23] [PASSED] DG2_G10 (C0)
>> [22:33:23] [PASSED] DG2_G11 (A0)
>> [22:33:23] [PASSED] DG2_G11 (B0)
>> [22:33:23] [PASSED] DG2_G11 (B1)
>> [22:33:23] [PASSED] DG2_G12 (A0)
>> [22:33:23] [PASSED] DG2_G12 (A1)
>> [22:33:23] [PASSED] PVC (B0)
>> [22:33:23] [PASSED] PVC (B1)
>> [22:33:23] [PASSED] PVC (C0)
>> [22:33:23] ==================== [PASSED] xe_wa_gt =====================
>> [22:33:23] ====================== [PASSED] xe_wa ======================
>> [22:33:23] ============================================================
>> [22:33:23] Testing complete. Ran 39 tests: passed: 34, failed: 1, 
>> skipped: 4
>> [22:33:23] Elapsed time: 24.485s total, 4.192s configuring, 20.173s 
>> building, 0.098s running
>>
>> + cleanup
>> ++ stat -c %u:%g /kernel
>> + chown -R 1003:1003 /kernel
>>
>>
>

