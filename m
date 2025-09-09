Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CF8CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 12:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C2D10E24B;
	Tue,  9 Sep 2025 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vk4iNo7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30DE10E24B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757422617; x=1788958617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1ui6dtv/DGjOzjI3TUeuuiCtKP1VeS9EEf1fmb01bXY=;
 b=Vk4iNo7SwRcLVeGTpAyQqRVHankxcdgauYL03npsnAvYzeJ6RGPckN89
 lTRBOu03YFM284pESEycwQ0OCDwtAMNcfGB2Ez2C/Efqzr56sBD6bScpX
 5NLmj5h4C1/iWDk0IP4MLUbrRcM7V8RvN4DZ7xpRfLh4xWkWLz6nGbpyE
 1xGwDSceEdxZrx2IWa0TQPzpyvMPVpNqct6et5H6Fr0c09tHtyyZ2R2A7
 Q4ipqMy6vTcmTeygzn6aTK1DgakZExHR+9QuYjYkSvFTmlmJNUFRcrbzC
 GUikQcKREpEDCbZR0xH+HSLMZL4xe2VcxYn9aLhzy7vr/hRgPV33VJEbt w==;
X-CSE-ConnectionGUID: tcJa6+FyQ7mDDTlOrqTjtw==
X-CSE-MsgGUID: jz2knW7NQl+gP9jq+39lig==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70401374"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="70401374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:56:57 -0700
X-CSE-ConnectionGUID: 9Pjz3Z+FRWiRscNHH2fFhg==
X-CSE-MsgGUID: BkN25eATSl6v2vYCBuSe2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173865658"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:56:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:56:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 05:56:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:56:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gg5jQIzW2ukrh7JOip5wRf+gKgyGmuNUxJ22xk7vcCn0lMssegEGtvAP+N7vt62q1MyYDSU+TsZ/O83Ys6Rn4eP71o4Rd8XKBK22N5zkCLV/Kvyp+mQ6a+XWfWOQTuagipeBCqsLshiGbLp8eBISRrhUB28G3RQL7Wp1Qe0ki84x/3FyIs5AQsv/fXSpKZIZ8sljVgEwSU/eA0bnweUiEI9nadDnFQqrSIWbleh4bIrfNNBEo0nCJZ/5vj+99uOLbktTTWajudXjQ5L7sToa1WlvTGKpDqcgJgWbFB37t/fom1yhrNpxU0PtzZFX8pDE5cUbw+YN/h/KFDfET8nCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GNwoV5lLMGLKTjM9kck1XV//t+b3uLzEiYttOIY254=;
 b=RIHucKMmrKJ8RPD2MNfv39oYnVUK+CCy2tycmpaTri9nS0Y8E4ljKgePLMcCyTcQuUcnzxQoUh4lLg6r/t4fj/JZY4QzxAFcKm4SCNqI327WmDE297mc5I26ZYIlMhYCSoARKWJHrXCZtIDFqx+VEz82yekfqnNv7ZPNgEjiTPgZGZbOUBYqh/u7hunceqzHuHqaUG/jY6XGzG5pbMwAovk8xSK2t/rSOKcB9Z5dNNKvkBaTlXbaNNr1MJ34uqMpfGZIZTGFsR5rm+qPfiC4u+BN/89fvyyKwYum8ZElmP08e+eiGJJDM6LxdotM/hzS/WwvG8k3l9KTvf75/ZRlnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:56:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 12:56:51 +0000
