Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FDCD1296
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2AD113240;
	Wed, 10 Apr 2024 08:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmQUdJaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4F1112888
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712736987; x=1744272987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=buChbM7EXQLDv/Ntm6F5YdDrO/pWJCdj+CvC54VQOdM=;
 b=HmQUdJaB/dQKsrSOcEXlfApE+kBCv7B+RyKTYNR7h0F9CWaVPbGahzlA
 1UJDul7mi/LzSJTLCfIAFNlkSYc/V/peBaZP1EMAwNjrXJFcjJx/MlfIE
 XhHA0485CBVYL4FtA1Hg4Ngn8++gfGqmfwBxvk1i/TF11Nqls71Ypr6tO
 VKz1ZRY32r+xgzK05LlV6l1fMVvupRUp8A0550hwrTN5VT7Lc9f8LRkxQ
 7QGBYUBVwZRo0FG0rCi/cyqImNG1QM4oonkKBiURnWS2EO/twBYKcsM43
 gjuAGu6WM9pPg071Wto9d87wnuVqcrp/mnKjfKvavVN86BLk+3moih/6A w==;
X-CSE-ConnectionGUID: zFoKo6ykSgy8G0sdVyX5Hg==
X-CSE-MsgGUID: FzmnQ5KsS5+IETaDwfKBzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7958475"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="7958475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:16:25 -0700
X-CSE-ConnectionGUID: UyIH9Y4MT9eOuXq/XROXHA==
X-CSE-MsgGUID: b2MHLf/BS+iGgP4MZGGTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="25269096"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 01:16:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 01:16:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 01:16:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 01:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2vWz0ZPYQG1KMkPs3KHjcgyqhr3Do7GgNexSTbPOcSgT0XaPFSQn1Kh8O48/JMn99jFookrrbO+itdjxqrKa4htn4RETzR5W7A4liwUmIBIpDHuaBdC3X0WpSXFCmDojjkykwd6HxEBXSJEK00aQYuskyJpfWdOJy8zkvKHI91hiAnO/U1n6ujbxN3PnccEI8QAWq88nmQsvXjkloTvnBF8SttEw0EiEnYo9hrjDMmn3O8gqOb//tqEsoQVCKOHC2l+C9eWUoAVkWlBNnOyYw8ASvapkEQ9NXaT5cDze/QUddDn7JqarksWspn+MeA09Rl44SmWvWvvKKcPpdITGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiiUvuJ4OXkAindMg4zJUX1/x0gbTavbs3IgV1+CRAs=;
 b=gBY1VIBC6r2xn6rvNvgVqmiriSlwIZH/R0+fe9y7OcUwVhe2D3oim0ezSrODyF6XqtvlviKeMadg/rVkUj3BM8fR9oJPawSanpBtHI9H7esBHWE1VnC5B1J1/xJxnkN0akLp6UNqPJ91ZjgzH3PbmfRMYRCtFkHroPhcs5fQxI8gGM7CXoNUC+LH80hn9L1kDRhuIjNQ5E/FUmjJeX9ujpnOMxDL5G+NOwioedfPhrxLZ9j0nYGWu/GNRDb0ahqlEzFyXMgQXEcvqMkDIQNL/Jh1B9C36EBxM2P/HDK4ev4mkediGoz0/imegnjOIcypIv0iyZGPSAKOBXyVroqqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 08:16:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 08:16:20 +0000
Content-Type: multipart/alternative;
 boundary="------------vq41ahs4j4JQWo2sZWUHOQ0w"
