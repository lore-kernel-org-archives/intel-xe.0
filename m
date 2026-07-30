Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC001C54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D7610EE49;
	Thu, 30 Jul 2026 08:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPCnmDyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A081510EE45;
 Thu, 30 Jul 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401060; x=1816937060;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OAp7GwYZuFYu8PXisek+IGJwjE95VNZhsJeVZvWnabo=;
 b=DPCnmDySz5IDMQ24vv43b9Jy4Qal/oEq9jrZGFBDnGDlRMrLdtNyBIck
 VQfhueBmi/0VJ3Dyc1ZpX9+ytNUhPyz6P0XdnaF8shI2GG+LXfRn0zmkE
 pklDvgglISnEOsc3FjGlL8W7Lw4iBY43kMZXGjDO3p/nRrDX9fK8AunIz
 hrAkBaJuYGqFYSKhBEL6rY38hIyhzxGYYcstQbvY10Q9E/f6tcBKO1kXZ
 1s1HIxl6KPIY9PfvAomtUbh1vJL9XXpgDAKTHIquCwxAi3LNnMHwAjLek
 FMKd75WxDn/LUaLWKOZaMTiXI13R7fRKa0RGHTFMCexQ5dF24f5LqtCcJ A==;
X-CSE-ConnectionGUID: gSsyGnbVRqipnPDrO4F3xw==
X-CSE-MsgGUID: YZac7xUiT4CeXsRKWR/SFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89695353"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="89695353"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:44:07 -0700
X-CSE-ConnectionGUID: VTDNHZy5TzeTjcQjmcUE3g==
X-CSE-MsgGUID: 1MKU0e6aRvW5hiv797NFFw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:44:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:44:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:44:06 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBIPJbsYmiE+QxvtShW3zALGk6NHS3m1xXgldLmnluXCoW4FRiHK58h2XTIYH7fnUcRbA5Qd1u6M6cwXqq+uNFlmUFK1Ihc1oCiP6K3puM/BSppYhcU/y95hl2SwRq5jCMLGXJ1J8SrxGEpv7zVxqef2/wYCJG5j3/ypoCYzURmLW3LJSx6fQ5hjuKG9rInshohQP4kHTkK7rIxmk9ZPAYg2rBhMBAh2Nntl63r2navq5TTB6JcWuUEKvM7J0xCkWWv5lDuGExzeJWPRzMqcz+lWH/QpIKuzqFwWzbjhcZdmggzTkMPTk0SrEBjuRXCJFcUjjZYZin+8MV2ddsPf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YRa/+4Rzp69OP3FGjM1BPdtmLS4mdNPViVhiPmqDeM=;
 b=DCHM9Z0aQIIgnynrzDIeWKTmpb/ZgFkmuI1i97XQkKOvt6pw4ZrHEQxcjFLa2K6l5nNdPkZH0zuD8FpxJfL8bLFrNjQiXm00ogU6SGW2xbY6QJ6VddDzpwGQqHiU5ajygT/VglIqmPou7dkOoqv8lxIFVVqkHKoQkxWI//FqlxrO7XGYZP6hz/JugCPLRjLsawznjgcQp+WMVJ/39845p9AZojiefFunXolhR7LFl62c8Ra8H9D6G8dHdvVXbwHfknRlU2OaUEXriq8Lxn7+BYzb5//eBmWj/eJYiVmnN0l/MtK0PvWMvNmrBQ8zxpyAaGJ7TrFXwbXHF2YIpbUopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 30 Jul 2026 08:43:58 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:43:58 +0000
