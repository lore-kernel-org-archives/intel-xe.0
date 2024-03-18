Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FECAC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 11:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268F10F59D;
	Mon, 18 Mar 2024 11:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTiGMwAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1892910F59D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710759892; x=1742295892;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=rZUzFginAcWm7Y2jVTZf6GG8+pVCu7zu1H9VoIyhGTA=;
 b=HTiGMwAGog7uv8pCxced6o8VfiL2OxonkflLolV/dXMakcrvCedVm3Jc
 KWpYvm1z2XIQZkIttYQwRD5LqxgR2V5dMXhHUW6+T8bdDJxFajSkdEWoK
 0r1EXETjrBYqH9ZFTeLZGxnt69DY77vpv/GyS84YMzBXXg+QIwfNUHeHE
 BCyf6UdvJC3m32H8/SOIjefaHiXAG9ujp7TCwupv7zQ86eNqsM5TnSEVQ
 O8JeiWFyI0YY0NcYgvuzLyjH6MyC9Ry4Y8RMGJ0pwIINotoHGfeuiIMId
 jofzK6odMeNLg0d5qZJVl1X3Z9y/ka+0QHt7cecocSsFXJWgiwBqfbLeb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="31001646"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208,217";a="31001646"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208,217";a="13335787"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 04:04:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 04:04:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 04:04:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 04:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+1EoiRmcem32b+8ba19v9T2171/2+lcrVKVBZPhjRivnanOxTV82Jb0xkZfEwJFTRte9CTrNzxfsjDEcakb3Flj6o6PLqzldPe+cfnF6vPfxz1lZ/0Hw0Q9x4T8DG5dLAIjy27kZjLom32BI5YjUbnCKLQYDqe+xRoMDfNWyD81E7Y4rWxzddNdMUJv0yMQoCeY2rx+41clKZax6gS6JdK+PkP2WfaMpjX3KZkulgP1d6FNdzMTKItnn6Rzocxl3ru837ngVnVucn1ebprg19paOZjq/cGiRl04cu7F1MUNEbb/gDQ2alVQMSF4Bgi21bved7h/7r2yjUjeyeImzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot7+ADpfRGM8aepgg2XltNfSN4Q94C57JO3J40NEma4=;
 b=QtdXFsSQACZZsT9NaOTAknDaXlyvGE5pLVucA4J57Zh8wI7O+cXA651/R3Mq1gnhpFlhd88/u2IxywR/kOTMcvgsfrfpxOjGp2+FQQkKQ2a7zHZtA8jLmkga7ZG29nD+6a46Swb8FFUKZzcpl2ogf9XezpTrtZ1GHGSQ7eAquSHtsyz9iQtk1RmDheAgrB+grOaMMvq7w55BrC9GRbQ3FFocjdBBEJRGi10HVYUJO0ujXDqKHGvZsSmc0IzGI+MptZH2IUXDGagU2igg194eBU9J1AaqzNNSRtyLz725qWC1Qmdb6aRJQAQD7YIdgydxUmsGYigL51zvPyMMSmAwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 11:04:48 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 11:04:48 +0000
Content-Type: multipart/alternative;
 boundary="------------RaJvTctCbZzWnwtfUaRwf5wf"