Message-ID: <cbe92280-f46d-42a9-acb4-35e080844562@intel.com>
Date: Wed, 10 Apr 2024 13:46:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe: Incase of action add failure, remove sysfs
 only once.
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
 <20240408144944.604448-3-himal.prasad.ghimiray@intel.com>
 <atf7fcy2ignoudayaogol7v3bk5qcxmpmjtseltdbcyykzm55n@x2mwopb74dns>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <atf7fcy2ignoudayaogol7v3bk5qcxmpmjtseltdbcyykzm55n@x2mwopb74dns>
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB6349:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJ2xNEA+RTUySIOrHx8GoYNX4aECI8qNIyU3nyOlSHiAidmvTSZ/cd9xoW9hAleJFaZb80YAi7U+7xZBMGoYTPdBu8Y+I2TMAX1sl6qROpBwqewbdIGu31XGuohB3pOqwuqmS21UvwLoilpRnjOjxLM9NycPlXRyi0+oY+IOLghaK2XAAQWRa4tOMsuHLPUFbAtLDBP0xIHyfA39vCaPF9aZNXtfG3h+0NYxMGovpGfyxhfYwDw4aeEGqu61GJ/2jcTZX1ewj/4Dssj6Ws7FoNVVyLdnD5/IiRcODlfeYPElPbCgnwFJOy1OUZwHxA0Cs/gDU5yH3JoJx95D6LlNymdcf/uX+luGjohUpaFNA2V0KOsp1u+QnaRG/gMPJ5Lqbp8xsGCQRSBWx0Fw3J20ocj7CRgXFl8NeX9IxJBPgIEfzTZ/zeV1AdEEwQisejiu082RmmZVWVpPxiOOD3fOJAYL0CdUyWTqSycNeXvi/7Pfm4KPrG1NO5Epo+hGDF07fO9GGjMfJbfCXqrV4AZvoiqHkwKWFeHJmeuEZFotNtx2WHruGXSOsBEhLaOaTwg05UpVvmBmDKN7iFYnvJZL1Zb9UNF+PIvVrGGHxGl6PxCH9uGpgnOWeBHYH9gZKDm7orAmD72kVQD3XsGD7+RMEN7eRckKXnG+xI+XGc5QoZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRxL0xnalEvNkxLMjQwVXU1b1B1NkRtdmZCQVlnSnd3MVJlZkZ4WlMyL0Vm?=
 =?utf-8?B?aGpYbXBjUlQ4UnhWME1LTVNpWk9VRHVrc3Y4NG5GcUdFcjdRTUdmL29wdHZP?=
 =?utf-8?B?TmgxTlQ5OGJYZEJPbHczN3NhL2dOc3lHTU5nclZGNnA1cEVZR0ZTVXRvdmJR?=
 =?utf-8?B?RjFFNGlWYVo0NVBxM1ZGYy9XQWlJMDE2QnRMOWFhWHVUcG5sc1ZvZXdUdm5J?=
 =?utf-8?B?WVZrR2tyN21YR2NyR0FzT09oM2tzdDZEb3pjZnRsai9CYzdIZDZaR0RVMStz?=
 =?utf-8?B?UWIwa1ZldndGbEExUldMeXRKYTRpenhOMDVONFFyZVkyWHBRdFdSQ3NtbHFZ?=
 =?utf-8?B?cUFoQlF1N0IrTVB3a0xVenpCR2NUQTlodCtLZjIvb2hyTE95WEI4Wm9Jb3hP?=
 =?utf-8?B?emdZUlkybXFYVjZXY1kzeXViQXNFTTB6Nm44UWhJMUdDNmtRQm5oT08wR24w?=
 =?utf-8?B?ZWNnc2VyYktJSDFKTHRQWnl0dVNuMDRXZ3duamM1aVcwTWxQZzJvRFRMM2hU?=
 =?utf-8?B?dUVodTAweU9iVU1POHEyblZqMTkydTdIM1ZGYUJHdkMzQ0hXSzZaQkRpZnpO?=
 =?utf-8?B?d0JFbWRZQVVjWk1nbmVVMmFHay94eW9rRWw3anJsbVVJL1ZDb242YUloMStZ?=
 =?utf-8?B?M0phcnNkUkR6YktES2pQWlU4c2prSlE3bFhDeHFUVEVzeW9sM0J1MlZDbnRB?=
 =?utf-8?B?WGdSNkRkUUx0NVpNTWlVVW5kZ2VWekF6WmJnMEN6SzBDL2NQYXFXQkRsdmcr?=
 =?utf-8?B?VWZrMko5RHQzMkFUaVMrMlFYR2Q0YStiaFVodUNFMHVKRVJ3Yzl2NkFoS2Js?=
 =?utf-8?B?eEFpeGE2K2Z4VG81a1d5eTJHTTB3aTNodXNXUEFEeWVJYUJGbTl2b0M5MEFG?=
 =?utf-8?B?VzNSRWY4U2syTlRSODZoS29Oa21xbURmMU90VGkyUDZWb2syUXp1T2R6ZE1Q?=
 =?utf-8?B?Rk5VT3UrWVIwVVVWbjhNOVFKWVZ3UnFuVElnQWNTaXRMZ1FlY2p1aTE3ZERD?=
 =?utf-8?B?c1hKUGc2eDdPbkNKY05Qc255YXVnaFdlWm1kRW9qS1l0NHlTclJTc1g4SG9r?=
 =?utf-8?B?UmNpUzlMdEVORkh6ZER1cXV6Y1k2MldrUENOTjVIZlZWNGszU2paWlVoUWgx?=
 =?utf-8?B?UUVCc2ExSFA1QjQ2ZEphTjU1QXZSbEp2cWJhd3JVU1Q1OU93U1BFazNWeUxI?=
 =?utf-8?B?RjJuaVRzNG5zbXpaRisxQmdaa3hQYnB1eFBHTlZENk5SY0JIVlhFN0JGRHFv?=
 =?utf-8?B?WE9acE9NQXEvcjAwcjM1ZTE5QVZPUVVEVlVqRm5hMGloV0NkVlZSK2J4dThD?=
 =?utf-8?B?aDF2eUZJb2NpbEJmYVg4eCt6R2dEZjlNMyt5VnNha2VrUHRpY2V1VkNjdldu?=
 =?utf-8?B?RFBKM3ZKVE9JcEZrVnZDTGU0WGcyZ2FCS3lVSnRwa2NJMm5DdExXTk82RmQ3?=
 =?utf-8?B?V1FZMklsT1IwZ2VneXNCN0MydHZZaXZzOEVuMy9oOFBOODNtbUtOM01YUXRB?=
 =?utf-8?B?YUhJSEh4amFUNjJ6UHBoWS9lY2Zmemp5MG8wWkNQQTA3N0FRSVN4Wkdqellu?=
 =?utf-8?B?U1NzN3BZK3FFS3FqN2R3TGZ6aFV1VjhGbkhFQmdvOWdzdjdwcXNuUlpCVXJM?=
 =?utf-8?B?bFFNdFdZdXNJOUwxaEtnYjA1YldGd1RjVkJSckhRdEQwbnZsNVRHZHRkQTE5?=
 =?utf-8?B?ekhLMW1PLzBPcC9ucTlpWEFldXRleFZOTUlONUd6Wk45c3lkZEhiUlNjTzdE?=
 =?utf-8?B?ZVFRbW1jeHRnV3l2Z3lrSy9wUmVBOGc4aEpVT0VGZlpjK3pTRkQ1blEwbjA4?=
 =?utf-8?B?aXAvODZWQzR4aWxCL0lqeVExOXEvQXhlQ05qM3YvL3pjajkzMyt2Q0pxWCt1?=
 =?utf-8?B?bmhRU24wVUN3and6dEs3TURIRUp5TjBXVjZQekhOQzh1NVhKdGhXV3RuTGta?=
 =?utf-8?B?dkcvVjd5TVhmUzlVYk93dGwzVUNxRy9PVlY2d3lvTy8vQjBxRlE2eHFJSytT?=
 =?utf-8?B?bFp6YSs4YWhhUHIzSFhNNE5PYTMxeGV4YmV4ZHdNRFBXRnVXMU9hVFY4N0Na?=
 =?utf-8?B?UE9QWkROT2U3aE04Wm5JTVY1V0p5QU5YbXdncXVzTXE3T1ZWdlM2T09nSUdi?=
 =?utf-8?B?VWIxMGR1d0ppRmFDb2pGS2pBK3V5MjF3QTVtZXg1RDhneE1Tazl6OUxvdDVj?=
 =?utf-8?Q?m3VeNpSUumyXWvQRSkFS3aY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c16bdd7-8a88-428c-9b21-08dc5936805b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 08:16:19.9317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+eI865sOCPbTIvzgfiarseaFOudiZ0Raq1YLSHUjCl80e8Y0DqmsTknKXkfgIzYrN16fs+IyyNU5Ko5AIz+sKrDai1vU0HV/OTtV6JuMYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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