Message-ID: <61bb4137-134b-4595-8095-0e7623e68cdd@intel.com>
Date: Thu, 30 Jul 2026 14:13:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] drm/i915/vrr: Return from PSR2 compute config in
 case of CMRR enabled
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260728145943.3848704-2-mitulkumar.ajitkumar.golani@intel.com>
 <20260728152324.3851790-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728152324.3851790-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0153.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffc3092-edb9-44df-8883-08deee16b21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: mOXlG0eBdJ6pnz8ChwMpGIxKmhj7pXkJzbwdSkysUvVlq+n6FuyZ4d1VWscisZ3bnCDxOAhZKJWmW0hIMw2XoMRDgUHywkNUKQzw7X/QG0nA1yl6DZFPCXndj63GMzqvpx+uSemhymvXDi2JhO0ktJl7tDKBhDLat1wqbiI3vDr4xj0qyBJv9vl0zPS4XG2W0E7o0eoRMdSpzZMOnQRGPqjESQuGWZlmw8bGRHKz+TG+Vs/4BjVkbR/WsGxPY0xJHNfzX289BQED4NWy8svxMSO8/q30ZVJ4Q+s4gjyerhFo+6EdX/MIo8X13ZO23UrfFffXrypruJeXf7ZVMvZbEY7/5fEX2xGb1lBEj+aP775MzeOnPbT7kg22rLbZCY6u8HiuN9qr0aGRh0wVl70eFqu3u3Us4hVwwBrwW1gwz215jez5DG4dEPM7Me01kvYpb5P/c2h2MdU/8rWMH/sDlHuOrmHD73tkQZbm3FqIJzXh5UT+aLjTFBgSNFxOeRDuPcPI8Rm5VxVajPK/+hWUUNlvNfWeChUWLeTpv+WDDwtvf+MpZ4NywveBVomYKFWsXJt/FM0D99mutvmu8H2psdylFUovTbYiHytkI1FO5KMNdd04oc6WlIeYRPgy03wwZxVT1jHe3h/Ye4lMydLhtr6kTKsykBkkiyCF98hVG5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZIS0RCNGcvd0duSUM5MmtzMjlRTXRzNzBjSjBLQVN5bE1qWW5heHpWcTdo?=
 =?utf-8?B?OE5zWE05SGNSZ3lqalU4b3loVGlaWnBkTVZIbk9KMVlsOU1mZmpiUFZXNlNy?=
 =?utf-8?B?WkFEd0RqMHY4S25lN25mQnlYc0M0R1A0RUh1aEsweFRyclRDZlZROGFnY3Rh?=
 =?utf-8?B?dFU3N1hYNDZTbkNyb0MrWkNvNkljclFqcjQ0NWtSWnMzT25qa3JZVW43dURl?=
 =?utf-8?B?U0NEcUVtNDFHR3ZJYmczM3JuR1ZTWVE4YkM0aTVLZVJ4QTh5eGVpTFdjQ0VE?=
 =?utf-8?B?YlBWUk01TCtPb0EvbWIwZlpIUEFTbi9OWXFnVjV5MFVTRW5BYTZwdllWajhW?=
 =?utf-8?B?enpoaDBsa3FEb2ZkR2IvZW9yUGxVZkp6OVR3ZmpPbndnWng1RmR4aHpuL3dE?=
 =?utf-8?B?ZFQrd05QcEZuYVJrQkU4b0Fzb3ZtRlRZWjVuT20vSWY5RkZiem1RakNQckMr?=
 =?utf-8?B?RFRFVFJ5dnVQdHdtRWxDZVgzMXFxTEdKcUVLNTA3VTR5dFViK0ZWdmROMnBo?=
 =?utf-8?B?SWNvbVZEREVtYUcrZ0Jrdk1sYnVySSttdVVpTW1Ybkg1blBZTEU2UTF3L1No?=
 =?utf-8?B?NVhidkF6QWVWOXV2MkY5bWZtYjFnSkpBMWJNc1pKZGZ1dDFYaHk0Zlg2cGYx?=
 =?utf-8?B?VW9WMXF6blU1WkRlbzlTSlRKSWpZT1dWamhGWnVZSTZFUnU0M0ZEYXB4aGhv?=
 =?utf-8?B?cDRGZUk1ZHhDTDhBOEZjYWM5b0lSQW5NbVQ5OEZPSVVsV0RET0FCdXVpOGxI?=
 =?utf-8?B?QzR2VTdpWUNweEdTUzlXWEZkM2pZYjZkdWtpVCtMc0dndmlQTzJGL0hpWXpq?=
 =?utf-8?B?YURhV0FTbGNaMzdjb04zMGNTK2lTbUhOdVdodHE5ZWY1WVZKb2tTL2xiOWcz?=
 =?utf-8?B?Slp0blhVVjhHbSsxbXlTRGNVSUVMM2dRZURvZ1ZzSXgzaG81M0JLWnNkM0pn?=
 =?utf-8?B?RVFXS0E1TmsrYVg2UDg4Ry9ENUhVbGJUcC8rVThzOGRsS0xGQzNvRkppbDVN?=
 =?utf-8?B?eUdXNkJQUjVqTFlhZURHLzN5RXg2TU10NGhTdjRwZmZuejNRd2J6eC8xcjBD?=
 =?utf-8?B?VVhRckpmbkpXSTZhcktqSkl6Mkc0U2dXQ21sN0tpT2ZNcE5IQ3NLaXJDR3Zz?=
 =?utf-8?B?ZEJqV1UvQ1lmMHBZbGFWalI1YmZmaStXMlFzbDljL09rRGN5UHdOTk9kd1Q2?=
 =?utf-8?B?RElsNWR6LzJkSnlxMElKYllESkp0UkdWS2FXNmxDMlFQczFtdnBBS0g4WnI0?=
 =?utf-8?B?Y2tOOFl1YnRtTmJpYWUvK2VSZ29lYTR2MG5xR3lmY05NRUtwRGZLaWhtYldC?=
 =?utf-8?B?RjZQOFB2SlRUUDkzek1Bdi9CcFU2dlJHVzhEbEVPTmdJR216OEp2dzR2U3VG?=
 =?utf-8?B?QUpndU1KUGJOaGg3UnlMbjJDVEJIZ3RVVEcxOHdoWXpHSFF4RVNtL3FvWWVs?=
 =?utf-8?B?NUpzRFNHM1NZVEk5NHorcjVwWGZtM05YeEtYZThWM1cwbVpqRGJ1ejFEOUlu?=
 =?utf-8?B?TkZ0MHVPczR2Zi9JVThIWGJWdjZSOUZmWUxMY0Z3NU1rdnpBbW1iVlRmQVZQ?=
 =?utf-8?B?ZU9hZjQvbXVua2g2QVZUb2tPVlduUWdRVjZITjVEN25oQWJxTDlYeS9VUDd4?=
 =?utf-8?B?bFRMYWxlTGtLN2VjNGlQZlovRlNzUmZaQXZoSnFwb2NTYXU3cXJ5ZWRZRHZw?=
 =?utf-8?B?UnJmc1FhcW94cDdFYmdhVS9WMU1CRWlQTk91TDA4ZWFGWGJkaGJLbzdvYkM1?=
 =?utf-8?B?SnFaK2xaMWxkUmxZcUhVamlVbnR0VkVQcnRaNm1jRk90WXN1VU4yUVFRVzll?=
 =?utf-8?B?dTBqSnRRWTQyKy82cTdxWE0wdkZKZC95b0pmZlBjWmVWNnZBMU1rMGtkQjZD?=
 =?utf-8?B?b0tyNklNTHFITExzanVHbFR4M3pOYk0xeThxZlI2cGhvOER2S2EyNitLMlRu?=
 =?utf-8?B?dVZyT2ZlWnlqSSt3Skt2VURjWVRrd250MlM0aVBEZU1hQjA5NGN1MFplSEZn?=
 =?utf-8?B?MGJ5ZW5BV0RiVEFRUjBDaTJZcFBDdkxQemRYYmg2cHFldy8rSHJXcHlDOXRq?=
 =?utf-8?B?cmpyb3dUTURMQklOeloxTkM5TEtSa0xxQVgxSENCTlNmTDlHWko4eUhjRUdO?=
 =?utf-8?B?RG4xVUdFbmlWM3BEZmtYZ2x2RVoyUllwUDl5NFUvWDNNbnRwOEQ3WXQrekgv?=
 =?utf-8?B?Tnc2L3RkVWorSk5jNDVlWEt1WEZiU3NUaFZsYTBwelI1aEY2bGU3Sjk4M0U2?=
 =?utf-8?B?YldFMzFzVTNlbjJZY1I4eW1JNEFMVlR6RGs0SjBwa3p0T2JoUklaZDVpZlM2?=
 =?utf-8?B?WFgyVWxTZERVQmxzM0tlMHlPTHFOZTRhMVZabGlCOStBUmhweGU0Q0hkbHI4?=
 =?utf-8?Q?Go9O/tHVIiWQ6HJw38yOaOy9UOBxOqLKqX+pC?=
