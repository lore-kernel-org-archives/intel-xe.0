Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABCEC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 17:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A58C10E062;
	Tue, 14 May 2024 17:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUE5D/Za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB3A10E062
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715707488; x=1747243488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kbKYlGBnant9PIDanZgbXQsSPQcITOMnldQeUVo6CSM=;
 b=QUE5D/ZaP+HWmIUGd+VXKJghVIpe0+gg6YZ7FRCIM3fOJ1b/jE6AnQyA
 t6emN+GuDnsxus9eYjtoyWEhKjkXghmKsYCvvbzdWlVxePfx7UuSTAjqt
 WCKYehFvoTmrJuI+dDSTq3Oc8DxcVMed59oW+Mrx0IVFlmgmZrczGzWme
 UoZpd04WCH0zxoJfPXzRh2BkmOoET4wMxblvXpfT3+b/FoIwTdsdjYc8L
 FdpgBDi/n3aQ1z60/mx7Nhn4wD7p1PYS8qYniKGAj2qwGVemJElZuVKfv
 PrmDZgCzfCEOUI0OVQaaHY4MWq+zG80/GqNrTLIykPmin4bEwjKMkJsz/ w==;
X-CSE-ConnectionGUID: cv8WQ8mlTlaaXCBZPYq5AA==
X-CSE-MsgGUID: XxV3jNNVRry+lVbc2fNFjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23110329"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="23110329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 10:24:48 -0700
X-CSE-ConnectionGUID: BUXKgzaNSYug3pbo1nqyGA==
X-CSE-MsgGUID: ve4dxWRbTWGGS+cpJJaPkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30880096"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 10:24:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 10:24:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 10:24:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 10:24:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 10:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDKK/7d2SIUUmCdxFpt3Aad9oH15Habmy9cYhMQX/W7QmOverXUKMt8kcN4VtPtw1+sEbWbftpPHVJQNxSTD4ccXjbrwMcWNtdGvgrbjMfjKuT2HI5AGVSX7saAEMi3o9CwUrgDVAqXNcDoipvF28sDVewzEy7hCcfV5g5QwksgEVJipMOZGco9DBO1ZZzwyhLswwlGcagNUY/thfv5JOqks3/mjK4z6XcFbYwZfxvLM9dkS9zKkAijVpnAovbtQIdIzITJI7io+VjweQhiaKHBNvdecrGoKy7e0BDchEiHzWd607eVKFvjlQk9lkOM0GyN/jy3d7v2hdq6txGdkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2Xnt22Xyrj+B9RywQ3l+6zRCyOoEZv04+fJrmf5PO8=;
 b=AvXYsGHeCzHH1ffA427+TvGYA4LroBPNPV89B+UO4tpjg8onBFDkLtBNDsvWPJNWQqrirgzOZ/3mU7gWkFXJxMPZYe3TFbaNw4XXAyFxP1K60XilXp344VOyDJgt+caFveK/xzLHa/uAji4IC8PDKtAOePcbl8LYSsO1f8r2nY2USfH/foKu+6sLBbBNCwAxp2DNfk2GlnnJv0QqxyHe9xfKJY4gZJB3O3Pd8pn1ammyFMpzfqbJv78UxlQNFAcqgY2m/QxIeWUFWzP0ABmNJyRAP8mwOHYOF5s7g7/ujf5ytN4G8hLt9qXN/+e2zeDmBTiCVNF9DnyPvbC2kfl5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 17:24:43 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 17:24:43 +0000