Message-ID: <77d641ad-bf82-4018-8e26-e4d48550f5a4@intel.com>
Date: Mon, 18 Mar 2024 12:04:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: fix xe_assert()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240318103616.26240-2-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240318103616.26240-2-matthew.auld@intel.com>
X-ClientProxiedBy: DB9PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::32) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d397e1-287e-4436-8192-08dc473b39e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0eD7wLojdr79nIVuXueJQDnK8G89wRScJP1caDPZav/501n3iiv6JEkUrvVKOZgnCJrtsxMit01/QGp6un2/E9uP1jqUY/lzVRqDEd1oJX6Jfuo25VLHApsFQZoYSN8i7IdPFcuYorfW4EImGpc2Hek8mCjJeQq1fUam1dlJdUFdvmIYWFK4QT3b5KXuAJkFHcEy+mN/BQfvbiYmt2rjau2DuRVFAitcL7NZOuIXuyizdrf8OayfG6IgNMHAY3nD4ghc23Q3JeBvZacFdcShm34toygWhnmdewgluhsy4Pn8iW4vtzf2LPpQlb0u9n25BYlTZRRUVGFETxq7ikycJELAgM5LtbrvtiRjf6EVIg2ua0VxTTiGGY2ykCBNAHeC6SIyieVhQyUp/Bjv3dEUAZYJ2u2DW0vZFYJ74cBRhx6YbbieaHuutbQd+j6m9fuh7ShPj3oCc3dsh2aNFxg87D/ZPukqhUXMBx/jb+Bs+ujHkEXer5ImnFTe1Ley+UVI3W0bpYk3jcpL1WtE4rw5RCxzuCnAuXiOc0WEykpX4LIjrFN55ygBM0ytaxDcs0xEr/S8LAI1BajdQVLJXdf9InL+wmLtYqhL4lTwCEK5hLcrT5fIKJSFyUrPKpLyh2rCHkmPvu7YDk4Hdlh53wnUD6/bia9zog/gQ7OTPUa0m4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzF0bkE2ZW1HUU9mcXJtVkJmaU53ZG9vM3MraUMvYUZiOEtaUXYxZ3Q1bjFZ?=
 =?utf-8?B?MFZjdnp4WmJQaEU0NFhIemZSR2FpQ29BSE12bmtyTmdNSzlUcE5VNktnWTVV?=
 =?utf-8?B?ZFM3cjdkakpIbHdEUTlHenNRaHJqR0J0dDBuaVVzS2ZBaHNjbGhqdVMrVUYy?=
 =?utf-8?B?QlpNVytyejRucmh1OGo2NzdBSFFUYXR2MWR2OVYzcHRCN01nUG9OYUtpektM?=
 =?utf-8?B?MHZaMVAzRVhLT1djalNzMTErdnNtNHVHZ0ZZamczaGhETGVxOTlnOUJzMGdM?=
 =?utf-8?B?dHh4c2VSYlJ0dnVzRWZSR3ltZm9BWTZPcThlZ212QnlRUDNSdWwxd3RpUW5N?=
 =?utf-8?B?bDVkeXhIRXBXUmNjME01VUdTdmdETDVmQkZYWEZjeEI1Z3lpQTh2d3piUm4x?=
 =?utf-8?B?ZExDN3VTNHZpWXdId0w2VTUyZ1JHU3BzM1FpbEc3dFVOd0lSOXAyZjd0VXVR?=
 =?utf-8?B?REw3OTNoTmdub1dISWJCUXpoWmh3RDQ5Wlg4a3R2UlFzZGttVEtHQ0grdmx1?=
 =?utf-8?B?TUUyNGRIUS9EZHU3WWVGWmlUMmNyUmJpWWRsMUQ5RjNEd3YwVCsyMFlaUEtW?=
 =?utf-8?B?V3ZVWU5hMW1SZzlacEJteU5lT2ZFcmhhdUVJbzlsMnpQZXVXYmVoNGhENTRk?=
 =?utf-8?B?MG40YVlnZkt6Vmg1eFpQdlVDdWRUcnUrQWZabmovNUh5V1dtRWsxeUR1L1hn?=
 =?utf-8?B?djlpQkFlREFqckVOK3RzaTBjYWV2d01GVk81UnYvTTNtRTI3OVFCeDRMak1j?=
 =?utf-8?B?Y054dU1QWEh5bitJZlBaM1B1eVNBbGNrMnFDYzBVRERxQzNvWVFWQ2JZWm0v?=
 =?utf-8?B?SStheWRyeGRvcEZaQlNQSmFUNzRKdXFMOUFxOFAwREppNkR4K2lUbWN1NlBD?=
 =?utf-8?B?Y1NRQVhMTkJVNXlhSlNxcXVqT0RBMVJydC9DbWtRMERRdVFzdTROanpFL0Nl?=
 =?utf-8?B?MndQZFI5M3NRV09hTUx0MWJFMWhzcnNRVVM4bGNvanZXbVB1UU1qOGoyVUYv?=
 =?utf-8?B?bkhtSHJseEJRcEZJaFVvazl5UVByTWxIcUZBMmw2TjNKTlAwTHBwcExJZ2Nm?=
 =?utf-8?B?ZWRYVThna1VBQnZZeVhpUE1CTkRwb2lrY0JPOG5tYnpqVGVOZUtkRFRLaXZK?=
 =?utf-8?B?TWZwcE9kckNpMXA3TFJiM2NEbTVzV0t1dFB2V0x6MUYySmRzU0VpMnFiYzhQ?=
 =?utf-8?B?OWZOVTdhZjEzRGo5aTZvK01TbHlGdCsrNmNqVEh1M2M3NlUzdENJbTZBL04x?=
 =?utf-8?B?SkVvK2gwczBtemdYT05TckR4UytjZVJHSkd2R0prN0c3VGJpdzN1NVZCOHpG?=
 =?utf-8?B?aXg4ZG0xdEZBRnlxV1dGcHhSc3BNUFN5bEsyVTQ5SnVidHk1VnlQV0Nxd1cz?=
 =?utf-8?B?RjF1cVRTZGhHZkV1UUhUZ2IvM21nTW5VNFNSQ3dmem4yRVZ2emhRS0dlTjFS?=
 =?utf-8?B?dXdKTU4wSGloc2MzcWpISDlVQTlaYmpzRTFycTJVUzJDMHQ4M2EzWEhVZmdM?=
 =?utf-8?B?Wi82dEtacnlqaUF3M2o0bTRWSTZXY1BVZEIxQTdKeW9CUzlqWWNDbVlYaFVP?=
 =?utf-8?B?R3o5SnlvYjNSZ0drNStmb1JWWW5ZbEZUbisxT3dPd0VUajR2bllpa1NzOEEz?=
 =?utf-8?B?VHk5ZDNuVi9zSGEyZXN0anUxaU5NQTYxblJkenR3Zk5ra3R6MEdJUlRjbldE?=
 =?utf-8?B?V2docmhWamNLY2xRNUlwYjJWbVRxSW9ZaGh6UCtsbE9OWThjZmFXSGJGWlJq?=
 =?utf-8?B?dlV3TjJLQklrZjhxUTVQejhaMytRL2RDZUJGR2hIWjZYM0ZNU3J5Q3FCa0J5?=
 =?utf-8?B?alpxeW5KakM3V0VOeVVGYUoxaDF6aFArRlFFTkdCdlBIYzBPOVdFNkpxNTl1?=
 =?utf-8?B?eHlSTmMzU1VOY1NJVTRkKzdOWHoycTgvTUQwaW0xTC9Za05PQjNTZjZGTEli?=
 =?utf-8?B?VUNLWW1rR0Z3V2ZOdG81cDczWUdFbEpFN0l5UTFPQ2JXTDdHT2JmY0t3MWFi?=
 =?utf-8?B?ZTFzdVhSaVZUV1BSbnhhb1orejBWc2RMcHBQSTdrU2VzbXpzSE1sUTFaZS9U?=
 =?utf-8?B?Z05KZEpvZjdvSUorY1pDVkhVMXd4UHRndGJRUys0N3JFN0lqbDVFTlBFaGdP?=
 =?utf-8?Q?pGRECtjOxesjsNvvBby+bQ+dh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d397e1-287e-4436-8192-08dc473b39e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 11:04:48.1434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWo2TcVUS4Nm8Xlen5G9QU2qRjSTuDOfXyrfHVvs/+hhty1jAgc6P9u8mzbA86+4txOLb4mBFWDpHT5TuTEhmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

--------------RaJvTctCbZzWnwtfUaRwf5wf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2024 11:36 AM, Matthew Auld wrote:
> The region can be used an index into the region_to_mem_type, so we
> should be asserting that it is less than the ARRAY_SIZE here.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cbb9b8935c90..51d62323d9ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2033,7 +2033,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>   	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
>   	int err;
>   
> -	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> +	xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
>   
>   	if (!xe_vma_has_no_bo(vma)) {
>   		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
--------------RaJvTctCbZzWnwtfUaRwf5wf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/2024 11:36 AM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240318103616.26240-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The region can be used an index into the region_to_mem_type, so we
should be asserting that it is less than the ARRAY_SIZE here.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240318103616.26240-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cbb9b8935c90..51d62323d9ee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2033,7 +2033,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 	int err;
 
-	xe_assert(vm-&gt;xe, region &lt;= ARRAY_SIZE(region_to_mem_type));
+	xe_assert(vm-&gt;xe, region &lt; ARRAY_SIZE(region_to_mem_type));
 
 	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
</pre>
    </blockquote>
  </body>
</html>

--------------RaJvTctCbZzWnwtfUaRwf5wf--