--------------vq41ahs4j4JQWo2sZWUHOQ0w
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-04-2024 01:22, Lucas De Marchi wrote:
> On Mon, Apr 08, 2024 at 08:19:42PM +0530, Himal Prasad Ghimiray wrote:
>> The drmm_add_action_or_reset function automatically invokes the action
>> (sysfs removal) in the event of a failure; therefore, there's no
>> necessity to call it within the return check. Additionally, it issues a
>> warning regarding the failure to add the action. Consequently, there's
>> no requirement to print a nearly identical warning within the xe driver.
>
> there's actually no need to print a warning at all? If we already add a
> warning in drmm_add_action_or_reset(), that should be sufficient.

Indeed, you are correct regarding the warning need. Including the 
warning print from driver doesn't offer any additional benefit. However, 
I opted to modify it and maintain the warning print in this scenario to 
prevent the potential noise that might arise from the static analyzer 
detecting an unhandled return type from |drmm_add_action_or_reset.|

>
>
> Lucas De Marchi
--------------vq41ahs4j4JQWo2sZWUHOQ0w
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10-04-2024 01:22, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:atf7fcy2ignoudayaogol7v3bk5qcxmpm=
jtseltdbcyykzm55n@x2mwopb74dns">On
      Mon, Apr 08, 2024 at 08:19:42PM +0530, Himal Prasad Ghimiray
      wrote:
      <br>
      <blockquote type=3D"cite">The drmm_add_action_or_reset function
        automatically invokes the action
        <br>
        (sysfs removal) in the event of a failure; therefore, there's no
        <br>
        necessity to call it within the return check. Additionally, it
        issues a
        <br>
        warning regarding the failure to add the action. Consequently,
        there's
        <br>
        no requirement to print a nearly identical warning within the xe
        driver.
        <br>
      </blockquote>
      <br>
      there's actually no need to print a warning at all? If we already
      add a
      <br>
      warning in drmm_add_action_or_reset(), that should be sufficient.
      <br>
    </blockquote>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">In=
deed, you are correct regarding the warning need. Including the warning pri=
nt from driver doesn't offer any additional benefit. However, I opted to mo=
dify it and maintain the warning print in this scenario to prevent the pote=
ntial noise that might arise from the static analyzer detecting an unhandle=
d return type from </span><code style=3D"border: 0px solid rgb(227, 227, 22=
7); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y=
: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x:=
 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pa=
n-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-grad=
ient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-positi=
on: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-nume=
ric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset=
-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,=
.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transp=
arent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; =
--tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue=
-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: =
; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast:=
 ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-inv=
ert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sep=
ia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --t=
w-contain-style: ; font-feature-settings: normal; font-family: &quot;S=C3=
=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;=
, monospace !important; font-size: 0.875em; font-variation-settings: normal=
; color: rgb(13, 13, 13); font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;">drmm_add_action_or_reset.</code></p>
    <blockquote type=3D"cite" cite=3D"mid:atf7fcy2ignoudayaogol7v3bk5qcxmpm=
jtseltdbcyykzm55n@x2mwopb74dns">
      <br>
      <br>
      Lucas De Marchi
      <br>
    </blockquote>
  </body>
</html>

--------------vq41ahs4j4JQWo2sZWUHOQ0w--