Message-ID: <a7d033d5-5307-44e9-b4a0-1dbafe6e1300@intel.com>
Date: Tue, 14 May 2024 10:24:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com> <Zia_KMGV8RSqUL_Y@intel.com>
 <jrplqu255fn4u5xdc7e3xzddpfheoqmllgpcny4wfmfuk5wdr5@tgl4mre7eqq4>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <jrplqu255fn4u5xdc7e3xzddpfheoqmllgpcny4wfmfuk5wdr5@tgl4mre7eqq4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f34feaa-4f79-416c-7392-08dc743abe51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1ZTamlyUnpNK0htbEtjWXlqZCtFZjdWdmFST1lnbEQ0RURnRUpHNlBKUDd6?=
 =?utf-8?B?elRleEZVeVZXWE5mZUJjQ3lRZjNnTmx1aURsMlVCcXF3QnhMekJXK2NrNytl?=
 =?utf-8?B?Ymc2czlBR3IrYm5MYVpXRkRlL2psS20wckk4cEthbjcyMnlONkg0eDU2RlQ5?=
 =?utf-8?B?b1pwcTBYYTlVU01DRVlKTWdtdDBlZ0orYm9xV3V5V0pWMFI3b1d2Y3VoUGRk?=
 =?utf-8?B?T1AwdUcyRlVFMS9hYkY2VDNnSG9mbHhaMWtZNmF6azY0bmZCZlQ1QVlYcTd1?=
 =?utf-8?B?ZmhYMW1JSE4vSitLa05TSDgwWGF0RzFrWUdwYnltSElyaUh3dUxDYktHTnQw?=
 =?utf-8?B?ZThhZEJXMnhNelhXYUlhWWhiZEdKcTZjL1Y3SzJIaysyaFNEY3JaMXJUeUNX?=
 =?utf-8?B?T1hkWm92NXE5VWhzWm9KUzUzTFRvUVI5bkR2REw2ZWlnN29YVFFaMXptbGRQ?=
 =?utf-8?B?eWljRmlnbjYrZDNIdUdIM0dPSGtHSDJJdGJjSXZYWjVmL1hyYjQ4QlpXUnMv?=
 =?utf-8?B?RitOcDdIRWMxUHJVUWovcHBnYThLSmZDSzFjLzZtQVRlaXJIL01GUkgzc3ZR?=
 =?utf-8?B?VE9ackFSWkk2ckRySDQvMlBEa0t3TzZaOVFKakRiaEJtYlhRdDBNcmFUVHpm?=
 =?utf-8?B?K1NwSGREc2RjUHFIM0M0RzU3UC9OcnJMOXRzQTNZNjlOR2pFclkyNFQvbHh4?=
 =?utf-8?B?VVVxcTFpTzVlWVFaVnlsc0U0a3ovWUlmK2ZDQkJpRXhJWXhhcWtvcUJLNERT?=
 =?utf-8?B?b0YwaDBqK1dBNnFaZ2s3ZmZuajBVVWUwTUxyZGk1d0h2b3cvNzlrWjA1Ui9a?=
 =?utf-8?B?NEg1YVBENjFNWHdwenVzZWhEMlZmeHBDakp4R1VnSHV5RjJ2RGNrckc4YTNy?=
 =?utf-8?B?MnJuWkxvM092UVhISTB2RkdtRnVYRHQzajNRbFFxY3pNdkZsNEdhcjdWY0Z1?=
 =?utf-8?B?azM3MVBrNXgvS1JNWXZBU0JKelpveUlzd1h6L3ZpRHNsYmdzckNwM0VXalQz?=
 =?utf-8?B?N2JKYjNHZFAvNmVRVXFLZk1lVkNGRVQyNDhPcm9QWXhKdlpocjk3b2Mwc2VF?=
 =?utf-8?B?OFgrK3N1REpkdW9wb0FTTkowcStieTYzUVB4TGtXRFdsTHNKd1pvazZ2Umhw?=
 =?utf-8?B?SUVWS2FaSE5pMXpkb05uQ2grNHhjSWZRc0JzK2VBVGxXU2tTZG1JaVBMVEZT?=
 =?utf-8?B?TWFJbEVTak1ZaExGWDJNMUFyZmZiZEFad2xla2JPZkdlVnIzZmNiUHh6RjNv?=
 =?utf-8?B?ckgxYzFXbkNpQXR0TEYrWUI4SzZVOFNZZFhHK3FkQVM2bWw1UThMdDhoUkgy?=
 =?utf-8?B?MG1UeFlhb3NOVEJXU1dHNmJua3ZKcUQzdTZMZDZyVnpqdDNmYnlIbXVpcjFz?=
 =?utf-8?B?WUtacVJiN2VTWUk0c05CV3lZMW1BMmo5RHByL2JDS0NKcC8zMXRTYldEaHRi?=
 =?utf-8?B?UDllZ0REUytsQStUS3Q5eDVzbW4wU295akZ2UnYxZTFjNklqOThyZTZDS2hw?=
 =?utf-8?B?Szd1V1U3V2xGZHhzTFc4c2xRYzhWdUNKZmc1aFlLTEpYODZaV0pTNEFFQ1Nw?=
 =?utf-8?B?Qnl6cmptRjB2MUoxd0pLSnZHcjhENkhVTWFHaVMyU2l2cnR2TENVeHJsMHBH?=
 =?utf-8?B?SGY0NW4xVjJya3FScHZkSWhjdzFvNCtrN3QySzl1RnFLWDhQbVVuZWlpN2JN?=
 =?utf-8?B?SXk2V1BGTG5TUC82WkhId1hzblNXMFhpVVBOM3JZMzBiMWRzVVNRV2xnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjNPYmVJbEtOcmYyNmJHLzZyTlBTY21rSWY0c3h0NndqZWozeVFnNHVSTFdR?=
 =?utf-8?B?eHNuZGsrUkwyMkJCeXdEV0IvanNGazNtOENpMzZHcVJFNC94RDJyWFAzbUI3?=
 =?utf-8?B?QUtrVWlDdDVkNGVBL1dKc1owZFphUFhlYkUwU2pWUmNBMUw3eXBDSHJ6eUVi?=
 =?utf-8?B?R21kRWpLL0svQ1M1OVBOM3hFaGJOM2dKRHJzcFBFN1FsUXdiNnRwWEhvSyta?=
 =?utf-8?B?MlFPeDI3TVVCaStydHlYa3RwOHhPNHJBbjhiOUo5ZEhRb2I1R01URks1RTk4?=
 =?utf-8?B?dWVPZlJka1RLRkZMeHU3MXB4bFk4UVdLcDZ1dzhSaG4vMi9ZSlJ3SVl4eUZ5?=
 =?utf-8?B?dDQxMVUvbWRpOUttb0ZoUjhZQVV6aWJvYnNpb29ZNzduUDVBeVRFZ0d5RllN?=
 =?utf-8?B?ZVhlcDgxYVR3SnlobDU2ZFdtbzBoR01OL0Nyd3loTGFxUHdhd3UrZFpLWFVH?=
 =?utf-8?B?MUpaVjByb1J4WUdTWnROYVZPbGhXMzBhazdYMnpnQ1haaUMrZnE0cmlSM1lR?=
 =?utf-8?B?eHIzSWJ6U3JFeWZKOWszYzlCbGhGNUZtNlpRSG1raDZnUWxNOUI4Z0NoM3Q0?=
 =?utf-8?B?aVJFcVo0ZUJkOGJYZ2RMd3BqNmlNS2FuMnZFOXNMa2xmRnJ5cldHTVpoUC9L?=
 =?utf-8?B?SWxteUwvZ3BDMzBBMVV2bWhKR2pNTjRMYzI0SHczZTNvOStRUFlNdjFmOWNE?=
 =?utf-8?B?b0lFK1pJVDFhSEV3b3pYSGphSHZ1WlJrNFFuQUcraldCczJ3c1pzZ01IMkhB?=
 =?utf-8?B?WkdjTE5ad01SVnBlWEF2TkZWK05ib0pHcUg1TnErZjJqRFhOdS85US8zT0NZ?=
 =?utf-8?B?SDhVZ0poLytRNUJJdUZoQ1dEeUZwK21PR1l2K0VYTk11ZW9reXk1UTZjYmZ2?=
 =?utf-8?B?UGRnaWtaby8rSWhwRUtpUi9ITVJtUnlGdTVIeVhpNjhxY1l4L2JXTE9IVVdt?=
 =?utf-8?B?YllVa0hvTHVwYUF4VXNxWjdrYlU5L1pVUGswcTlRY2pCa2EyN2lXamwreXdh?=
 =?utf-8?B?Z1FsLzlmVTBuTXlHTWUveHU1c3laSkpaK3l4em5CcEJCWkRSZk4vc0NpUVgw?=
 =?utf-8?B?NDhnLzlkVlM4V1ZRTk54U2g1eFVWbmdxemJFeEo2TE10aUlYanBnZEt3MGU3?=
 =?utf-8?B?QVhKbDM4T2hNdThubmRXUFJUYWVTVEpEdmt1UUJET2lrRlVYdUkxaW9HT1o4?=
 =?utf-8?B?c21ocnZNcmkxYU9RcEtab054enlKWlVicGFsTzg0Z0ZxTlRMNGVmT2U4U056?=
 =?utf-8?B?eXY0Ryt0WVR5S3FnS3V2QXFNSElFZVpVcytkOStBWm9WZWRsVjNzeEM2L3RS?=
 =?utf-8?B?a3BOVmJuS3lneXdMeFVJSElLOE9rVyt5TVZ0TCtRVm1WcDdiUmhXTWJKUi9y?=
 =?utf-8?B?TUIrclpZQ2QyZnFvbHJlcXRqdTkyaHdQcVRFd1JvcVlNTjRnV1NTaS9QdEJK?=
 =?utf-8?B?NjVnV3pWalpOYWw2cjVveVRrZ3FXdmRqWERSdE9INlFIOXJ0R0o3QUIyVjZW?=
 =?utf-8?B?VFk4UEE0RVBCTUQ3bm9JN3FtbCtmWGZTL2FMbzJUQm5uNWZ5UXRMQmlWUlRp?=
 =?utf-8?B?UnJmV3N6NkJ2NDRTR3pHY3RVckNzUDh6TXc1dmhDa0FKTVFhcVdWQ3dxcjlP?=
 =?utf-8?B?WkplTU1GaExNUDFObHlxSkh1SGFsQlVDUW42dzNIRVRWNmhWR21mSFg5ek45?=
 =?utf-8?B?dURMaDA2V1V4QWlTZ3AwcGpTdnFVTGZDNnl6TVNLVzB3bWZVY01TWmM3cUJW?=
 =?utf-8?B?cXVydE52YU9QTzdXTC9IQzNBZWhqa01SZU1uSXpOeEs2eGpiaFFrQ3NvWEQ0?=
 =?utf-8?B?OGNHbjBwWStaTnJjNHhoT1VNN24zMXM1WTcyWHo5SGVzbldHditicTdQT1oy?=
 =?utf-8?B?MHV4VnYvVHJKU2NpTDJZOWVjMWw0ckQvNGpvSE4zV0o3cGpnZ0QyazRDN3dU?=
 =?utf-8?B?dUxTV0pkY29ZbVo4c1pZWkpSVDhDazVLYkFpSkMzbFJnS0Q4bHlINlRYWk9y?=
 =?utf-8?B?WTVrcVVNekIwRkRRbGo3b0FCUjlGZWVHVU9HWWVucHpSNjBpeUc2aE84VVpk?=
 =?utf-8?B?cFlVdHJoMExiM2dSN2FSSGFRNTdOZGZ2VERudEZKRldVT1BDWHphTC9MUWJ3?=
 =?utf-8?B?RDc5aWRyNTVsVWJzell2cUNhY0lQN2l1QlprbE0xZHk0NVh1VTB1ak9tUzdh?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f34feaa-4f79-416c-7392-08dc743abe51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 17:24:43.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GNHTk8RQAnkBCD1QX4n6FDkGR2MbuC777LgEAZnzIg6IWJFofGdkhp40mSlLFOCUz7Q0ia7buKMOjO+w7+OEP1mF7VZXyFMIeiCZDewcSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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


