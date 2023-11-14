Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D51C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A24610E214;
	Tue, 14 Nov 2023 11:45:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A043C10E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962346; x=1731498346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hNfCh4lOrqhhGRj4pccRIrKEQoXarHn+Dhgoz7u7fAk=;
 b=Stva8/RD0tH1VFgCv8hIYaExjUxwoU1ezseIJkzqGA4j299ZlirdKowI
 XX+biCeFbFO5kNIHn8EUPdfu+muxbD0HUgMgyX5rGtd3SoY37vBveS8fv
 0tWY6IPPr+W0FKheEhtqcZ4qzFasM74Sos2NcUcsS83yNkCIitfTFTXq5
 AgyzSkp/izkds/P9gcDgZlm3oDU2UtMFHG6cUap+cLc4lmTpB34hsQMaJ
 xRByrObUwAjgeUK0VKg1CttZC5V66VSTJFSVsUcnW3uJ9AEWrcnBbHqfk
 ab68F7N/k+mvvKyTvawe4ugOvhbNEz6tPX9H3ioy4CSsUyrKZ65bPtUvE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389495582"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="389495582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12782294"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:45 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpB4n8Y76/BonDAgxYMfJcxUho+LAvN9E9DQF4BvSSG25D3MmFxXJ+Fw+tVC9Vbdvx+oMHsPGiU6q3guTweUtCYW/BBkjB9krNf52gSx1UB5hcvrgRjkE6Ydf6Bw01SgC1bybHZEDRm0+gsKthExJyRUFsTVeGH8LMPBT9F8ME0xWv6xKny901CAqiZWa7sCfkeR/Z2IRvWchJ6pC3Jx2o0jn5SJVQ/h8Teqb5icvvM2tQvjUvWTAONK1d71rA7vWQZ/FbOHVaOqbqeCnDoSNxYdVJW1k+kHWzLa2SCv0pJ3oEFfbAdIBqiSayrDF0eXIPI1jgW+gfNOP49eM6OHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PtHRSgrd8pjHtW87rH69k45K32wlNCVjfiqKElnZS8=;
 b=ECeFMP6taMqcTqbO67yUk1lyljTHxeXAvgLt/tTYiOiafla4MclahXCRnZ5i0/Fi3eXdeE3TfXeqtIpeMWp3Hs3SegBjtDNqDjqUCGNC9Yb67wZTrx8GM7TmmNRjB8eMYltWh8W9Tzno3h4QxiGIg3mmeS2vdfGA0nQAP5TK+PlHQdHV3lQ1PkMXOfHrVDSR6neiXoS7d4yhSiM0uhgjIls2T6UqJ/5XxJ7oKfTklot4MdC0wuyau5K8j18opwcioH9Er4ZXl2S01nJhgmV8Hn5Qmnz9yOvEmb5VCv+x/RCM31CUrStX+z1X6L4nDeFjRnFnkq0k3n6S0r3ajC0Xgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:44:00 +0100
