Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42553C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 16:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2B10E804;
	Fri, 16 Aug 2024 16:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK3WKPMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6433810E5A4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723825987; x=1755361987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H4LWo+DYnlxL65ZVrV1llOka5f3cZkJfPBR5yPTOjHU=;
 b=XK3WKPMcwSZ3oS4LPL5f9Acp7hljjJrNV/mxJXGzn4tlvJqm3ZHlbET1
 ZyhXw8vmOkE62WRuLESQWWi439IElOycYBOl/tobfuoJYo2nXFuLSJIt7
 CEpmW9DcDMAuM0tb5jITyHgWwEmJHkGk5Wn8+pLWe7JAv2LwyM5yw7pTb
 6+xs/EsQHEYNs2JoVEcJDCcVIJKnj6cwEY1CEXeSsSmYoZbs4Majwoacr
 3nhxoSc3kBIV1eqgV3ihbSnW7CHpyc44WsVXK5LD1RfHR5Uhb7argSumc
 dHL8NfkQkeG4xB6zHo1i8TVpQZjLgEEova4f8IX6d236EjDC8m6XTLmdh g==;
X-CSE-ConnectionGUID: er59bWQGRPi1liMpTnIE+g==
X-CSE-MsgGUID: yh8oQqfASIeN6T+CvAGkaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39582279"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="39582279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:33:07 -0700
X-CSE-ConnectionGUID: yUHCgfSnQWmg1cPh9t7uHg==
X-CSE-MsgGUID: PEc2FnKHS2mdyEurr3vVUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59351137"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 09:33:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 09:33:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 09:33:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 09:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/eTZvzauCbCQ/LTQ6OdKD8yajU9jkAsb8+Djx145YVoSxF0QTFYS2/pBrog2CUtghhgExNf5Dev+u7sgv4qgcxAw1Ys3+ONak+46/zfaI+daRSodJ3oNc8iH+XA2+b3wo6HbRN+XngkWpL57MxCw+FbvuDg7d6ASneae+rIZBM4kUF/2d8Hq+UUSDbkmfvBzML+drkAr+Pc8L9ul4rCr4bmRH3AnldAKNWXTePIeTD6f1kPKIQab0SSf2Fv7m2gZhQJL4nVWSlthCkhQxqqpwFAim3WgJk2ossNTgS0HcAvqJXyFbDiXBokco9nBCLhUfRiF5m9wYW9/SlNBmWUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4LWo+DYnlxL65ZVrV1llOka5f3cZkJfPBR5yPTOjHU=;
 b=n8+H4NAH4BiTNJ1mxiaS2MjmV6NmX3R3Xt78I+YjcbXN0oHvFa4Mgw9sesGa52WNwPaX5RaM29cQ2I6k5DPX0a8Pp5LcKpiBRqsoG1HMXvPoQwm5v6ERy1n2TLG5IFfPXCt8vJ1YYMD0mFS2fCRQbniksAbSsCm90Twem8PRoymFm1HRp8XMka8xcL9RKEMqlSI+0isoDmVt9EiMqfodMlSNrMxEyiE6tQ56vJ+I00coVoftKu+k/wSiON4H2sgAAUih0uLeVqy39v8eOzlXg+A0xzzbZRYAeReUEUj+LzG2sORv7XHp/nejUZzCRWGcoaw/qZwa64utF+UJJL5rUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6160.namprd11.prod.outlook.com (2603:10b6:208:3c8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 16:33:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 16:33:03 +0000
Date: Fri, 16 Aug 2024 11:33:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use for_each_remote_tile rather than manual check
Message-ID: <v4fad4xwjpgqxyxrsowbdetjagmep6xjgeu3ngqio5ubxuogou@d2bnmj5a6l7a>
References: <20240816040208.62695-1-matthew.brost@intel.com>
 <y2p43m2m7uozan642ubnbl3rep7bqefof6yegvo6empostayqi@lyy733cbuy7i>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <y2p43m2m7uozan642ubnbl3rep7bqefof6yegvo6empostayqi@lyy733cbuy7i>
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9b7306-f34d-40cc-2147-08dcbe11195f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m/HpnhuYF8BgZXn+cSud4WfmaYuurMKnemrpdQNgj4dfjUxyx8kyQoJXSi8i?=
 =?us-ascii?Q?PbP6pPtD5APX0ZVnWQS2LFQZznyVfGt/UbXjmBP2CVaaumnRdeC41IEwMsX5?=
 =?us-ascii?Q?mh8UIl45wwRQpgEg4ZVQzUPVnSpMNmPOAZfLmkmWhFjVI/9GGISAglhnq0AF?=
 =?us-ascii?Q?CMgV+ioYcXGDtYuWSM0AO/RHhPGfQI/Ug931ErnPB+w4/ZU4/sOBBAcfcxVe?=
 =?us-ascii?Q?EFo/7IuO+z3j4pDAu+mUF/VhEbYcZiJYKfpEqSo2IoAOfFvUnPch4RtEpuzV?=
 =?us-ascii?Q?ZzaLODyJjchstl/gK4AMGixwldxhALnuxaKRIEWN4gIEP/byxI3xe9avTvP9?=
 =?us-ascii?Q?CgltCTWgvltSce2vfOoGhzCZB09vYV0f9cRFeRreHo5h1tSm2ROt7oDgJgWi?=
 =?us-ascii?Q?g0RWCx6nBHzkUoYOfT+ofNtRdEubUWOQQy/Uivdq7RUFxeP2jSYsF/OFzf/w?=
 =?us-ascii?Q?vadIpl5mZ06wqBuequw3aIm3jtSJTPaLeum6eywa+GAaVrgJO2eRMN+hCSe5?=
 =?us-ascii?Q?v/0ozp5q/dlPR1CdU5a2ncnNbE919bk/alc8gXmgnHVZ4tkaEHn6RBSpRipO?=
 =?us-ascii?Q?gGNj4WHnLCDkNEnqQHGBWEgGTKmNJ5BlmB/dq/Qfg0LjnrSA2bLNQF4Oitdl?=
 =?us-ascii?Q?jYEN/f9ULSav3V5hQeK+AlD8geFuypmFRG3fxUGDEZrMzEOElt82JSu52qfN?=
 =?us-ascii?Q?poHaH9uxcXCmiSExLuc9+mbRJR8chus/VpuKXfv84ujYIo1HRzKtyw6B5z5J?=
 =?us-ascii?Q?PzLKrXg0hZDOkL9NUSq+FL0h+Nb+KPc0ZB/Dfg5EipLkfQZ77By0pXBzFx14?=
 =?us-ascii?Q?bC5a7nsj/Q/6J/rqYo5gbzeFxH6ajLdk82F1d8qrpv2GYth/6lKLTmiAD9H1?=
 =?us-ascii?Q?u3fSzw+cGBK+vt8VlTtXFi5wbXTx+CiKZYjH5nARzgygsWMhL5l+aGsA3sZp?=
 =?us-ascii?Q?AYQCWIQedTYoR52MjUtJrXlGFrmQXp6zbk6+oFzeS+VtilNJR3KBYYzZDZjd?=
 =?us-ascii?Q?b7W2miVUHwrXyRscGHyX2zkdikjVYtNoC/vMmPxOBJR6Cj7dFYMYV0Ik5Sqn?=
 =?us-ascii?Q?zO0lIXwEfdQ5taVY86F46SldZYvlYx+NbyrMT/0KOuuCz2PpHutN3fko/BKe?=
 =?us-ascii?Q?XebNQYOm7dkK6OZvBzzd9kogf27xBIgxzGwHMcxD3YflFUL0KcY08EGixhlh?=
 =?us-ascii?Q?e0s/OEv7W1wTvHskpXdvaWvA+GVA75L3dUdNF0slbvUMM3IlJWNZmR46FfXs?=
 =?us-ascii?Q?zHjwF8ZbJ1wQGmeYFKIZGBMbzvzLQCKWtUdKJ3Mkn+2tIYmrLlSPHFMaQBLX?=
 =?us-ascii?Q?z2A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRilonTzxSHhSX0LRFC1Op694rCR/gc1v+hQUygY6Xfcu/qGB4d7AW3DnOw2?=
 =?us-ascii?Q?dAWX39lKHvFiAWjytLJeqG1F30MjNtamOzRLj96FuxXtph/Si01jUB4LUaeW?=
 =?us-ascii?Q?GUHRxV1hjPdn2EL3qMvUK6QqqM4BHmj4lysK9vQgRcuGrghjSeFYKnQEGhky?=
 =?us-ascii?Q?tLJksUFTin6I24Z5XVpj79Pvv3rY9jxGASaA7P/N+3Gt0LZyH7BzSS2/vrrH?=
 =?us-ascii?Q?RVXYYjqyN6l4Qis6Sx/K1siVq8IF8ywdB/OZo4e3vq9aDt6b37tVEJPws6hI?=
 =?us-ascii?Q?g/Jbe5a8AHkoqbb9UCtzHNQp7ISxy/Km6NgvHTQjqN0aB4J1DKod+10ZJ3qk?=
 =?us-ascii?Q?SJl3djEcNatqe97mvwJhWNMcwg4uanovPRBxsOXAtqtxMGH/RQanCPzJt1z7?=
 =?us-ascii?Q?tTbiJnD2qWfYkwDetej1G9P6bFotfUjVmpoqPwgelfjPNHwr6l9pxbO8f/CQ?=
 =?us-ascii?Q?5iOeVeWNC2nAQISw6N0JAqlznETHqph4na+NLjkScIq3cAY+z6yhk8/eOrIa?=
 =?us-ascii?Q?t51uQkqBjdhBBmtpWRaTP5922Tnnv5Ns6XO6K/m2edn407R0ryVR4qnJiW4B?=
 =?us-ascii?Q?eYuoVPcMlf7/hHZqVAR5DIsR74Yug7nY+sj7z6C6XkyiMDFYhuHel5L5NiHZ?=
 =?us-ascii?Q?5zHgk/cECWWisn+zhFQTxkhWrBR9vEFlzxpIbIKp+cmk8tyW09si3pth8U+U?=
 =?us-ascii?Q?LHeM7BimaJ9+71rDiYLEhaZvu/6MAhTepF0Er+kIh3qm9yCAElt/g305tV14?=
 =?us-ascii?Q?fzo6l+iYZDYpJfHI9hHK7BPxo9uw4uAVLNzpRkI6szkhzM4WcrfnkNEAmfqU?=
 =?us-ascii?Q?wcrOSfNK4JLxCSyHy4zziVj/qWi+be+q89+yh4C8itKh/7IGT6eT8Eo8DQuN?=
 =?us-ascii?Q?j+ENJfR+1yHw0AOlGLujR84VDEv1Dtmm3r04dV4iwz5CjV49LsJLxMQQF4rO?=
 =?us-ascii?Q?ow68OXFOTyRMYnGJI658luV4L1CwWowAAAx1Fr/gLCN/8RoBPMrsamEi2kjr?=
 =?us-ascii?Q?pT5K8vWv2geBBOEAzZgFIWoPxQTp3hGN1JJxo7yGhnqSKCqNDu4j5HQP1x59?=
 =?us-ascii?Q?SjN7ZqRQYLuuGbUt5zFhd/6SIirCkxc8pXUM1Zw6aaXCvyb59oo3g1BHBGSt?=
 =?us-ascii?Q?75r0ln407SOUnBRvMRKT426B1KYzBjU5C4og+Rv5UPZdF0Q4CBt8c38F1xLk?=
 =?us-ascii?Q?MZvFI21awejv0Zo7roPqRELSvqsqCLE/nb3+YbMTiyNpU2yDaZF2cRUPAYUU?=
 =?us-ascii?Q?4r32mlr0HLNYGlgw02ERRE3tVQVEKQZjcZC7RS7CZTTCX3PGcf8VjS74x3kI?=
 =?us-ascii?Q?R1+ETLQtmFTvhSfueLfEuJNhPUPIH2U8HcPM5TrpsFzfB36wVm1I26AqL0cv?=
 =?us-ascii?Q?zwVAgLjAnlkP4bmPU1vDPgBtMBvoV2ou1I8bgoO+2UXdEX33O+K9MFCsekYe?=
 =?us-ascii?Q?RwpSUgPfkLEagwpjz1nDCTrhiWZGzpTRygrjoA1c0sUJ8nvHGLjF0ommY8PK?=
 =?us-ascii?Q?+9+KVqlQIitgH1tLkqwSIngR0O1VsCjpk/PFvEM7IIGmTFzegxy7GNGUB0Tc?=
 =?us-ascii?Q?N+K0ePtqLIQD0BfZApn8wGcU3ue7x9+KWvk3OySVZ+9WFmbrICGBXylcN6hD?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9b7306-f34d-40cc-2147-08dcbe11195f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 16:33:03.0771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4xNzD0F/dd0urh3Ry4QoTsixkk/X08kq2mthGcAY4xscVA7Z/wm49s8T1cTTDCWybBto2z2FgGaRmpkX58b5z7ICjHH5u2iNJJ5uwTeGSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6160
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

On Fri, Aug 16, 2024 at 12:06:12AM GMT, Lucas De Marchi wrote:
>On Thu, Aug 15, 2024 at 09:02:08PM GMT, Matthew Brost wrote:
>>Replace for_each_tile plus a check against primary tile with
>>for_each_remote_tile in tiles_fini. The latter macro does this for us.
>>
>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

since I applied the other 2 fixes from [1], I went ahead and applied
this as well.

[1] https://patchwork.freedesktop.org/series/137362/


Thanks
Lucas De Marchi