X-Exchange-RoutingPolicyChecked: cQ7Z21CPVY10mQOlBMND1H3J9Sv5Yosjo+8nGbR5GfEhAe879uDvUxSmyKAPr03vaEXOi1xIQ0gkw49kh32xfpCjYdpeGvF+xc6ncoCfr9uUVfCm1+du6f5bE/8gNF7/sp5ZhsMtFxafGV1/4lFALldOMPM81R8c9CVKPS9janUmnS1lptAJJrjrlss5dwbCmr5Zy6KOvT9ig3WCamo5A7JXiSbFC2V/1KYXICSkN8aWNszh42iDRVhXLqmdad2jzlxZxvyWdBLbJYlpKEl5hyeOirsjm/8eL1OL6JwufAH1W3mh4nbLyI7g3HakroNGat9AXuLzo2hg0aS9cZREtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffc3092-edb9-44df-8883-08deee16b21b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:43:58.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrraibQ/vg3Qeux9A9oGp485y4GgE5v75+SucuxJgis+Yx5MFNG8o0EbP7fUN6CLLWcOpegAwLHiDa/Xi07Zc4lafYRYjYHGI4HssaqMMIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
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

On 7/28/2026 8:53 PM, Mitul Golani wrote:
> CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
> enabled.
> 

nit: drm/i915/psr: Do not enable PSR2 when CMRR is ON

With that,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> --v2:
> - Restrict selective update config check (Ankit)
> - Commit message change
> 
> --v3:
> - Commit changes
> 
> --v4:
> - Add check to psr2_config_valid (Jouni)
> 
> --v5:
> - Correct debug message
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 40e3d7095996..410778e73a2d 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1491,6 +1491,12 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
>   	int crtc_vdisplay = crtc_state->hw.adjusted_mode.crtc_vdisplay;
>   	int psr_max_h = 0, psr_max_v = 0, max_bpp = 0;
>   
> +	if (crtc_state->cmrr.enable) {
> +		drm_dbg_kms(display->drm,
> +			    "PSR2 cannot be enabled when CMRR is enabled\n");
> +		return false;
> +	}
> +
>   	if (!connector->dp.psr_caps.su_support || display->params.enable_psr == 1)
>   		return false;
>   