Message-ID: <20231114114405.2207747-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 79118279-22ff-479b-c81c-08dbe5073b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cH5gcqa2uaKMeauhlEeq4CQXXqdZNBQnlxspNND4s38kzVp+534Uodo4bisPS6CWx9HD0Oq0mT3WKv18pFA280an2yGWHRAANVeB/o02MBdzDTHhuA83vB8qXz2Bggyx2KuGkCaTj28rPnwj7hvmZkUc7a5ankAQJf2hap9kyF6Je7/jc+TO2+/XQoOwox0+5x+8iCim77obIyFhY1XQ15UNqmaLKWwBR3qZyWh6tEp74p2I4cqiIU3t2dqWFHRlzRArvRbvvK/fvZChiY86qBC2h3L1M4YseqN7qW31u84/q4rhysYOQmRsITg4GUtVKaX5Ro3cbKe8kBpMUim20TkTkwlu4DO21xrGPf4c7HSFxoKdWSsXnf9ImXNsb328XdA/GVNvdGUumkj/nl02Hvjzoao5GUF4smkxRMqMvwMPCDSk1xPk/XRMjKfGsX9tDVucVraAMgll6GlZ4c9WV//Jm3NAZHHMJYj7pYPLdKAqkpvdsMuxJTnM6FOijy3Uu/5he5f9yWVYl9ggESl4w1D5Qu3ufFhqDYWTvZqKb0y04YfEm+9n8xOq3iCUmUW4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkpaZDlyRGg3eTIwaURTTStYQ3k5eGU0U2pHWlozK3I1VDRhdUJ0VXVlTVV1?=
 =?utf-8?B?QndncEY0WDdIUkFTaVFFYWdlblZkMkJXWCtCaDFXL0pVRGJsQXJuanA5Q25p?=
 =?utf-8?B?Z25PUlFMZ1A5UGpLa2gxYkZHa2pibDRvM1RIRnZGVjdlN1RIeHJnZjk3RDBN?=
 =?utf-8?B?ZFFkUzVpRVlJTDRPNFBkMFRnL0ZQMmlQSHoxY2szUnlzeUZDeUJKbURHeStp?=
 =?utf-8?B?SVdCQzJSZmhNak1vbkhYdmJsbFF4ZEZPR0dnOFB4RkErUlVBSGdCQVZFcG1j?=
 =?utf-8?B?YURVL3h2SVc4dlk3eDg4bzJHUlIyYitmS1N5T3htZnV0YkNWRThVT2RtOUw4?=
 =?utf-8?B?QU8vREhrYWx6cDl4K1J5UXFHQ2dQdlFLbXVVZ1RlaWozZUtJaCt0RFJrSWZB?=
 =?utf-8?B?SDhwTndUeWJpOXVoTWF1cXU4N2loSnNOdzJwSlludWNSQ2NwYlZoTXZQMDc0?=
 =?utf-8?B?SDZHUFhSU29lSWU3czFjQmkvMkM1VGtrOXFia29MLzE2S29remNHWUVYYmRy?=
 =?utf-8?B?SDdxV0hCQVZvZU15aWJwVms2NXVKSVBPZUVmbTBjRGZhR0NUc0ptNHA4S0t4?=
 =?utf-8?B?MTl3ZlVCZVlRcDh6MnZPVnBNVnZlYm9pQW1Jd1ZPa1FGQkpIajVqcE5XaXZl?=
 =?utf-8?B?Nm9PSmQ3eVl5OXg1WGNtcWhXSkZZWVF1a04yelRETmVwcnU0dHRRWkwyYjVz?=
 =?utf-8?B?S0E5NFpUNXd5MEdWWVVkZy9KMkI4R3l0SjBQenc1d3owWmpnMy80cGIwRjE0?=
 =?utf-8?B?ZnJ2TnFxeXBONTdrZmo2YUZ4UUFzZEdKbC9QVm1mQk9vTGF5T3Rrb3JqRlJu?=
 =?utf-8?B?eWN2SHBRa1M0T1c0Q3FGL3QrZ0svNTI2cU9FUTc2V01icHFNc0JMUkw1WFk5?=
 =?utf-8?B?aHoyL01qa3ZyVWhWVlVaK2F2dzlxRE5TdXlnSmJnU1puaG4va1FyazRjMTA3?=
 =?utf-8?B?OFhtNml4Y05lK3U0eEFLMnh1SG1TT1kybThMdllkcGZ0RnpLRzU4R0pHM2F6?=
 =?utf-8?B?SWczZHpIRTlrbUhadno4OUpmTWpkZHZ1VzhlbHFtNnk3blhiMWJoK04xWER5?=
 =?utf-8?B?SmJvaUFDWHlpczNEQzN6VnN3SlQ5cEVscytCZWRueUxvWFhZYzBTTzFRN3Ux?=
 =?utf-8?B?b0RoZ3QwT3pHVEFHcDBXVHpHakM3N0czdklVbGVLQ3ZWcVhsYnNPdGVBQmlx?=
 =?utf-8?B?K1dSdnVPS2tPZkZmSzBBNUVIZ2lvYnhhTzQxS0VsM3ZuN3BySTJqdzZPNFh4?=
 =?utf-8?B?SjJQNDBkNnh0Q2JPTlp6QldJSzlyUVVYOHduUTdBRXRlcmM4UXNITkZDa0w5?=
 =?utf-8?B?Qkd0dTlvVFN2Y2FVVmIzclorcmZSVWtqbUpkZnFhUlB1M1pUV2RLdUh6bnhC?=
 =?utf-8?B?Yi9BSXNvWEttYnh0MWJyS1Y4QjBDVUxsVkE4V1VaNTRYQzY4UDlyWnhITHMr?=
 =?utf-8?B?R1RMZk9HcG9HbkQ1N21EZy93OWFPcW5CN3JwTzFUYUhES253c1ltcnNsN0NS?=
 =?utf-8?B?bXR6cUJSYzNsclJ3ZUJ5eWRpTnZQWTZlM3pPWk1FM0lDYTF1anREdjdwd2hu?=
 =?utf-8?B?QkVhdVZ0V2tidy9tdE1vL0dEOVhFTmwrS1loeGVMTm0rN2RVWk9UOXZ5OTRh?=
 =?utf-8?B?b2VXLzBQNmJDc0VPQnRPT1c4Q3VPZklBaVZQYnMweTR4dHkyNkFQSURBZkM1?=
 =?utf-8?B?Rm1ZdFNGOERnNHVkSHRudUlKWUo3RDV3YWpleGhmK1V1dEZRdENwditSNlZy?=
 =?utf-8?B?YU9HcURRZHR2c1JoN284UWdpcnRNVnhpQ0FhK3dnMUt0VitHTkcyK2Q3dTU5?=
 =?utf-8?B?QzB6VW9rd3BqTS9KdFBMQTZlblNXeGw0MXpYbEdZOGEyZ2Mza1JCbk9yaGU1?=
 =?utf-8?B?Sm02Q0lyTWN6NWhEd1hUbGwyRHJHaGpXc05COEhmVHBnRjA2L1F1T1BZTERx?=
 =?utf-8?B?MVFjR3U0Q1llNjM0Njh2Q2JZd1pJR2dRblJWMXI4N0dzL3hnNVpmT1NKNnRh?=
 =?utf-8?B?NXhkdzB0N042cHRla0JGb3V5RWJRSTF2L2FvL1ByQitTbkJMdDJLdWh6Q0s5?=
 =?utf-8?B?Wk5oZnZKcWxRdk9HZHVqQUE1aFRXVlFrdmFMSTd6bjFnZDNLazQ1aDNnaVds?=
 =?utf-8?B?K20yYWxtakFZdlVQN1JIb2Fqd3VyZTgyaUlMSC82cXpCL0FOZm5IRUJMc25O?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79118279-22ff-479b-c81c-08dbe5073b86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:43.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxmXXUXE+EDvvciG9VoeYBTLfo/uce6bnY9I90N3WLxkFVY4OGHs15+w64j3/qKveEbgvEUZU2+hezTZiTB0jp6vnmaCI9syA28gY0SgDbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 15/20] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The firmware loading for GuC is about to be moved, and will happen much
earlier in the probe process, when local-memory is not yet available.
While this has the potential to make the firmware loading process
slower, this is only happening during probe and full device reset.
Since both are not hot-paths - store all UC-like firmware in system
memory.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index df46751fb5959..b04dd7d034d83 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -636,8 +636,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	err = uc_fw_request(uc_fw, &fw);
@@ -649,7 +647,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.42.1