Date: Tue, 9 Sep 2025 07:56:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v3 6/6] drm/xe/configfs: Add post context restore bb
Message-ID: <uvbnb3vnm5hxmfif2z3xd65yf4rx6vz454lr2r55j7mj3ojd22@7nx5duu4zhgl>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
 <20250905-wa-bb-cmds-v3-6-3da2b7bdc73e@intel.com>
 <20250908223950.GB150955@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250908223950.GB150955@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d60eb9-9fe6-40fb-61a1-08ddefa0585a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xz4jX40kPXGlAzIMoC2G5OmAoqEAeNLLr3kJkFnpY536OetGecrEh9kUENq0?=
 =?us-ascii?Q?DceaYfh2FIuofM4m4gsTGsPLMAh4NmhYafslOqIkN1csoKC+fc5N1gwo5HEe?=
 =?us-ascii?Q?n6ohII/YU9BPtPoP1AMqTlXLaME3naVnnDDbX7PRHsX7i5beht2MyylaUcsz?=
 =?us-ascii?Q?7TwTquMIYNn/7B1bimrHtrjQ2V3LuGknqSvRcQIt6ihtPPV7tfUKc5AH0CSY?=
 =?us-ascii?Q?iDoPcDm6Iu9VQD7yBibj1fayhxAOYtg9loA1TmS9A1KH+c7giHT9USAAG1yG?=
 =?us-ascii?Q?kMllegBLR1ZiCojg+Vvm6DqE63vCYOkbIinH0IMMlouLt+iP1LxJTOk9cojz?=
 =?us-ascii?Q?iwBuC6s4jn1syrpcVrNtNAOHSc3DhNqvzWrYixcYdDCLef4dqic3A6BKxTg3?=
 =?us-ascii?Q?TA0mzcFgEDrfuXpObN65TMe59fm8odIvuDnLvfkENiPrUupKG0rs8gL24Eyj?=
 =?us-ascii?Q?w4zcV0NRmFTZaRPkMyL76ihFLLP6EBkTJTk3/AfuG7vrFO+AtprObl+5l8aR?=
 =?us-ascii?Q?vyNWX5z5jrc3jej11EJOsl6I44XgMs7gJTz03Mu6i2iV/GLm1iqzwhMd7QTq?=
 =?us-ascii?Q?bdS3wkvkP+828NWM/fFVMGaiDZOVZOCzYOQv5PeJSmjkQs5ko5ZPEjBbakdA?=
 =?us-ascii?Q?lcgPqvfczj0QurR8e5gdyIB8VgsMH6rI5JxWxUsrhV2L3iS3SUsd/3jxWG3F?=
 =?us-ascii?Q?p9zt01U24uiDahM+gau/gXCcXBR/8VXZ2zEsWTOnDeT6jGNj2XCfs77gaO78?=
 =?us-ascii?Q?JIJG0KinA3lcurajL5qdjV0bmLF0zcpUQGHkao1auqzaeGyPbgQZyHGTXU2x?=
 =?us-ascii?Q?drAok+RaKmWSxCTH8gws0h0HLnyMp0iSkUbkqk8rs1zPcMvs4Xrwj52SHJdQ?=
 =?us-ascii?Q?rddH8TNm41iOI0t4/LrWdMXO/9z3OFMhLHxfJzzUQgsozdbIm/xJpP0h2RzR?=
 =?us-ascii?Q?U6CQjqZjdNLavwjxiU/RcWMkLXTilBJFKtzDQQzTkLtHF5DbldnJSAd74Qgn?=
 =?us-ascii?Q?r8NP/DJiISkclU3mUmWzCvQwKM9mZ0tBpE4rd4AWFeTxw7BVR8NrBgraRCuT?=
 =?us-ascii?Q?4GUqpDsIEVD/+ZLqF0+w8Js5o83x+f5bUYzff/+ogk4m15P+iWvJf49i45Xz?=
 =?us-ascii?Q?DVqUN0KybteIlpEcA6/Gqm7IHYgUyfeXQMkBU/eIl9yy4POq1Jgg2kJJMvdH?=
 =?us-ascii?Q?sAyXw+cRPiTQhmpe7US0Tf2vx+/S0bPtBHv5DJ+E1TSMzRhcfy96T05m+pLc?=
 =?us-ascii?Q?/lMRDivIVNs1YIqDJont+tNgsJHGeNX/zOsMQSdx/pP3npxp9hvpnskkMWF4?=
 =?us-ascii?Q?NmDZObk8Ju6kAGZJAw0zuoMrnh7RZgikjn1Nm3AJz8e86Tw3cT6LBhsIPerN?=
 =?us-ascii?Q?YeI24sURJum6nzMj+E4ytZpJnk7a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KLOuslAUuRdvfnhWEBRQyJz59kRFWsPuR5IxYgWVJFsVIR1Nqo0CQiF1nn3P?=
 =?us-ascii?Q?x4MDePPJ7VRNYNj9aoC8fviFufwDVjdZS1w0mShVtFWGrVnYSEjdqAB045Kz?=
 =?us-ascii?Q?w5gkGjIOid/dDovUljyKxrfbPUy2w4zugzzguOjMSIBdF43saTwlgxFDRuVw?=
 =?us-ascii?Q?DirbyKlsG06alIjvnIzEol16V3lEJKIC3w4oa+1kryYG9hVN6TASuPFaVkVQ?=
 =?us-ascii?Q?+rHzjYYBm9dI8itEdMuH21Y2OGmowS0HjbMAYaxW/ZStb+z43IJyCoLycddL?=
 =?us-ascii?Q?Jv/kWos0XPjbMmOAOdQCjKYOTQHFvJ/As39720uk5t0VnukKXU8/SKnIXIH+?=
 =?us-ascii?Q?8guM97N58Dd139ny/ZyFc7/1QWsmlJuEY/L/wAWFysZ55q9wA7w3fn7aqesS?=
 =?us-ascii?Q?X/iexrrNzOU2XMNmdJNVlYaMkVzNrzRDmDqt/eWWXyXH94jH0gIiTfY3czNR?=
 =?us-ascii?Q?ODO2yzqyuCy1ILI+RK/eBRj7U9S7Xr197zNUpTTbHqsGUEnh5wbzYE2odJIQ?=
 =?us-ascii?Q?/EsCfL0Dsgu53qwISdD7hKz10FqXKHHtZVAG+ZwOl1ZzUra2StKQSGcAb5uA?=
 =?us-ascii?Q?8hcwf1bvL1XjmqaoMOITF2hyZWvbAfp4j0tNnKE+YZGk1p0UWjxA/e27eW07?=
 =?us-ascii?Q?E9G3BSS/fV+pHkCSS5jO26ZaTJXGpHneV8cALjfmoTejhEU+GeAnGHLp1/ey?=
 =?us-ascii?Q?Lwh/CL9LqxXg+3q821w0kYHy51Yg7+7WCKKIt8dOKD3hYMzHFYmQ4Yftfwby?=
 =?us-ascii?Q?s+grgGDve0bYV3KTDpQvv6P7H8pvD9AgaXtkQMXkO0aXf1Bi8SB0Kl0NHjwO?=
 =?us-ascii?Q?ZVglXa0fVXZwf8xFkoU7dv4K/Zk+zCdWC3olzJDbTl9ECWWwK+DyEbQAdS/m?=
 =?us-ascii?Q?KzyTsqCVQ/eMr3VnhBhl48TBDv9YVNzAlT27zV5sfbQ6j8L1uPTJA+N5p4ZH?=
 =?us-ascii?Q?apePh+xV+TN8KSROPZamX5zbAY6HKDViK6m6T1VNNLF1u/uDFtiUsZ9nqsum?=
 =?us-ascii?Q?CjZ9jKirWPN42gn4GEQmyCzJ+QMeBIDWbRInuW2O5fhc7ChqtNmtxcUWDxgG?=
 =?us-ascii?Q?aQdLI/06N907v0YJW/MBF9olvtq3pFpU8+G34U3ugKJau5kfBa3DUNF3irSr?=
 =?us-ascii?Q?xiHpPabUMS8uBsjJir4Kj3oTaZUp2MExg88Wi9PfIkHvciMU3ewvFei9Aht7?=
 =?us-ascii?Q?t8u/zW8egfDVHELppFOctz2Hci1Cb8ojCNYAjQruN+MjRuApm8a4HZE7Kth6?=
 =?us-ascii?Q?j3EXU2sCoN07w6hQD10cg5qXAGHgzP/MuOOnae203AhkwXfCGWKq+ayBnDX0?=
 =?us-ascii?Q?ZAQJFBR/3nAMBbHynzEL6JupXXpoLVxtun2GE1ID0ZWp4z8rYK0vw5oD3pjH?=
 =?us-ascii?Q?t5EiaFNXJ3YyrSkSDEjoLASnlRPxt0T8D62pa5e06wyPrWwO/s2wUvJB+Pvh?=
 =?us-ascii?Q?+HiW2DZZRqJRhmWip42y7Ep6szH6UAF9qC8i2HA+6VwIj7XHbJmeeh11W7vq?=
 =?us-ascii?Q?BaXs9B70Lhb8WJkjhJA1FoqbwIQ+NlnS/9zrOyNp2uUuO2wzHZt/Szrh8eUr?=
 =?us-ascii?Q?iRrRduGhbxMsCd4OYOLnpjQQ/0jgTGZ+rHQmwIR9fTaPA4lEAicv+NxgvfhZ?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d60eb9-9fe6-40fb-61a1-08ddefa0585a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:56:51.5425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rVKw7kFqTwEJ0aO2p68JHpQdudtCm/sFQRmLmRiz01RKCx0IwcJVTKlBdsiwAqK6AYYsmXxzN36IYKPP0aHUKJ3oP/OB2Ntld3Abe6PLC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