On 5/14/2024 7:36 AM, Lucas De Marchi wrote:
> On Mon, Apr 22, 2024 at 03:48:56PM GMT, Rodrigo Vivi wrote:
>> On Mon, Apr 22, 2024 at 11:10:43AM -0700, Belgaumkar, Vinay wrote:
>>>
>>> On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>>> > On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>>> > > This WA requires us to limit media GT frequency requests to a 
>>> certain
>>> > > cap value during driver load as well as after driver unload. 
>>> Freq limits
>>> > > are restored after driver load completes, so perf will not be
>>> > > affected during normal operations.
>>> > >
>>> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> > > ---
>>> > > drivers/gpu/drm/xe/xe_device.c |  6 +++++
>>> > > drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>>> > > drivers/gpu/drm/xe/xe_guc_pc.c | 40 
>>> ++++++++++++++++++++++++++++++++--
>>> > > drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>>> > > 4 files changed, 55 insertions(+), 2 deletions(-)
>>> > >
>>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
>>> > > b/drivers/gpu/drm/xe/xe_device.c
>>> > > index d85a2ba0a057..e29c152a6c4e 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>>> > > @@ -30,6 +30,7 @@
>>> > > #include "xe_gsc_proxy.h"
>>> > > #include "xe_gt.h"
>>> > > #include "xe_gt_mcr.h"
>>> > > +#include "xe_guc_pc.h"
>>> > > #include "xe_hwmon.h"
>>> > > #include "xe_irq.h"
>>> > > #include "xe_memirq.h"
>>> > > @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>>> > > {
>>> > >     const unsigned int flr_timeout = 3 * MICRO; /* specs 
>>> recommend a
>>> > > 3s wait */
>>> > >     struct xe_gt *gt = xe_root_mmio_gt(xe);
>>> > > +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>> > >     int ret;
>>> > >
>>> > >     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & 
>>> DRIVERINT_FLR_DIS) {
>>> > > @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device 
>>> *xe)
>>> > >         return;
>>> > >     }
>>> > >
>>> > > +    /* Set requested freq to mert_freq_cap before FLR */
>>> > > +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>> > > +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
>>> > > pc->rpe_freq));
>>> > > +
>>> > >     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>> > >
>>> > >     /*
>>> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c 
>>> b/drivers/gpu/drm/xe/xe_gsc.c
>>> > > index 60202b903687..556e73fca813 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
>>> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>> > > @@ -19,6 +19,7 @@
>>> > > #include "xe_gt.h"
>>> > > #include "xe_gt_mcr.h"
>>> > > #include "xe_gt_printk.h"
>>> > > +#include "xe_guc_pc.h"
>>> > > #include "xe_huc.h"
>>> > > #include "xe_map.h"
>>> > > #include "xe_mmio.h"
>>> > > @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>> > >     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>> > >     struct xe_gt *gt = gsc_to_gt(gsc);
>>> > >     struct xe_device *xe = gt_to_xe(gt);
>>> > > +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>> > >     u32 actions;
>>> > >     int ret;
>>> > >
>>> > > @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>> > >     if (actions & GSC_ACTION_SW_PROXY)
>>> > >         xe_gsc_proxy_request_handler(gsc);
>>> > >
>>> > > +    /* Revert the min/max freq limits as we're done with 
>>> GSC/driver
>>> > > load */
>>> > > +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>>> > > +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>>> > > +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>>> > > +    }
>>> > > +
>>> > > out:
>>> > >     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>> > >     xe_pm_runtime_put(xe);
>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> > > b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> > > index 521ae24f2314..7f82b6c2ad3c 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> > > @@ -40,6 +40,8 @@
>>> > > #define GT_FREQUENCY_MULTIPLIER    50
>>> > > #define GT_FREQUENCY_SCALER    3
>>> > >
>>> > > +#define LNL_MERT_FREQ_CAP    800
>>> > > +
>>> > > /**
>>> > >  * DOC: GuC Power Conservation (PC)
>>> > >  *
>>> > > @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct
>>> > > xe_guc_pc *pc, bool enable)
>>> > >     xe_mmio_write32(gt, RP_CONTROL, state);
>>> > > }
>>> > >
>>> > > -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>> > > +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>> > > {
>>> > >     struct xe_gt *gt = pc_to_gt(pc);
>>> > >     u32 rpnswreq;
>>> > > @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct
>>> > > xe_guc_pc *pc)
>>> > >         tgl_init_fused_rp_values(pc);
>>> > > }
>>> > >
>>> > > +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>>> > > +{
>>> > > +    struct xe_gt *gt = pc_to_gt(pc);
>>> > > +    struct xe_device *xe = gt_to_xe(gt);
>>> > > +
>>> > > +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>>> >
>>> > that's what xe_wa_oob.rules is for. Why are you adding it as a 
>>> separate
>>> > function that won't allow debugfs/.../workarounds to match reality?
>>>
>>> The workarounds are not initialized at this point, this is early in the
>>> driver load process.
>>
>> So we likely need to change that. or we will start to create a mess 
>> in terms
>> of handling the w/as.
>
>
> These patches are now merged:
>
>         d1855d284e9f drm/xe: Move sw-only pcode initialization
>         45b9066ec351 drm/xe: Move xe_force_wake_init_gt() inside gt 
> initialization
>         65c4de2a9148 drm/xe: Move xe_gt_init_early() where it belongs
>         402c014cbcc7 drm/xe: Drop useless forcewake get/put
>         61549a2ee594 drm/xe: Drop __engine_mask
>
> it's still not pretty, but now at least this part of the initialization
> order is not totally broken. With that we can check for the platform
> needing this WA in the right way.
>
>>
>> But another comment on this w/a is that it is incomplete. It is just 
>> part
>> of the w/a here. We need to count the GGTT page table updates and with
>> a threshold update another mmio reg, or something like that.
>> also drop the freq at module unload, and other stuff, no?!
>
> did we resolve this?

Yes, will send out a patch now that your series is merged.

Thanks,

Vinay.

>
> Lucas De Marchi
>
>>
>>>
>>> Vinay.
>>>
>>> >
>>> > Lucas De Marchi
>>> >
>>> > > +        return true;
>>> > > +
>>> > > +    return false;
>>> > > +}
>>> > > +
>>> > > +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>>> > > +{
>>> > > +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>>> > > +        return LNL_MERT_FREQ_CAP;
>>> > > +    else
>>> > > +        return 0;
>>> > > +}
>>> > > +
>>> > > /**
>>> > >  * xe_guc_pc_init_early - Initialize RPx values and request a 
>>> higher GT
>>> > >  * frequency to allow faster GuC load times
>>> > > @@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc 
>>> *pc)
>>> > >
>>> > >     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>> > >     pc_init_fused_rp_values(pc);
>>> > > -    pc_set_cur_freq(pc, pc->rp0_freq);
>>> > > +
>>> > > +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>> > > +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
>>> > > pc->rp0_freq));
>>> > > +    else
>>> > > +        pc_set_cur_freq(pc, pc->rp0_freq);
>>> > > }
>>> > >
>>> > > static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>> > > @@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct
>>> > > xe_guc_pc *pc)
>>> > >     if (pc_get_min_freq(pc) > pc->rp0_freq)
>>> > >         ret = pc_set_min_freq(pc, pc->rp0_freq);
>>> > >
>>> > > +    if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
>>> > > +        /*
>>> > > +         * Setting min to RPn disables use of efficient freq
>>> > > +         * which could otherwise interfere with this WA for 
>>> media GT.
>>> > > +         * We will also bind max to MERT_FREQ_CAP until driver 
>>> loads.
>>> > > +         */
>>> > > +        ret = pc_set_min_freq(pc, pc->rpn_freq);
>>> > > +        if (!ret)
>>> > > +            ret = pc_set_max_freq(pc, min(pc->rp0_freq,
>>> > > xe_guc_pc_mert_freq_cap(pc)));
>>> > > +    }
>>> > > +
>>> > > out:
>>> > >     return ret;
>>> > > }
>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>>> > > b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> > > index d3680d89490e..25fe693c7ee3 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> > > @@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct
>>> > > xe_guc_pc *pc);
>>> > > u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>> > > u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>> > > void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>>> > > +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>>> > > +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
>>> > > +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>>> > > #endif /* _XE_GUC_PC_H_ */
>>> > > --
>>> > > 2.38.1
>>> > >
