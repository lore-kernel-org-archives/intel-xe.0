Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AD8CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 13:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285110E9B1;
	Thu, 28 Aug 2025 13:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eP1IFQo5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BA010E9B1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756388036; x=1787924036;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mAkKEjrgogOWSViPrRrhq2rHl8KRn3M2ypghkbvrmuQ=;
 b=eP1IFQo5O2BEwoAZYwIh9cvoCiX3HknC3tI8KFl/x/Hwy2G5PTPUW/+e
 /QC0SkWOmN5ZwiDS1TKL9neszaSN/+GiJwWKJWtZCveo/yv/2PAp/SrME
 1cQpDtcHTNrKEumaEZGxnumKJcTS3gLWtbzLp/8xJhdeL5aeB7NQKbAFh
 XgHKHw9w4UJ4T6prnEdz1uSHCc8BY7uBUt/Aj1e3x/RUg2yi9qau0tGL2
 3oxzipCqCxSoKA9JKJ564YdIyAY9YZO0sDwjZ3mGR7ymKNc04vjvDqTuT
 z5x+zxZXfOi88FH6IH1ItEEYW8xV91gzawKbFzCoBzxmvV8BLy9+Zs3UE g==;
X-CSE-ConnectionGUID: oV6Rlw5QQp6Iyj5Stt1tEA==
X-CSE-MsgGUID: VSFInvNdQ7OIpgnUDuUU0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69249109"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69249109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:33:55 -0700
X-CSE-ConnectionGUID: QGf/CxsUQxCm1qcWuK3Ckg==
X-CSE-MsgGUID: ZC4Ho5aHSPmeC3I+E3dnlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170012771"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:33:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 06:33:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 06:33:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.78)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 06:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqPePWAKuGJolduxTnUhWj2csB1LZ+99P5HHA7Kr+EjmM4uR4Hrm97kiRZNJdP5XoI5PWxtuvmyFxAijrCiCXFbjCoChrNZURpNoOjmEG5j5vjRyzFFfDp+KvnVYPscdEdXZe2djSyhOuPnyZjnDD4pWP1u4lkK0L9dFFiczIyzc3qyw0LGoCxn9CflE9i4JHE617M9la+KNrMQqLrBZkcvyv7VN2LVYkFs/Pn0tF/glNp0mLzLZT+/0pHXNzg9Mzd0QNL/zRhkVXgdERGb84/vouGHUSGLu87+xvLbpRUqGXOg173Xrz9SupaBHRlwuQqARC2tRzoXig7nKAqtIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCHd7DcuD/6+aVRaOUtviTqgJSf0zMtswzORy/J5WGk=;
 b=olP09NPcrGvRVGeyCeyzAbRopmnqK7T6yFEnZZ2uDugy0gi0t6AFE/z5lt9SDu5JrWI7SVBL8b8kJseyb5VYgWo8kcoV3Gn/pTPzyu5oqqbZwoA6Ax9bNGimaTpNwVZF5D403RLv6oYXYuzOgFdLZbNRjC13dnSxVnH6curV/J+KxIAM4wzCmF4PKNKh94Qmf0Tae+geJvcfhqoduIWPF6Hi0vBrPde4VzucIq59gLG+G94V43NKrRf1GRwYyQK1EgaDg4Nvi1mbJ1g7At5fh+O4K9hu8OxNwHXaaaeAxqp2sSlNjj0ha0R1pdkFaHI2qVBs3+W7Pv0RkD5BIEbRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB7053.namprd11.prod.outlook.com
 (2603:10b6:303:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 13:33:48 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 13:33:48 +0000
Message-ID: <99103059-6404-43f7-98f3-093cf061e385@intel.com>
Date: Thu, 28 Aug 2025 19:03:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20250828071516.3838110-1-himal.prasad.ghimiray@intel.com>
 <wz7wfyrampt4hnjepkotckcriqs7kyrifbmygchlj3lycalwne@y32bbddn5cdl>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <wz7wfyrampt4hnjepkotckcriqs7kyrifbmygchlj3lycalwne@y32bbddn5cdl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6723faed-2904-414a-f71a-08dde637848d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDZOMW92WVJsdzJOMGx5MkRsZEZ4eEVUZ21SUUxzQWxWQnVLeUo2YllQdjV5?=
 =?utf-8?B?cWtqbC9aSm1DQWl1Q2RiQmR1dnhocFlWSk9LNjR5Mis2UXR3MmI1ZDZWdHVM?=
 =?utf-8?B?Z2NWZXZKNStkQVJsTXN4S3lnMG5leExMN1pIWTRwUU8ySnRSMEhzQWZVdVFM?=
 =?utf-8?B?UjF6U3VBWWR4aTByRGtrZXRISmRua3d0R3VqQVBFN21iYVcvaDlObHRhUmxD?=
 =?utf-8?B?YVFMeklPUHZERjdhMXBQbXdoSWdlc1BaVEJNaDJWOTBTRFB5ZEQ3Mm9pZGpz?=
 =?utf-8?B?NDN1TWVkdWF6VGlReStRV05hckxjcFdjWHJTeVllbFV6UG5pOUZjdHU1anBR?=
 =?utf-8?B?SGsvdCtOZkM4bzRNM3NjcG5Fd0NsOGFJQ08yWWhTSGZxTkNJUU5PUFhQUmV4?=
 =?utf-8?B?bWVDMWdWOWp5di9UbDVtaWFZdFFvMHF2QUozZU9zbVFEeDdFNElVbFVzWFky?=
 =?utf-8?B?ak96Zm9HbmppRHdxOXlDQzRSbnpyRTlZNDE4TzZtbGFXUE5tZGRIdXBEbkFC?=
 =?utf-8?B?UmZEWWFFS1M0R2x2QzJ4eXBEVDVMU0dMWFV1MktkcDFZTzUxdVRvL2dwR0l4?=
 =?utf-8?B?ZlpCd2dsbm1FUUs4aUx2Y1k2ZjZTOEZONWZFbC82UGlMYWVHb25OZU5seVVN?=
 =?utf-8?B?Z0FwT2lNSE0wVGhSMnFDRlNSN3FnMXdiUDJmbzNoRDE5TUR5RklJRXJ1L0tz?=
 =?utf-8?B?c0JEUHBOVzFsZisvQ0ZsdHQxWllOOGhieFRhSlB0VTlCdGRXSnBMQXlBQmdH?=
 =?utf-8?B?VzcyeWxrcFU5MVl3RDZNYnR4V05tc1ZHT1RkMnhIWEZ3VHphTkhHSnVlUDI4?=
 =?utf-8?B?TENINlBNbFFLN21zMDlpNUJsNEFWak1BSHVaQzdiRTVKa081WDNFVy9YUlF1?=
 =?utf-8?B?Q3JhemNlc204TzJoZWRnMi9aNkhvYUdoQzQzMFJ5YU9BU2ppcFNPQStKd0dO?=
 =?utf-8?B?ODZDaEMxcmVSR29VUGFxWmtRQ0xqazVOL0FvL08vOUZsUDFLZWxMMEFybXBr?=
 =?utf-8?B?ZEhlMm9LYitxOHZ1SUpnNHNBSWdzVnZqK0MrZnk4dkVqaWkvb05xbStYRXBW?=
 =?utf-8?B?MmFtU2Vsc2pCMmpvVXhUUVl1MjNJQzR1OUZTMGZrc3RaSnpLemRpa0xiNTBm?=
 =?utf-8?B?OUhLU1o3UXM2Sm44bkRFbmV1d0o1d2ZoREh2KytEajI5UXFBZ2Y4U2hJdmlI?=
 =?utf-8?B?ajh4NkhTUWJQZm9kenRtRlBNMEpZRGc4UE8ycDl4ZVF3QkRCQ3F3Q1FyWjJq?=
 =?utf-8?B?NGo5QzE3Z2Y5dTErWXNUT0pWM2xpVUVQRldRYkcrUWFkdzVsLytZaTlWWUQ3?=
 =?utf-8?B?QjREVmxKZTBIZ3o4V0xUZXVDanA1M1BUa096WWNKbHA5MXVyRmc2V0NOUGl2?=
 =?utf-8?B?cEpaSkFFK3ltSnJ1MVBJdDVjaWFXOTBaaGxLQzRVYlNNMFVKV01iVXFPRFlL?=
 =?utf-8?B?eUdKVEZTdDZmTHNxWnMwQ2l1em5aL1VzV0MvZExneGpFQ1ZidThBOGpsUERt?=
 =?utf-8?B?Kzc3dmoxY1ErRlJoQmxUQ1FPc1pIbjgxNGhCQ1FmeHNFOVdmVjBjZUE5RnRY?=
 =?utf-8?B?dTRFV0VhSFM4aDU5VldKeUNmYUx1aDNQb0h5YmNrNlJUZThZVUgwczhLaThI?=
 =?utf-8?B?b2ozKzcySjVMSUMrdFJCQWVzK0dOKzEyTWV1aXMvRTlpYjJqZ3JmSHhWOEs1?=
 =?utf-8?B?QUFVdjBnWUFzUG93bW9Iay91VUlZeU9tQ05pY3RZUm9yd2VybWhzVkdhcE4r?=
 =?utf-8?B?TzhoL3Z1ZzNDTk1nTlFTNlVVVFVGcUdQZFVISm1WcXpvU3BuME1NQnhwbURx?=
 =?utf-8?B?U1phV2wzcmNKbDdaUGRJckdQcDMzVVlHL0oyV3dzeTVtTWVsRXB1WWpwd3o1?=
 =?utf-8?B?SWtvOTJMWld6UXhkVkZLZTBGTWFrTGppOWJ6R21vTno1OW9KS0hUZS9RR1lE?=
 =?utf-8?Q?TdC4dim1VOo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFiL1prek00UFl1QUMwNDNNN0RJaWsrYjA2MkFPeGdXaU54cytnK1dFTkpv?=
 =?utf-8?B?WTRVK0JXdUl5KzZaS1hrNHF2RGRlaTcxd0dsc1JBcFBKMWlVOXExaGZFSmRk?=
 =?utf-8?B?bUYzL0ZqYWRxVDNxVFdxdWVXOFhybUxWbzBWYUVXeUlEWmhTcGdMRjZ1YnBT?=
 =?utf-8?B?K0ZzeVZxUTRnTThVdndISGxjMzF6cUV6Kzh5amJiY0hHWlAwRFZMRVFFSldP?=
 =?utf-8?B?TVFkSlNkZ2JPSFpHeEF2R1dIU1ZWNjNpYndneFQyazJZTDRVcU9Eang3UjNO?=
 =?utf-8?B?ZXZhcFk1c0FpdjFQaFRkYnpINlhLa2EyeXFwdWt2eUpxdDJVUmRzcG1CRDRY?=
 =?utf-8?B?djlJUlVxTktlNVo1Mm95dmF4anFMNGdBWUFtRTZpM25IMzRjWks0bEYzOFcy?=
 =?utf-8?B?NTZvME5Jd1oxWlRwWGgweFJVMVArWS81L0Z4MXJSSlBCMmkxRzF4L3NHYmpt?=
 =?utf-8?B?SjJkWExZb2Z6cVYwNkYxb01SOUJqNE1nN2xJWGFUOUZEbWVKNndHN3AxUmg4?=
 =?utf-8?B?VTVDUHNYTlg2anVVRkJPai9sdFV5dHBDUnVTV3YyaHhLNUxmYkxCVUNVZlQ0?=
 =?utf-8?B?NTFoblZkOW9DQXkzVGcrZlZ2WVRZYnIyOHBIa28xNWZQM0REYWIxSm90S2tl?=
 =?utf-8?B?REhmRitwVWZvaUdQbzgydytGcGRMd1g4WWFjK0dmcGlIQm5WT3BRU0RoWW1x?=
 =?utf-8?B?b0VZUVhrQTVPc2ErdzlmY29DbFQ4VFovM25uVjJoZ1BXbVI4cE1CT1ZZODlE?=
 =?utf-8?B?NXdPNURLTCs1TktweUIwTk5OeWdYTEdLVWpQTEZxN3NNVTA5ZTZvTHNYaFVx?=
 =?utf-8?B?RndtbVVqczFOT0RrVWZxWXlJWmdVWXlWbjNOY0JZTGVaQk1QYTdCeW1saWsr?=
 =?utf-8?B?M053aXR5U3lpR2hMMU02VnI3dHhyVWdMdnNRMVhGQnllaVR0WmNWSUdMUmM3?=
 =?utf-8?B?U2RpZkN6VnJIQmRNMzdQZkFVakNyMDZ0VmRZS09RVjhjWXJCMXZWZGgvNmJk?=
 =?utf-8?B?c1U1Tk1HeHVzYUxCN1hwVE4vS0puNEV2Tk5kQjBKSE81MHB6UlcrMmtTZWxl?=
 =?utf-8?B?OHExNkVOeVlHeU9tcHlSQ2lLdnZ5d2VyYWlkQ0M3bkhKb2JPdW94NXh2NnNZ?=
 =?utf-8?B?eGFKaHdGWkFkL1VwMUF4azV1ZlowR2dIeVA3NVpWZlZUTVNYZmVPMnI0cGRh?=
 =?utf-8?B?bDh2c3Y0NHpvcnU0TFo4Zlg1cVh6ZXlIQldtS2FTMVBxem54WUk2Q3A5SytU?=
 =?utf-8?B?cXNEa1JoZ0VONGxpSENtRDRwb0dxL3VqNnY4ZWIralJVeVZ6NEpEOG9zV3h4?=
 =?utf-8?B?VitWSDJnVGhyR1gvdFE2OHdMLzBjWVczMnhCZ0JmZ2xmZzcvQkpjb1pMemxZ?=
 =?utf-8?B?amNWbjRWQ2dIREtuTWRkQTRzZjlLUCt0cWFSUXk5emQralloU0FLVGk0Y3hT?=
 =?utf-8?B?cW1XbUFqelBvOW9rSk9pSURzYlppcWZpVncvWUREOVlXSDBJRWQvSzlzd2p0?=
 =?utf-8?B?N2FCY1R5MGNJOFdRam5Gcjc0VDRyQVozU2VRL2hLdnFGUDFSM3ViMmN6K3lS?=
 =?utf-8?B?Zmt3QXA5TW1ya2ZZcitYQXlQcitoOWJld2NEVUkraGlBbDdTZzRTSzR6TjA1?=
 =?utf-8?B?L2Fpcld3eHBTUWFkUU1LTFJCVGJ6d3cvcmRhNi9aeFlwcWk0bC9MWWZDejV2?=
 =?utf-8?B?dXRxemQ0SUxtQU1OT3RDekdLSVVmSFlSeXNYSTgzMVZEVnh2dS84QkN1eW1p?=
 =?utf-8?B?TDFraUd5dkc5Q0oweEl5d0toQWVZbGxJMmxqQkNGd2tYa1VvRkFaczBiKzNV?=
 =?utf-8?B?RktrNGxvTzUvNHRHeWc4ZDJSamFzWFNZZXFYYVlsT2JTVlpCOU8rc0dHeHp0?=
 =?utf-8?B?a1dRQjBVUGJIeTFxVWFMbHJzb0N6RGNxcHk4TEQ4ZldLMzdNWTROSWRYQzJX?=
 =?utf-8?B?Vmo0ZjYvTXRITUlMajhudDQwenRibFNnMnRmZUl3ai9GSVdXSkQ4SEtVdjFC?=
 =?utf-8?B?UFlMWU0rSWJDdllON3lFakUrUk9pNU9tTUtSS2VzcFJOWlRPTnBrc0VZVE11?=
 =?utf-8?B?ajM4TDl3bUJNSXRwM3BxVERmZU4zaTN3MUthL0VuWkpKR0VuYUJSSE5BMnJ5?=
 =?utf-8?B?TFNyVWk1dEt6SiswYUlIUHA2UmpQOUowWXhoVXBLQmdrK2pmczFTQy8yS1li?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6723faed-2904-414a-f71a-08dde637848d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:33:48.2228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uSss3b+EdNwi3GjSlC5IEH9CTxJ6yz9vOp3Mw4aQqqxvzsbkfCLofon/Syz3zLh82qC8z8UaYbvVvMQn1KOXAr56SH7v0W4O3qeSASfBWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
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



On 28-08-2025 19:01, Lucas De Marchi wrote:
> On Thu, Aug 28, 2025 at 12:45:16PM +0530, Himal Prasad Ghimiray wrote:
>> Correct kernel-doc formatting issues in the UAPI definitions for
>> madvise and VMA query interfaces to resolve docutils warnings during
>> documentation build.
>>
>> -v2
>> fix formatting (Matt/Lucas)
>>
>> Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and 
>> memory attributes")
>> Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> include/uapi/drm/xe_drm.h | 45 ++++++++++++++++++++++-----------------
>> 1 file changed, 25 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 7dedd45ab995..8386980041f1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1997,21 +1997,21 @@ struct drm_xe_query_eu_stall {
>>  * union member is used to provide additional parameters for @type.
>>  *
>>  * Supported attribute types:
>> - * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
>> - * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
>> - * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
>> + *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory 
>> location.
>> + *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
>> + *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
>>  *
>>  * Example:
>>  *
>>  * .. code-block:: C
>>  *
>> - * struct drm_xe_madvise madvise = {
>> - *          .vm_id = vm_id,
>> - *          .start = 0x100000,
>> - *          .range = 0x2000,
>> - *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>> - *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
>> - *         };
>> + *    struct drm_xe_madvise madvise = {
>> + *         .vm_id = vm_id,
>> + *         .start = 0x100000,
>> + *         .range = 0x2000,
>> + *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>> + *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
>> + *     };
> 
>      ^ wrong align
>>  *
>>  * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> 
> missing indent
> 
>>  *
>> @@ -2042,12 +2042,12 @@ struct drm_xe_madvise {
>>          * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
>>          *
>>          * Supported values for @preferred_mem_loc.devmem_fd:
>> -         * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of 
>> faulting tile as preferred loc
>> -         * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as 
>> preferred loc
>> +         *  - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of fault 
>> tile as preferred loc
>> +         *  - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as 
>> preferred loc
>>          *
>>          * Supported values for @preferred_mem_loc.migration_policy:
>> -         * - DRM_XE_MIGRATE_ALL_PAGES
>> -         * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
>> +         *  - DRM_XE_MIGRATE_ALL_PAGES
>> +         *  - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
>>          */
>>         struct {
>> #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE    0
>> @@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
>>          * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
>>          *
>>          * Supported values for @atomic.val:
>> -         * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
>> -         *   Support both GPU and CPU atomic operations for system 
>> allocator
>> -         *   Support GPU atomic operations for normal(bo) allocator
>> -         * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
>> -         * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic 
>> operations
>> -         * - DRM_XE_ATOMIC_CPU: Support CPU atomic
>> +         *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
>> +         *    Support both GPU and CPU atomic operations for system 
>> allocator.
>> +         *    Support GPU atomic operations for normal(bo) allocator.
>> +         *
> 
> in all other lists we don't add newlines.
> 
> I added this on top an checked the output is sane:
> 
>      diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>      index 8386980041f16..40ff19f52a8d5 100644
>      --- a/include/uapi/drm/xe_drm.h
>      +++ b/include/uapi/drm/xe_drm.h
>      @@ -2011,9 +2011,9 @@ struct drm_xe_query_eu_stall {
>        *         .range = 0x2000,
>        *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>        *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
>      - *     };
>      + *    };
>        *
>      - * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>      + *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>        *
>        */
>       struct drm_xe_madvise {
>      @@ -2076,13 +2076,9 @@ struct drm_xe_madvise {
>               *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
>               *    Support both GPU and CPU atomic operations for system 
> allocator.
>               *    Support GPU atomic operations for normal(bo) allocator.
>      -         *
>               *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
>      -         *
>               *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic 
> operations.
>      -         *
>               *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU 
> atomics supported.
>      -         *
>               */
>              struct {
>       #define DRM_XE_ATOMIC_UNDEFINED    0
> 
> with that,
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> I will squash this and push soon.
> 
> thanks
> Lucas De Marchi

Thanks for the help.

> 
>> +         *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
>> +         *
>> +         *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic 
>> operations.
>> +         *
>> +         *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU 
>> atomics supported.
>> +         *
>>          */
>>         struct {
>> #define DRM_XE_ATOMIC_UNDEFINED    0
>> @@ -2196,6 +2200,7 @@ struct drm_xe_mem_range_attr {
>>  * Example:
>>  *
>>  * .. code-block:: C
>> + *
>>  *    struct drm_xe_vm_query_mem_range_attr query = {
>>  *         .vm_id = vm_id,
>>  *         .start = 0x100000,
>> -- 
>> 2.34.1
>>