On Mon, Sep 08, 2025 at 03:39:50PM -0700, Matt Roper wrote:
>On Fri, Sep 05, 2025 at 10:50:34PM -0700, Lucas De Marchi wrote:
>> Allow the user to specify commands to execute during a context restore.
>> Currently it's possible to parse 2 types of actions:
>>
>> 	- cmd: the instructions are added as is to the bb
>> 	- reg: just use the address and value, without worrying about
>> 	  encoding the right LRI instruction. This is possibly the most
>> 	  useful use case, so added a dedicated action for that.
>>
>> This also prepares for future BBs: mid context restore and rc6 context
>> restore that can re-use the same parsing functions.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2:
>> - use bin attribute to be allow multiline
>> v3:
>> - revert attribute back to a simple attribute rather than binary:
>>   otherwise configfs only calls the callback on the file release and
>>   ignores the result. With that the user can't rely on the return
>>   code to know if the setting was accepted.
>>
>>   To still allow multiline, a method that uses just one syscall should
>>   be used. In bash, echo will end up using more syscalls. This can be
>>   workarounded by using heredoc, or simply writing it in C
>>   (rewrote that listening to
>>    https://www.youtube.com/watch?v=1S1fISh-pag, you're welcome to review
>>    listening to that beauty too)
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 278 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 276 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 21fd153666db8..f5fa0d14af38b 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -4,6 +4,7 @@
>>   */
>>
>>  #include <linux/bitops.h>
>> +#include <linux/ctype.h>
>>  #include <linux/configfs.h>
>>  #include <linux/cleanup.h>
>>  #include <linux/find.h>
>> @@ -12,6 +13,7 @@
>>  #include <linux/pci.h>
>>  #include <linux/string.h>
>>
>> +#include "instructions/xe_mi_commands.h"
>>  #include "xe_configfs.h"
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_module.h"
>> @@ -115,6 +117,35 @@
>>   *
>>   * This attribute can only be set before binding to the device.
>>   *
>> + * Context restore BB
>> + * ------------------
>> + *
>> + * Allow to execute a batch buffer during any context switches. When the
>> + * GPU is restoring the context, it executes additional commands. It's useful
>> + * for testing additional workarounds and validating certain HW behaviors.
>> + *
>> + * Currently this is implemented only for post context restore. Examples:
>> + *
>> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10::
>> + *
>> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
>> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
>> + *
>> + * #. Load certain values in a couple of registers (it can be used as a simpler
>> + *    alternative to the `cmd`) action::
>> + *
>> + *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
>> + *	rcs reg 4F100 DEADBEEF
>> + *	rcs reg 4F104 FFFFFFFF
>> + *	EOF
>> + *
>> + *    .. note::
>> + *
>> + *       When using multiple lines, make sure to use a command that is
>> + *       implemented with a single write syscall, like HEREDOC.
>> + *
>> + * This attribute can only be set before binding to the device.
>> + *
>>   * Remove devices
>>   * ==============
>>   *
>> @@ -123,11 +154,18 @@
>>   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>>   */
>>
>> +/* Similar to struct xe_bb, but not tied to HW (yet) */
>> +struct wa_bb {
>> +	u32 *cs;
>> +	u32 len; /* in dwords */
>> +};
>> +
>>  struct xe_config_group_device {
>>  	struct config_group group;
>>
>>  	struct xe_config_device {
>>  		u64 engines_allowed;
>> +		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>>  		bool survivability_mode;
>>  		bool enable_psmi;
>>  	} config;
>> @@ -371,6 +409,227 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>>  	return len;
>>  }
>>
>> +static bool wa_bb_read_advance(bool dereference, char **p,
>> +			       const char *append, size_t len,
>> +			       size_t *max_size)
>> +{
>> +	if (dereference) {
>> +		if (len >= *max_size)
>> +			return false;
>> +		*max_size -= len;
>> +		if (append)
>> +			memcpy(*p, append, len);
>> +	}
>> +
>> +	*p += len;
>> +
>> +	return true;
>> +}
>> +
>> +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
>> +			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>> +			  char *data, size_t sz)
>> +{
>> +	char *p = data;
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>> +		enum xe_engine_class ec = engine_info[i].engine_class;
>> +		size_t len;
>> +
>> +		if (!wa_bb[ec].len)
>> +			continue;
>> +
>> +		len = snprintf(p, sz, "%s:", engine_info[i].cls);
>> +		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
>> +			return -ENOBUFS;
>> +
>> +		for (size_t j = 0; j < wa_bb[ec].len; j++) {
>> +			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
>> +			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
>> +				return -ENOBUFS;
>> +		}
>> +
>> +		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
>> +			return -ENOBUFS;
>> +	}
>> +
>> +	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
>> +		return -ENOBUFS;
>> +
>> +	/* Reserve one more to match check for '\0' */
>> +	if (!data)
>> +		p++;
>> +
>> +	return p - data;
>> +}
>> +
>> +static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> +
>> +	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
>> +}
>> +
>> +static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
>> +{
>> +	if (wa_bb->cs)
>> +		wa_bb->cs[wa_bb->len] = val;
>> +
>> +	wa_bb->len++;
>> +}
>> +
>> +static ssize_t parse_hex(const char *line, u32 *pval)
>> +{
>> +	char numstr[12];
>> +	const char *p;
>> +	ssize_t numlen;
>> +
>> +	p = line + strspn(line, " \t");
>> +	if (!*p || *p == '\n')
>> +		return 0;
>> +
>> +	numlen = strcspn(p, " \t\n");
>> +	if (!numlen || numlen >= sizeof(numstr) - 1)
>> +		return -EINVAL;
>> +
>> +	memcpy(numstr, p, numlen);
>> +	numstr[numlen] = '\0';
>> +	p += numlen;
>> +
>> +	if (kstrtou32(numstr, 16, pval))
>> +		return -EINVAL;
>> +
>> +	return p - line;
>> +}
>> +
>> +/*
>> + * Parse lines with the format
>> + *
>> + *	<engine-class> cmd <u32> <u32...>
>> + *	<engine-class> reg <u32_addr> <u32_val>
>> + *
>> + * and optionally save them in @wa_bb[i].cs is non-NULL.
>> + *
>> + * Return the number of dwords parsed.
>> + */
>> +static ssize_t parse_wa_bb_lines(const char *lines,
>> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
>> +{
>> +	ssize_t dwords = 0, ret;
>> +	const char *p;
>> +
>> +	for (p = lines; *p; p++) {
>> +		const struct engine_info *info = NULL;
>> +		u32 val, val2;
>> +
>> +		/* Also allow empty lines */
>> +		p += strspn(p, " \t\n");
>> +		if (!*p)
>> +			break;
>> +
>> +		ret = parse_engine(p, " \t\n", NULL, &info);
>> +		if (ret < 0)
>> +			return ret;
>
>Should we be validating that the engine class is always 'rcs' here?
>BB_PER_CTX_PTR is not supported on BCS, VCS, VECS, or CCS according to

I created an issue in the spec to be clarified/fixed. That doesn't
really seem correct. In fact, we are already using it in other engines:
see drivers/gpu/drm/xe/xe_lrc.c:setup_wa_bb()

>bspec 60265.  Or do we just let the user shoot themselves in the foot if
>they want to (since there are already plenty of other ways for them to
>do that by mishandling the batchbuffer they specify here)?

yes... and the fact that the spec is wrong here.

>
>Speaking of which, should we be adding some kind of taint if this gets
>used?  Based on our prior experience with things like module parameters,
>I'm worried that people will post advice on websites like "if you run
>these strange commands while loading the driver it can make Game X run
>faster!"  Then we wind up with a bunch of end users blindly inserting
>unknown behavior on context switch, which can lead to instability and/or
>insecurity.  And then we (or the mesa guys) get a bunch of
>unreproducible bug reports because the GPU state is getting messed up on
>context switch behind the drivers' backs...

yes, I think it would be sane. We will need a way to bypass that in CI
though as otherwise it will abort the entire run. Maybe use
add_taint(TAINT_TEST, LOCKDEP_STILL_OK) and change igt to ignore that
particular taint since igt is in fact running tests.

Lucas De Marchi

>
>
>Matt
>
>> +
>> +		p += ret;
>> +		p += strspn(p, " \t");
>> +
>> +		if (str_has_prefix(p, "cmd")) {
>> +			for (p += strlen("cmd"); *p;) {
>> +				ret = parse_hex(p, &val);
>> +				if (ret < 0)
>> +					return -EINVAL;
>> +				if (!ret)
>> +					break;
>> +
>> +				p += ret;
>> +				dwords++;
>> +				wa_bb_append(&wa_bb[info->engine_class], val);
>> +			}
>> +		} else if (str_has_prefix(p, "reg")) {
>> +			p += strlen("reg");
>> +			ret = parse_hex(p, &val);
>> +			if (ret <= 0)
>> +				return -EINVAL;
>> +
>> +			p += ret;
>> +			ret = parse_hex(p, &val2);
>> +			if (ret <= 0)
>> +				return -EINVAL;
>> +
>> +			p += ret;
>> +			dwords += 3;
>> +			wa_bb_append(&wa_bb[info->engine_class],
>> +				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
>> +			wa_bb_append(&wa_bb[info->engine_class], val);
>> +			wa_bb_append(&wa_bb[info->engine_class], val2);
>> +		} else {
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return dwords;
>> +}
>> +
>> +static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>> +			   struct xe_config_group_device *dev,
>> +			   const char *page, size_t len)
>> +{
>> +	/* tmp_wa_bb must match wa_bb's size */
>> +	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
>> +	ssize_t count, class;
>> +	u32 *tmp;
>> +
>> +	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
>> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
>> +	if (count < 0)
>> +		return count;
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	if (is_bound(dev))
>> +		return -EBUSY;
>> +
>> +	/*
>> +	 * 2. Allocate a u32 array and set the pointers to the right positions
>> +	 * according to the length of each class' wa_bb
>> +	 */
>> +	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
>> +	if (!tmp)
>> +		return -ENOMEM;
>> +
>> +	if (!count) {
>> +		memset(wa_bb, 0, sizeof(tmp_wa_bb));
>> +		return len;
>> +	}
>> +
>> +	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>> +		tmp_wa_bb[class].cs = tmp + count;
>> +		count += tmp_wa_bb[class].len;
>> +		tmp_wa_bb[class].len = 0;
>> +	}
>> +
>> +	/* 3. Parse wa_bb lines again, this time saving the values */
>> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
>> +	if (count < 0)
>> +		return count;
>> +
>> +	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
>> +
>> +	return len;
>> +}
>> +
>> +static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>> +					 const char *data, size_t sz)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> +
>> +	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>> +}
>> +
>> +CONFIGFS_ATTR(, ctx_restore_post_bb);
>>  CONFIGFS_ATTR(, enable_psmi);
>>  CONFIGFS_ATTR(, engines_allowed);
>>  CONFIGFS_ATTR(, survivability_mode);
>> @@ -379,6 +638,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>>  	&attr_enable_psmi,
>>  	&attr_engines_allowed,
>>  	&attr_survivability_mode,
>> +	&attr_ctx_restore_post_bb,
>>  	NULL,
>>  };
>>
>> @@ -387,6 +647,8 @@ static void xe_config_device_release(struct config_item *item)
>>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>>
>>  	mutex_destroy(&dev->lock);
>> +
>> +	kfree(dev->config.ctx_restore_post_bb[0].cs);
>>  	kfree(dev);
>>  }
>>
>> @@ -636,14 +898,26 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>>  /**
>>   * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
>>   * @pdev: pci device
>> + * @class: hw engine class
>> + * @cs: pointer to the bb to use - only valid during probe
>>   *
>> - * Return: post_ctx_restore setting in configfs
>> + * Return: Number of dwords used in the post_ctx_restore setting in configfs
>>   */
>>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>>  					enum xe_engine_class class,
>>  					const u32 **cs)
>>  {
>> -	return 0;
>> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> +	u32 len;
>> +
>> +	if (!dev)
>> +		return 0;
>> +
>> +	*cs = dev->config.ctx_restore_post_bb[class].cs;
>> +	len = dev->config.ctx_restore_post_bb[class].len;
>> +	config_group_put(&dev->group);
>> +
>> +	return len;
>>  }
>>
>>  int __init xe_configfs_init(void)
>>
>> --
>> 2.50.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
